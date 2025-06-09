import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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

class BodyPictureRepository implements IBodyPictureFacade {
  BodyPictureRepository({
    required this.databaseService,
    required this.imagesFolderPath,
    required this.thumbnailsFolderPath,
  });

  final DatabaseService databaseService;
  final String imagesFolderPath;
  final String thumbnailsFolderPath;

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
      // await cacheService.clear();

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

      final orginalFile = File(
        '$imagesFolderPath/$orginalFileName',
      );
      final thumbnailFile = File(
        '$thumbnailFileName/$thumbnailFileName',
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
  Future<Either<String, List<VaultImage>>> getAllBodyPictures() async {
    try {
      final db = await databaseService.database;

      final data = await db.query(
        'pictures',
      );

      final dataList = data.map(VaultImage.fromJson).toList();

      return right(dataList);
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
  Future<Either<String, VaultImage>> saveBodyPicture(
    SaveVaultImageModel bodyPicture,
  ) async {
    try {
      final imageNameWithPathToSave = imagesFolderPath +
          _fileNameCreator(bodyPicture.path, bodyPicture.tag);

      final imageThumbnailNameWithPathToSave = thumbnailsFolderPath +
          _thumbnailFileNameCreator(bodyPicture.path, bodyPicture.tag);

      // Save image and thumbnail in the app's documents directory
      // Create the image file
      final imageFile = File(imageNameWithPathToSave);
      await imageFile.writeAsBytes(File(bodyPicture.path).readAsBytesSync());

      final thumbnailBytes = await FlutterImageCompress.compressWithFile(
        bodyPicture.path,
        minWidth: 400,
        minHeight: 400,
        quality: 94,
      );

      if (thumbnailBytes == null) {
        return left('Image compression failed');
      }

      // Create the thumbnail file
      final thumbnailFile = File(imageThumbnailNameWithPathToSave);
      await thumbnailFile.writeAsBytes(
        thumbnailBytes,
      );

      final id = const Uuid().v1();

      final dbData = VaultImage(
        id: id,
        tag: bodyPicture.tag,
        file: imageNameWithPathToSave,
        thumbnailFile: imageThumbnailNameWithPathToSave,
        date: bodyPicture.date,
        note: '',
      );

      // final uiData = DisplayVaultImageModel(
      //   id: id,
      //   tag: bodyPicture.tag,
      //   file: encryptedFile.path,
      //   thumbnailData: thumbnailImageBytes,
      //   date: bodyPicture.date,
      //   nonce: baseCodedNonce,
      // );
      final db = await databaseService.database;

      final result = await db.insert('pictures', dbData.toJson());

      //todo: check result and handle result

      return right(dbData);
    } on DatabaseException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    } finally {
      // _deleteImageAndThumbnailByName(
      //   imageN,
      //   imageThumbnailNameWithPathToSave,
      // )
      // todo: Implement a way to delete the image and thumbnail if needed
    }
  }

  _deleteImageAndThumbnailByName(
    String fileNamePath,
    String thumbnailFileNamePath,
  ) async {
    // Delete both files
    File(fileNamePath).deleteSync();
    File(thumbnailFileNamePath).deleteSync();
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
  Future<Either<String, String>> backupPhotosToZip() async {
    throw UnimplementedError();
    // try {
    //   final formatter = DateFormat('dd_mm_yyyy_hh_mm_ss');
    //   // Check for permission
    //   final photoPath = await cacheService.getCacheDirectory();
    //   final fileName = formatter.format(DateTime.now());
    //   final dataDir = Directory(photoPath);
    //   // Source Directory
    //   final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
    //     ExternalPath.DIRECTORY_DOCUMENTS,
    //   );
    //   final storeFile = File('$downloadPath/$fileName.zip');
    //   await storeFile.create(recursive: true);
    //   await ZipFile.createFromDirectory(
    //     sourceDir: dataDir,
    //     zipFile: storeFile,
    //     recurseSubDirs: true,
    //   );
    //   return right(storeFile.path);
    // } catch (e) {
    //   return left(e.toString());
    // }
  }

  /// Create filename by current date, given tag, path's extenstion
  String _fileNameCreator(String path, String tag) {
    final extension = path.split('.').last;
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final timestamp = formatter.format(DateTime.now());
    return '${timestamp}_$tag.$extension';
  }

  /// Thumbnail file name creator
  String _thumbnailFileNameCreator(String path, String tag) {
    final extension = path.split('.').last;
    final formatter = DateFormat('yyyyMMdd_HHmmss');
    final timestamp = formatter.format(DateTime.now());
    return '${timestamp}_${tag}_thumbnail.$extension';
  }
}
