import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/body_picture/i_bodypicture_facade.dart';
import 'package:watcha_body/data/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/data/domain/body_picture/models/save_vault_image_request.dart';
import 'package:watcha_body/data/domain/body_picture/models/vault_image_entity.dart';
import 'package:watcha_body/data/domain/models/compare_images_model.dart';
import 'package:watcha_body/data/domain/body_picture/models/vault_image_model.dart';

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
  Future<Either<String, ImageTagModel>> addTag(String tag) async {
    try {
      final db = await databaseService.database;
      final id = await db.insert(DatabaseService.tagsTable, {'tag': tag});
      final insertedTag = ImageTagModel(id: id, tag: tag);
      return right(insertedTag);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  /// Get Single Tag by ID
  Future<Either<String, ImageTagModel>> getTagById(int id) async {
    try {
      final query = 'SELECT * FROM ${DatabaseService.tagsTable} WHERE id = $id';
      final db = await databaseService.database;
      final result = await db.rawQuery(query);
      if (result.isEmpty) {
        return left('No tag found for the given id');
      }
      final tag = ImageTagModel.fromJson(result.first);
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
  Future<Either<String, void>> deleteBodyPicture(int id) async {
    try {
      final db = await databaseService.database;
      final itemDetailsRawData = await db.rawQuery(
        '''
          SELECT 
            p.id,
            p.file,
            p.thumbnail_file,
            p.date,
            p.note,
            t.tag,
            GROUP_CONCAT(mt.name) as targets
          FROM pictures p
          INNER JOIN tags t ON p.tag_id = t.id
          LEFT JOIN picture_targets pt ON p.id = pt.picture_id
          LEFT JOIN ${DatabaseService.measurementTargetsTable} mt ON pt.target_id = mt.id
          WHERE p.id = ?
          GROUP BY p.id
        ''',
        [id],
      );

      if (itemDetailsRawData.isEmpty) {
        return left('No ID found');
      }

      final row = itemDetailsRawData.first;
      final targets = row['targets'] != null
          ? (row['targets'] as String).split(',')
          : <String>[];

      final itemDetails = VaultImageModel(
        id: row['id'] as int,
        tag: row['tag'] as String,
        targets: targets,
        file: row['file'] as String,
        thumbnailFile: row['thumbnail_file'] as String,
        date: DateTime.parse(row['date'] as String),
        note: row['note'] as String,
      );

      final orginalFileName = itemDetails.file;
      final thumbnailFileName = itemDetails.thumbnailFile;

      final orginalFile = File(
        '$imagesFolderPath/$orginalFileName',
      );
      final thumbnailFile = File(
        '$thumbnailsFolderPath/$thumbnailFileName',
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
  Future<Either<String, List<VaultImageModel>>> getAllBodyPictures() async {
    try {
      final db = await databaseService.database;

      final data = await db.rawQuery(
        '''
          SELECT 
            p.id,
            p.file,
            p.thumbnail_file,
            p.date,
            p.note,
            t.tag,
            GROUP_CONCAT(mt.name) as targets
          FROM pictures p
          INNER JOIN tags t ON p.tag_id = t.id
          LEFT JOIN picture_targets pt ON p.id = pt.picture_id
          LEFT JOIN ${DatabaseService.measurementTargetsTable} mt ON pt.target_id = mt.id
          GROUP BY p.id
          ORDER BY p.date DESC
        ''',
      );

      final dataList = data.map((row) {
        final targets = row['targets'] != null
            ? (row['targets']! as String).split(',')
            : <String>[];

        return VaultImageModel(
          id: row['id']! as int,
          tag: row['tag']! as String,
          targets: targets,
          file: row['file']! as String,
          thumbnailFile: row['thumbnail_file']! as String,
          date: DateTime.parse(row['date']! as String),
          note: row['note']! as String,
        );
      }).toList();

      return right(dataList);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ImageTagModel>>> getAllTags() async {
    const query = 'SELECT *  FROM tags';
    final db = await databaseService.database;
    final result = await db.rawQuery(query);

    // result is list of {id: 1, tag: chest}
    // return list of tags
    final tags = result.map(ImageTagModel.fromJson).toList();

    log(tags.toString());

    return right(tags);
  }

  @override
  Future<Either<String, VaultImageModel>> getBodyPictureById(int id) async {
    try {
      final db = await databaseService.database;

      final result = await db.rawQuery(
        '''
          SELECT 
            p.id,
            p.file,
            p.thumbnail_file,
            p.date,
            p.note,
            t.tag,
            GROUP_CONCAT(mt.name) as targets
          FROM pictures p
          INNER JOIN ${DatabaseService.tagsTable} t ON p.tag_id = t.id
          LEFT JOIN ${DatabaseService.pictureTargetsTable} pt ON p.id = pt.picture_id
          LEFT JOIN ${DatabaseService.measurementTargetsTable} mt ON pt.target_id = mt.id
          WHERE p.id = ?
          GROUP BY p.id
        ''',
        [id],
      );

      if (result.isEmpty) {
        return left('No picture found for the given id');
      }

      final row = result.first;
      final targets = row['targets'] != null
          ? (row['targets']! as String).split(',')
          : <String>[];

      final bodyPicture = VaultImageModel(
        id: row['id']! as int,
        tag: row['tag']! as String,
        targets: targets,
        file: row['file']! as String,
        thumbnailFile: row['thumbnail_file']! as String,
        date: DateTime.parse(row['date']! as String),
        note: row['note']! as String,
      );

      return right(bodyPicture);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<VaultImageModel>>> getBodyPicturesByTag(
      String tag) {
    // TODO: implement getBodyPicturesByTag
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> removeTag(String tag) {
    // TODO: implement removeTag
    throw UnimplementedError();
  }

  @override
  Future<Either<String, VaultImageModel>> saveBodyPicture(
    SaveVaultImageRequest request,
  ) async {
    final imageName = _fileNameCreator(request.path, request.tag);
    final thumbnailName = _thumbnailFileNameCreator(
      request.path,
      request.tag,
    );

    try {
      final imageNameWithPathToSave = '$imagesFolderPath/$imageName';

      final imageThumbnailNameWithPathToSave =
          '$thumbnailsFolderPath/$thumbnailName';

      // Save image and thumbnail in the app's documents directory
      // Create the image file
      final imageFile = File(imageNameWithPathToSave);
      await imageFile.writeAsBytes(File(request.path).readAsBytesSync());

      final thumbnailBytes = await FlutterImageCompress.compressWithFile(
        request.path,
        minWidth: 400,
        minHeight: 400,
        quality: 94,
      );

      if (thumbnailBytes == null) {
        // Delete the saved image file if thumbnail creation fails
        await imageFile.delete();

        return left('Image compression failed');
      }

      // Create the thumbnail file
      final thumbnailFile = File(imageThumbnailNameWithPathToSave);
      await thumbnailFile.writeAsBytes(
        thumbnailBytes,
      );

      final dbData = VaultImageEntity(
        tagId: request.tagId,
        file: imageName,
        thumbnailFile: thumbnailName,
        date: request.date,
        note: request.note,
      );

      final db = await databaseService.database;

      // Insert picture - SQLite will auto-generate the ID
      final pictureId = await db.insert(
        DatabaseService.picturesTable,
        dbData.toJson(),
      );

      // If muscle targets are provided, insert them into the junction table
      for (final targetId in request.targets) {
        await db.insert(DatabaseService.pictureTargetsTable, {
          'picture_id': pictureId,
          'target_id': targetId,
        });
      }

      // Fetch the inserted data to return as model
      final insertedData = await getBodyPictureById(pictureId);

      return insertedData;

      // insertedData.fold(
      //   (l) => null,
      //   (r) => log('Inserted Data fetched successfully: ${r.id}'),
      // );

      // if (insertedData.isLeft()) {
      //   // If fetching the inserted data fails, delete the created files
      //   _deleteImageAndThumbnailByName(imageName, thumbnailName);
      //   return left('Error when fetching inserted Data');
      // }

      // return right(insertedData);
    } on DatabaseException catch (e) {
      _deleteImageAndThumbnailByName(imageName, thumbnailName);
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    } finally {}
  }

  void _deleteImageAndThumbnailByName(
    String fileName,
    String thumbnailFileName,
  ) {
    // Delete both files
    File('$imagesFolderPath/$fileName').deleteSync();
    File('$thumbnailsFolderPath/$thumbnailFileName').deleteSync();
  }

  // _saveFileInTempDirectoryViaPath(String path) async {
  //   return await File(path)
  //       .copy('${appDocDir.path}/temp/$fileName');
  // }

  @override
  Future<Either<String, VaultImageModel>> updateBodyPicture(
      VaultImageModel bodyPicture) {
    // TODO: implement updateBodyPicture
    throw UnimplementedError();
  }

  @override
  Future<Either<String, CompareImagesModel>> getBodyPicturesByTagAndTwoDate({
    required int tag,
    required DateTime firstdate,
    required DateTime seconddate,
  }) async {
    try {
      final db = await databaseService.database;

      final firstResult = await db.rawQuery(
        '''
          SELECT 
            p.id,
            p.file,
            p.thumbnail_file,
            p.date,
            p.note,
            t.tag,
            GROUP_CONCAT(mt.name) as targets
          FROM ${DatabaseService.picturesTable} p
          INNER JOIN ${DatabaseService.tagsTable} t ON p.tag_id = t.id
          LEFT JOIN ${DatabaseService.pictureTargetsTable} pt ON p.id = pt.picture_id
          LEFT JOIN ${DatabaseService.measurementTargetsTable} mt ON pt.target_id = mt.id
          WHERE p.tag_id = ? AND STRFTIME("%Y-%m-%d", p.date) = ?
          GROUP BY p.id
        ''',
        [tag, firstdate.toIso8601String().substring(0, 10)],
      );

      final secondResult = await db.rawQuery(
        '''
          SELECT 
            p.id,
            p.file,
            p.thumbnail_file,
            p.date,
            p.note,
            t.tag,
            GROUP_CONCAT(mt.name) as targets
          FROM pictures p
          INNER JOIN tags t ON p.tag_id = t.id
          LEFT JOIN picture_targets pt ON p.id = pt.picture_id
          LEFT JOIN ${DatabaseService.measurementTargetsTable} mt ON pt.target_id = mt.id
          WHERE p.tag_id = ? AND STRFTIME("%Y-%m-%d", p.date) = ?
          GROUP BY p.id
        ''',
        [tag, seconddate.toIso8601String().substring(0, 10)],
      );

      final firstImagesSet = firstResult.map((row) {
        final targets = row['targets'] != null
            ? (row['targets'] as String).split(',')
            : <String>[];

        return VaultImageModel(
          id: row['id'] as int,
          tag: row['tag'] as String,
          targets: targets,
          file: row['file'] as String,
          thumbnailFile: row['thumbnail_file'] as String,
          date: DateTime.parse(row['date'] as String),
          note: row['note'] as String,
        );
      }).toList();

      final secondImagesSet = secondResult.map((row) {
        final targets = row['targets'] != null
            ? (row['targets'] as String).split(',')
            : <String>[];

        return VaultImageModel(
          id: row['id'] as int,
          tag: row['tag'] as String,
          targets: targets,
          file: row['file'] as String,
          thumbnailFile: row['thumbnail_file'] as String,
          date: DateTime.parse(row['date'] as String),
          note: row['note'] as String,
        );
      }).toList();

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

  Future<Either<String, List<String>>> getAllMuscleGroups() async {
    try {
      final db = await databaseService.database;
      final result = await db.query('muscle_groups');

      final muscleGroups =
          result.map((e) => e['muscle_group']! as String).toList();

      return right(muscleGroups);
    } catch (e) {
      return left(e.toString());
    }
  }
}
