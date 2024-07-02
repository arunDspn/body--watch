import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/display_vault_image_model.dart';
import 'package:watcha_body/data/domain/i_bodypicture_facade.dart';
import 'package:watcha_body/data/domain/models/compare_images_model.dart';
import 'package:watcha_body/data/domain/models/save_vault_image_model.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/services/cache_service/cache_service.dart';
import 'package:watcha_body/services/encryption_service/src/encryption_service.dart';
import 'package:watcha_body/src/rust/api/resizer.dart';

class BodyPictureRepository implements IBodyPictureFacade {
  BodyPictureRepository({
    required this.databaseService,
    required this.encryptService,
    required this.cacheService,
  });

  final DatabaseService databaseService;
  final EncryptService encryptService;
  final CacheService cacheService;

  static const encrytedImagesFolderPath = 'encrypted_images';
  static const encrytedThumbnailsFolderPath = 'encrypted_thumbnails';

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
      final db = await databaseService.database;
      final itemDetailsRawData =
          await db.query('pictures', where: 'id = ?', whereArgs: [id]);

      if (itemDetailsRawData.isEmpty) {
        return left('No ID found');
      }
      final itemDetails = VaultImage.fromJson(itemDetailsRawData.first);

      final orginalFileName = itemDetails.file;
      final thumbnailFileName = itemDetails.thumbnailFile;

      final appDocDir = await getApplicationDocumentsDirectory();
      final orginalFile = File(
        '${appDocDir.path}/$encrytedImagesFolderPath/$orginalFileName',
      );
      final thumbnailFile = File(
        '${appDocDir.path}/$encrytedThumbnailsFolderPath/$thumbnailFileName',
      );

      // Deleting from directories
      await orginalFile.delete();
      await thumbnailFile.delete();

      // Deleting from database

