import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_bodypicture_facade.dart';
import 'package:watcha_body/data/domain/models/compare_images_model.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/services/cache_service/cache_service.dart';
import 'package:watcha_body/services/encryption_service/src/encryption_service.dart';

class BodyPictureRepository implements IBodyPictureFacade {
  BodyPictureRepository({
    required this.databaseService,
    required this.encryptService,
    required this.cacheService,
  });

  final DatabaseService databaseService;
  final EncryptService encryptService;
  final CacheService cacheService;

  static const encrytedFolderPath = 'encrypted_images';

  // static queries

  @override
  Future<Either<String, String>> addTag(String tag) async {
    try {
      final query = 'INSERT INTO tags (tag) VALUES ("$tag")';
      final db = await databaseService.database;
      await db.execute(query);
      return right(tag);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteAllBodyPictures() async {
    try {
      await cacheService.clear();

      // delete all encrypted images from [encryptedFolderPath]]]
      final appDocDir = await getApplicationDocumentsDirectory();
      final encryptedFolderPath = '${appDocDir.path}/encrypted_images';

      if (File(encryptedFolderPath).existsSync()) {
        final encryptedFiles = Directory(encryptedFolderPath).listSync();
        for (final file in encryptedFiles) {
          await file.delete();
        }
      }

      // delete all data from database table [pictures]

      final db = await databaseService.database;

      final data = await db.delete(
        'pictures',
      );

      if (data != 1) {
        return left('BAD HAPPENED');
      }

      return right(unit);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteBodyPicture(String id) async {
    try {
      final extractedfileName = id.split('/').last;
      final appDocDir = await getApplicationDocumentsDirectory();
      final encryptedFile =
          File('${appDocDir.path}/$encrytedFolderPath/$extractedfileName.enc');
      final db = await databaseService.database;
      final result = await db.rawDelete(
        'DELETE FROM pictures WHERE path = ?',
        [encryptedFile.path],
      );

      if (result != 1) {
        return left('Failed to delete picture, No such id');
      }

      // delete from cache
      await cacheService.delete(extractedfileName);

      // delete from encrypted folder
      if (encryptedFile.existsSync()) {
        await encryptedFile.delete();
      }
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
    // throw UnimplementedError();
  }

  @override
  Future<Either<String, List<VaultImage>>> getAllBodyPictures() async {
    try {
      final db = await databaseService.database;

      final data = await db.query(
        'pictures',
      );

      final encryptedDataList = data.map(VaultImage.fromJson).toList();

      // final decrytedDataList = encryptedDataList.map((e) async {
      //   final d = e.copyWith(
      //     path: await cacheService.get(e.path) ?? '',
      //   );
      //   return d;
      // }).toList();

      // final d = await compute((message) {

      // }, message);

      final rootToken = RootIsolateToken.instance!;
      final decrytedDataList = await Isolate.run<List<VaultImage>>(
        () async {
          BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
          final decrytedDataList = <VaultImage>[];
          try {
            for (final e in encryptedDataList) {
              // also trim .enc at last
              final fileName = e.path.split('/').last.replaceFirst('.enc', '');

              final data = await encryptService
                  .decryptPhoto(File(e.path).readAsBytesSync());

              final newCachedPath =
                  await cacheService.storeFromBytes(data, fileName);
              final d = e.copyWith(
                path: newCachedPath,
              );
              decrytedDataList.add(d);
            }
          } on Exception catch (e) {
            debugPrint(e.toString());
            rethrow;
          }
          return decrytedDataList;
        },
      );

      // final decrytedDataList = <VaultImage>[];

      // for (final e in encryptedDataList) {
      //   // also trim .enc at last
      //   final fileName = e.path.split('/').last.replaceFirst('.enc', '');

      //   final data =
      //       await encryptService.decryptPhoto(File(e.path).readAsBytesSync());

      //   final newCachedPath = await cacheService.storeFromBytes(data, fileName);
      //   final d = e.copyWith(
      //     path: newCachedPath,
      //   );
      //   decrytedDataList.add(d);
      // }

      return right(decrytedDataList);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<String>>> getAllTags() async {
    const query = 'SELECT *  FROM tags';
    final db = await databaseService.database;
    final result = await db.rawQuery(query);

    // result is list of {id: 1, tag: chest}
    // return list of tags
    final tags = result.map((e) => e['tag']! as String).toList();

    log(tags.toString());

    return right(tags);
  }

  @override
  Future<Either<String, VaultImage>> getBodyPictureById(int id) {
    // TODO: implement getBodyPictureById
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<VaultImage>>> getBodyPicturesByTag(String tag) {
    // TODO: implement getBodyPicturesByTag
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> removeTag(String tag) {
    // TODO: implement removeTag
    throw UnimplementedError();
  }

  @override
  Future<Either<String, VaultImage>> saveBodyPicture(
    VaultImage bodyPicture,
  ) async {
    // Save picture to Flutter secure storage

    // Get the app's documents directory
    final appDocDir = await getApplicationDocumentsDirectory();
    // get extension of the orginal file
    final extension = bodyPicture.path.split('.').last;
    final fileName = '${DateTime.now()}.$extension'; // Unique filename

    // Encrypt Image

    final rootToken = RootIsolateToken.instance!;
    final encryptedImageData = await Isolate.run(
      () async {
        BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
        return encryptService.encryptPhoto(filePath: bodyPicture.path);
      },
    );

    // check [encryptedFolderPath] exists
    if (!Directory('${appDocDir.path}/$encrytedFolderPath').existsSync()) {
      await Directory('${appDocDir.path}/$encrytedFolderPath').create();
    }

    // todo: correct it

    final encryptedFile =
        File('${appDocDir.path}/$encrytedFolderPath/$fileName.enc');
    await encryptedFile.writeAsBytes(encryptedImageData);

    final savedImageInTemporaryDirectory =
        await cacheService.store(bodyPicture.path, fileName);
    // await File(bodyPicture.path).copy('${appDocDir.path}/temp/$fileName');

    final dbData = bodyPicture.copyWith(
      path: encryptedFile.path,
    );

    final uiData = bodyPicture.copyWith(
      // path: '${appDocDir.path}/$fileName',
      path: savedImageInTemporaryDirectory,
    );
    final db = await databaseService.database;

    final result = await db.insert('pictures', dbData.toJson());

    //todo: check result and handle result

    return right(uiData);

    // Save details to database

    // TODO: implement saveBodyPicture
    // throw UnimplementedError();
  }

  // _saveFileInTempDirectoryViaPath(String path) async {
  //   return await File(path)
  //       .copy('${appDocDir.path}/temp/$fileName');
  // }

  @override
  Future<Either<String, VaultImage>> updateBodyPicture(VaultImage bodyPicture) {
    // TODO: implement updateBodyPicture
    throw UnimplementedError();
  }

  @override
  Future<Either<String, CompareImagesModel>> getBodyPicturesByTagAndTwoDate({
    required String tag,
    required DateTime firstdate,
    required DateTime seconddate,
  }) async {
    try {
      final db = await databaseService.database;
      final firstResult = await db.query(
        'pictures',
        where: 'tag = ? AND STRFTIME("%Y-%m-%d", date) = ?',
        whereArgs: [tag, firstdate.toIso8601String().substring(0, 10)],
      );
      final secondResult = await db.query(
        'pictures',
        where: 'tag = ? AND STRFTIME("%Y-%m-%d", date) = ?',
        whereArgs: [tag, seconddate.toIso8601String().substring(0, 10)],
      );
      final firstImagesSet = firstResult.map(VaultImage.fromJson).toList();
      final secondImagesSet = secondResult.map(VaultImage.fromJson).toList();

      // final firstImages = firstImagesSet.map((e) => e.copyWith(path: cacheService.store(e.path))).toList();
      // final secondImages = secondImagesSet.map((e) => e.path).toList();

      final firstImages = <VaultImage>[];
      final secondImages = <VaultImage>[];

      for (final e in firstImagesSet) {
        final fileName = e.path.split('/').last.replaceFirst('.enc', '');
        final newData = e.copyWith(
          path: await cacheService.get(fileName) ?? '',
        );
        firstImages.add(newData);
      }

      for (final e in secondImagesSet) {
        final fileName = e.path.split('/').last.replaceFirst('.enc', '');
        final newData = e.copyWith(
          path: await cacheService.get(fileName) ?? '',
        );
        secondImages.add(newData);
      }

      return right(
        CompareImagesModel(
          firstImages: firstImages,
          secondImages: secondImages,
        ),
      );
    } catch (exception) {
      return left(exception.toString());
    }
  }

  @override
  Future<Either<String, Unit>> clearLocalCache() async {
    try {
      await cacheService.clear();
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