      final result = await db.delete(
        'pictures',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result != 1) {
        return left('Failed to delete picture, No such id');
      }

      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<DisplayVaultImageModel>>>
      getAllBodyPictures() async {
    try {
      final db = await databaseService.database;

      final data = await db.query(
        'pictures',
      );

      final encryptedDataList = data.map(VaultImage.fromJson).toList();

      final decrytedDataList = <DisplayVaultImageModel>[];
      for (final e in encryptedDataList) {
        // also trim .enc at last
        // final fileName =
        //     e.thumbnailPath.split('/').last.replaceFirst('.enc', '');
        final appDocDir = await getApplicationDocumentsDirectory();
        final thumbnailFile = File(
          '${appDocDir.path}/$encrytedThumbnailsFolderPath/${e.thumbnailFile}',
        );

        final encryptedFilesPath =
            '${appDocDir.path}/$encrytedImagesFolderPath/';

        final data =
            await encryptService.decryptPhoto(thumbnailFile.readAsBytesSync());

        // final newCachedPath = await cacheService.storeFromBytes(data, fileName);
        // final d = e.copyWith(
        //   path: newCachedPath,
        // );
        final displayModel = DisplayVaultImageModel(
          id: e.id,
          tag: e.tag,
          file: encryptedFilesPath + e.file,
          thumbnailData: data as Uint8List,
          date: e.date,
        );
        decrytedDataList.add(displayModel);
      }

      // final decrytedDataList = encryptedDataList.map((e) async {
      //   final d = e.copyWith(
      //     path: await cacheService.get(e.path) ?? '',
      //   );
      //   return d;
      // }).toList();

      // final d = await compute((message) {

      // }, message);

      // final rootToken = RootIsolateToken.instance!;
      // final decrytedDataList = await Isolate.run<List<VaultImage>>(
      //   () async {
      //     BackgroundIsolateBinaryMessenger.ensureInitialized(rootToken);
      //     final decrytedDataList = <VaultImage>[];
      //     try {
      //       for (final e in encryptedDataList) {
      //         // also trim .enc at last
      //         final fileName = e.path.split('/').last.replaceFirst('.enc', '');

      //         final data = await encryptService
      //             .decryptPhoto(File(e.path).readAsBytesSync());

      //         final newCachedPath =
      //             await cacheService.storeFromBytes(data, fileName);
      //         final d = e.copyWith(
      //           path: newCachedPath,
      //         );
      //         decrytedDataList.add(d);
      //       }
      //     } on Exception catch (e) {
      //       debugPrint(e.toString());
      //       rethrow;
      //     }
      //     return decrytedDataList;
      //   },
      // );

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
    } catch (e) {
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
  Future<Either<String, DisplayVaultImageModel>> saveBodyPicture(
    SaveVaultImageModel bodyPicture,
  ) async {
    try {
      // Get the app's documents directory
      final appDocDir = await getApplicationDocumentsDirectory();
      // get extension of the orginal file
      final extension = bodyPicture.path.split('.').last;
      final orginalFileNameToSave =
          '${DateTime.now()}_${bodyPicture.tag}.$extension.enc'; // Unique filename
      final thumbnailFileNameToSave =
          '${DateTime.now()}_${bodyPicture.tag}_thumbnail.$extension.enc'; // Unique filename

      // Encrypting
      // Orginal File
      final encryptedImageData =
          await encryptService.encryptPhotoFromPath(filePath: bodyPicture.path);

      // Thumbnail

      // img.Image? sourceImage;
      // if (extension == 'jpg' || extension == 'jpeg') {
      //   sourceImage = img.decodeJpg(File(bodyPicture.path).readAsBytesSync());
      // } else if (extension == 'png') {
      //   sourceImage = img.decodePng(File(bodyPicture.path).readAsBytesSync());
      // } else if (extension == 'heic') {
      //   throw UnimplementedError();
      // } else {
      //   throw UnimplementedError();
      // }

      // if (sourceImage == null) {
      //   throw Exception('ThumbnailImageBytes is null');
      // }

      // final thumbnailImage = img.copyResize(
      //   sourceImage,
      //   width: 100,
      // );

      // Uint8List thumbnailImageBytes;
      // if (extension == 'jpg' || extension == 'jpeg') {
      //   thumbnailImageBytes = img.encodeJpg(thumbnailImage);
      // } else if (extension == 'png') {
      //   thumbnailImageBytes = img.encodePng(thumbnailImage);
      // } else if (extension == 'heic') {
      //   throw UnimplementedError();
      // } else {
      //   throw UnimplementedError();
      // }

      // final _saveDir = await ExternalPath.getExternalStoragePublicDirectory(
      //   ExternalPath.DIRECTORY_DOCUMENTS,
      // );

      // final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');

      // final _file = await File(
      //   '$_saveDir/watchbody/wb_backup_${formatter.format(DateTime.now())}.$extension',
      // ).create(recursive: true);

      // // await _file.writeAsBytes(data);

      // await img.writeFile(_file.path, thumbnailImageBytes);

      final thumbnailImageBytes = await generateThumbnail(
        imageBytes: File(bodyPicture.path).readAsBytesSync(),
      );

      final encryptedThumbnailImageData = await encryptService
          .encryptPhotoFromBytes(photoBytes: thumbnailImageBytes);

      // check [encryptedFolderPath] exists
      if (!Directory('${appDocDir.path}/$encrytedImagesFolderPath')
              .existsSync() &&
          !Directory('${appDocDir.path}/$encrytedThumbnailsFolderPath')
              .existsSync()) {
        await Directory('${appDocDir.path}/$encrytedImagesFolderPath').create();
        await Directory('${appDocDir.path}/$encrytedThumbnailsFolderPath')
            .create();
      }

      // Saving encrypted files

      // Source
      // todo: correct it
      final encryptedFile = File(
        '${appDocDir.path}/$encrytedImagesFolderPath/$orginalFileNameToSave',
      );
      await encryptedFile.writeAsBytes(encryptedImageData);

      // Thumbnail
      final encryptedThumbnailFile = File(
        '${appDocDir.path}/$encrytedThumbnailsFolderPath/$thumbnailFileNameToSave',
      );
      await encryptedThumbnailFile.writeAsBytes(encryptedThumbnailImageData);

      // final savedImageInTemporaryDirectory =
      //     await cacheService.store(bodyPicture.path, orginalFileNameToSave);
      // await File(bodyPicture.path).copy('${appDocDir.path}/temp/$fileName');

      // final dbData = bodyPicture.copyWith(
      //   path: encryptedFile.path,
      // );

      // final uiData = bodyPicture.copyWith(
      //   // path: '${appDocDir.path}/$fileName',
      //   path: savedImageInTemporaryDirectory,
      // );

      final id = const Uuid().v1();

      final dbData = VaultImage(
        id: id,
        tag: bodyPicture.tag,
        file: orginalFileNameToSave,
        thumbnailFile: thumbnailFileNameToSave,
        date: bodyPicture.date,
      );

      final uiData = DisplayVaultImageModel(
        id: id,
        tag: bodyPicture.tag,
        file: encryptedFile.path,
        thumbnailData: thumbnailImageBytes,
        date: bodyPicture.date,
      );
      final db = await databaseService.database;

      final result = await db.insert('pictures', dbData.toJson());

      //todo: check result and handle result

      return right(uiData);
    } on DatabaseException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    } finally {
      // _deleteImageAndThumbnailByName(, thumbnailFileName)
    }
  }

  _deleteImageAndThumbnailByName(
    String fileName,
    String thumbnailFileName,
  ) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    await File('${appDocDir.path}/$encrytedImagesFolderPath/$fileName.enc')
        .delete();

    // Thumbnail
    await File(
      '${appDocDir.path}/$encrytedThumbnailsFolderPath/$thumbnailFileName.enc',
    ).delete();
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

      final firstImages = firstImagesSet
          .map(
            (e) => e.file,
          )
          .toList();
      final secondImages = secondImagesSet
          .map(
            (e) => e.file,
          )
          .toList();

      // for (final e in firstImagesSet) {
      //   final fileName = e.path.split('/').last.replaceFirst('.enc', '');
      //   final newData = e.copyWith(
      //     path: await cacheService.get(fileName) ?? '',
      //   );
      //   firstImages.add(newData.path);
      // }

      // for (final e in secondImagesSet) {
      //   final fileName = e.path.split('/').last.replaceFirst('.enc', '');
      //   final newData = e.copyWith(
      //     path: await cacheService.get(fileName) ?? '',
      //   );
      //   secondImages.add(newData.path);
      // }

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

  @override
  Future<Either<String, String>> backupPhotosToZip() async {
    try {
      final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');
      // Check for permission
      final photoPath = await cacheService.getCacheDirectory();
      final fileName = formatter.format(DateTime.now());
      final dataDir = Directory(photoPath);
      // Source Directory
      final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS,
      );
      final storeFile = File('$downloadPath/$fileName.zip');
      await storeFile.create(recursive: true);
      await ZipFile.createFromDirectory(
        sourceDir: dataDir,
        zipFile: storeFile,
        recurseSubDirs: true,
      );
      return right(storeFile.path);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Uint8List> decryptImageFromPath(
    String path,
  ) async {
    try {
      final bytes = await encryptService.decryptPhotoFromPath(path);
      return bytes as Uint8List;
    } catch (e) {
      rethrow;
    }
  }
}
