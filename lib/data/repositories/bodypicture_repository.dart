import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/body_picture/i_bodypicture_facade.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/domain/body_picture/models/save_vault_image_request.dart';
import 'package:watcha_body/domain/body_picture/models/vault_image_entity.dart';
import 'package:watcha_body/domain/body_picture/models/vault_image_model.dart';
import 'package:watcha_body/domain/models/compare_images_model.dart';
import 'package:watcha_body/domain/models/restore_summary.dart';

class BodyPictureRepository implements IBodyPictureFacade {
  BodyPictureRepository({
    required this.databaseService,
    required this.imagesFolderPath,
    required this.thumbnailsFolderPath,
  });

  final DatabaseService databaseService;
  final String imagesFolderPath;
  final String thumbnailsFolderPath;
  static const int _picturesBackupSchemaVersion = 1;
  static const String _picturesBackupFormat = 'watcha_body.pictures.v1';

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

      final data = await db.delete('pictures');

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

      final orginalFile = File('$imagesFolderPath/$orginalFileName');
      final thumbnailFile = File('$thumbnailsFolderPath/$thumbnailFileName');

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

      final data = await db.rawQuery('''
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
        ''');

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
    String tag,
  ) {
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
    final thumbnailName = _thumbnailFileNameCreator(request.path, request.tag);

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
      await thumbnailFile.writeAsBytes(thumbnailBytes);

      final dbData = VaultImageEntity(
        tagId: request.tagId,
        file: imageName,
        thumbnailFile: thumbnailName,
        date: request.date,
        note: request.note,
        // userId: 1, // Assuming a default user ID for now, can be modified later
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
    VaultImageModel bodyPicture,
  ) {
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

      final firstImages = firstImagesSet.map((e) => e.file).toList();
      final secondImages = secondImagesSet.map((e) => e.file).toList();

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
    try {
      final formatter = DateFormat('dd_MM_yyyy_HH_mm_ss');
      final timestamp = formatter.format(DateTime.now());

      final downloadPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS,
      );
      final zipFile = File(
        '$downloadPath/watchbody/wb_pictures_backup_$timestamp.zip',
      );
      final backupResult = await createPicturesBackupArchive(
        outputZipPath: zipFile.path,
      );
      if (backupResult.isLeft()) {
        return Left(backupResult.swap().getOrElse(() => 'Backup failed'));
      }

      return right(zipFile.path);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> createPicturesBackupArchive({
    required String outputZipPath,
  }) async {
    Directory? tempRootDir;
    try {
      final db = await databaseService.database;
      final pictures = await db.query(DatabaseService.picturesTable);
      final pictureTargets = await db.query(
        DatabaseService.pictureTargetsTable,
      );
      final tags = await db.query(DatabaseService.tagsTable);

      final tempParent = await getTemporaryDirectory();
      tempRootDir = Directory(
        '${tempParent.path}/watchbody_picture_backup_${DateTime.now().millisecondsSinceEpoch}',
      );

      final imagesDir = Directory('${tempRootDir.path}/images');
      final thumbnailsDir = Directory('${tempRootDir.path}/thumbnails');
      await imagesDir.create(recursive: true);
      await thumbnailsDir.create(recursive: true);

      for (final picture in pictures) {
        final imageName = picture['file'] as String;
        final thumbName = picture['thumbnail_file'] as String;

        final sourceImage = File('$imagesFolderPath/$imageName');
        if (sourceImage.existsSync()) {
          await sourceImage.copy('${imagesDir.path}/$imageName');
        }

        final sourceThumbnail = File('$thumbnailsFolderPath/$thumbName');
        if (sourceThumbnail.existsSync()) {
          await sourceThumbnail.copy('${thumbnailsDir.path}/$thumbName');
        }
      }

      final manifest = <String, dynamic>{
        'manifest': <String, dynamic>{
          'format': _picturesBackupFormat,
          'createdAt': DateTime.now().toIso8601String(),
          'schemaVersion': _picturesBackupSchemaVersion,
          'packageKind': 'pictures',
        },
        'tables': <String, dynamic>{
          DatabaseService.picturesTable: pictures,
          DatabaseService.pictureTargetsTable: pictureTargets,
          DatabaseService.tagsTable: tags,
        },
      };

      final metadataFile = File('${tempRootDir.path}/metadata.json');
      await metadataFile.writeAsString(
        const JsonEncoder.withIndent('  ').convert(manifest),
      );

      final outputFile = File(outputZipPath);
      await outputFile.create(recursive: true);
      await ZipFile.createFromDirectory(
        sourceDir: tempRootDir,
        zipFile: outputFile,
        recurseSubDirs: true,
      );

      return Right(outputFile.path);
    } catch (e) {
      return Left(e.toString());
    } finally {
      if (tempRootDir != null && tempRootDir.existsSync()) {
        await tempRootDir.delete(recursive: true);
      }
    }
  }

  Future<Either<String, String>> createPicturesOnlyArchive({
    required String outputZipPath,
  }) async {
    Directory? tempRootDir;
    try {
      final db = await databaseService.database;
      final pictures = await db.query(DatabaseService.picturesTable);

      final tempParent = await getTemporaryDirectory();
      tempRootDir = Directory(
        '${tempParent.path}/watchbody_picture_only_${DateTime.now().millisecondsSinceEpoch}',
      );

      final imagesDir = Directory('${tempRootDir.path}/images');
      await imagesDir.create(recursive: true);

      for (final picture in pictures) {
        final imageName = picture['file'] as String;
        final sourceImage = File('$imagesFolderPath/$imageName');
        if (sourceImage.existsSync()) {
          await sourceImage.copy('${imagesDir.path}/$imageName');
        }
      }

      final outputFile = File(outputZipPath);
      await outputFile.create(recursive: true);
      await ZipFile.createFromDirectory(
        sourceDir: imagesDir,
        zipFile: outputFile,
        recurseSubDirs: false,
      );

      return Right(outputFile.path);
    } catch (e) {
      return Left(e.toString());
    } finally {
      if (tempRootDir != null && tempRootDir.existsSync()) {
        await tempRootDir.delete(recursive: true);
      }
    }
  }

  @override
  Future<Either<String, RestoreSummary>> restorePhotosFromZip({
    required String zipPath,
    bool merge = true,
  }) async {
    Directory? extractDir;
    final createdImageFiles = <File>[];
    final createdThumbnailFiles = <File>[];
    var insertedTags = 0;
    var skippedTags = 0;
    var insertedPictures = 0;
    var skippedPictures = 0;
    var insertedRelations = 0;
    var skippedRelations = 0;

    try {
      final zipFile = File(zipPath);
      if (!zipFile.existsSync()) {
        return Left('Zip file not found at: $zipPath');
      }

      final tempParent = await getTemporaryDirectory();
      extractDir = Directory(
        '${tempParent.path}/watchbody_picture_restore_${DateTime.now().millisecondsSinceEpoch}',
      );
      await extractDir.create(recursive: true);

      await ZipFile.extractToDirectory(
        zipFile: zipFile,
        destinationDir: extractDir,
      );

      final metadata = File('${extractDir.path}/metadata.json');
      if (!metadata.existsSync()) {
        return const Left('Invalid backup zip: metadata.json not found.');
      }

      final decoded = jsonDecode(await metadata.readAsString());
      if (decoded is! Map<String, dynamic>) {
        return const Left('Invalid backup metadata format.');
      }

      final manifest = decoded['manifest'];
      final tables = decoded['tables'];

      if (manifest is! Map<String, dynamic> ||
          tables is! Map<String, dynamic>) {
        return const Left('Invalid backup zip: manifest/tables missing.');
      }

      if (manifest['format'] != _picturesBackupFormat) {
        return Left('Unsupported backup format: ${manifest['format']}');
      }

      if (manifest['schemaVersion'] != _picturesBackupSchemaVersion) {
        return Left(
          'Unsupported backup schema version: ${manifest['schemaVersion']}',
        );
      }

      final packageKind = manifest['packageKind'] as String?;
      if (packageKind != null && packageKind != 'pictures') {
        return Left(
          'Invalid package type. Expected "pictures" backup, got "$packageKind".',
        );
      }

      final tags = _rowsFromTablesNode(
        tables: tables,
        tableName: DatabaseService.tagsTable,
      );
      final pictures = _rowsFromTablesNode(
        tables: tables,
        tableName: DatabaseService.picturesTable,
      );
      final pictureTargets = _rowsFromTablesNode(
        tables: tables,
        tableName: DatabaseService.pictureTargetsTable,
      );

      final db = await databaseService.database;

      if (!merge) {
        await _clearDirectoryFiles(Directory(imagesFolderPath));
        await _clearDirectoryFiles(Directory(thumbnailsFolderPath));
      }

      final sourceImagesDir = Directory('${extractDir.path}/images');
      final sourceThumbnailsDir = Directory('${extractDir.path}/thumbnails');

      await db.transaction((txn) async {
        if (!merge) {
          await txn.delete(DatabaseService.pictureTargetsTable);
          await txn.delete(DatabaseService.picturesTable);
        }

        final tagIdMap = <int, int>{};
        for (final tagRow in tags) {
          final oldTagId = (tagRow['id'] as num?)?.toInt();
          final tagName = tagRow['tag']?.toString();
          if (oldTagId == null || tagName == null || tagName.isEmpty) {
            continue;
          }

          final existingTagId = await _findTagId(txn: txn, tagName: tagName);
          final resolvedTagId =
              existingTagId ??
              await _getOrCreateTagId(txn: txn, tagName: tagName);
          if (existingTagId == null) {
            insertedTags++;
          } else {
            skippedTags++;
          }
          tagIdMap[oldTagId] = resolvedTagId;
        }

        final pictureIdMap = <int, int>{};
        for (final pictureRow in pictures) {
          final oldPictureId = (pictureRow['id'] as num?)?.toInt();
          final oldTagId = (pictureRow['tag_id'] as num?)?.toInt();
          final imageName = pictureRow['file']?.toString();
          final thumbnailName = pictureRow['thumbnail_file']?.toString();

          if (oldPictureId == null ||
              oldTagId == null ||
              imageName == null ||
              thumbnailName == null) {
            continue;
          }

          final resolvedTagId = tagIdMap[oldTagId];
          if (resolvedTagId == null) {
            skippedPictures++;
            continue;
          }

          final existingPictureId = merge
              ? await _findDuplicatePictureId(
                  txn: txn,
                  row: pictureRow,
                  resolvedTagId: resolvedTagId,
                )
              : null;

          if (existingPictureId != null) {
            pictureIdMap[oldPictureId] = existingPictureId;
            skippedPictures++;
            continue;
          }

          final sourceImage = File('${sourceImagesDir.path}/$imageName');
          final sourceThumbnail = File(
            '${sourceThumbnailsDir.path}/$thumbnailName',
          );

          if (!sourceImage.existsSync() || !sourceThumbnail.existsSync()) {
            skippedPictures++;
            continue;
          }

          final destinationImageName = await _resolveUniqueFileName(
            directoryPath: imagesFolderPath,
            preferredName: imageName,
          );
          final destinationThumbnailName = await _resolveUniqueFileName(
            directoryPath: thumbnailsFolderPath,
            preferredName: thumbnailName,
          );

          final copiedImage = await sourceImage.copy(
            '$imagesFolderPath/$destinationImageName',
          );
          final copiedThumbnail = await sourceThumbnail.copy(
            '$thumbnailsFolderPath/$destinationThumbnailName',
          );
          createdImageFiles.add(copiedImage);
          createdThumbnailFiles.add(copiedThumbnail);

          final insertRow = Map<String, dynamic>.from(pictureRow)
            ..remove('id')
            ..['tag_id'] = resolvedTagId
            ..['file'] = destinationImageName
            ..['thumbnail_file'] = destinationThumbnailName;

          final newPictureId = await txn.insert(
            DatabaseService.picturesTable,
            insertRow,
            conflictAlgorithm: ConflictAlgorithm.abort,
          );

          pictureIdMap[oldPictureId] = newPictureId;
          insertedPictures++;
        }

        for (final relation in pictureTargets) {
          final oldPictureId = (relation['picture_id'] as num?)?.toInt();
          final targetId = (relation['target_id'] as num?)?.toInt();

          if (oldPictureId == null || targetId == null) {
            skippedRelations++;
            continue;
          }

          final resolvedPictureId = pictureIdMap[oldPictureId];
          if (resolvedPictureId == null) {
            skippedRelations++;
            continue;
          }

          final targetExists = await txn.query(
            DatabaseService.measurementTargetsTable,
            columns: ['id'],
            where: 'id = ?',
            whereArgs: [targetId],
            limit: 1,
          );

          if (targetExists.isEmpty) {
            skippedRelations++;
            continue;
          }

          final relationId = await txn.insert(
            DatabaseService.pictureTargetsTable,
            {'picture_id': resolvedPictureId, 'target_id': targetId},
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
          if (relationId == 0) {
            skippedRelations++;
          } else {
            insertedRelations++;
          }
        }
      });

      return right(
        RestoreSummary(
          scope: 'pictures',
          merge: merge,
          tables: [
            RestoreTableSummary(
              name: DatabaseService.tagsTable,
              insertedCount: insertedTags,
              skippedCount: skippedTags,
            ),
            RestoreTableSummary(
              name: DatabaseService.picturesTable,
              insertedCount: insertedPictures,
              skippedCount: skippedPictures,
            ),
            RestoreTableSummary(
              name: DatabaseService.pictureTargetsTable,
              insertedCount: insertedRelations,
              skippedCount: skippedRelations,
            ),
          ],
        ),
      );
    } catch (e) {
      for (final file in createdImageFiles) {
        if (file.existsSync()) {
          await file.delete();
        }
      }
      for (final file in createdThumbnailFiles) {
        if (file.existsSync()) {
          await file.delete();
        }
      }
      return left(e.toString());
    } finally {
      if (extractDir != null && extractDir.existsSync()) {
        await extractDir.delete(recursive: true);
      }
    }
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

      final muscleGroups = result
          .map((e) => e['muscle_group']! as String)
          .toList();

      return right(muscleGroups);
    } catch (e) {
      return left(e.toString());
    }
  }

  List<Map<String, dynamic>> _rowsFromTablesNode({
    required Map<String, dynamic> tables,
    required String tableName,
  }) {
    final dynamic value = tables[tableName];
    if (value is! List<dynamic>) {
      return const <Map<String, dynamic>>[];
    }

    return value
        .whereType<Map>()
        .map((row) => Map<String, dynamic>.from(row))
        .toList();
  }

  Future<int> _getOrCreateTagId({
    required Transaction txn,
    required String tagName,
  }) async {
    final existing = await txn.query(
      DatabaseService.tagsTable,
      columns: ['id'],
      where: 'tag = ?',
      whereArgs: [tagName],
      limit: 1,
    );

    if (existing.isNotEmpty) {
      return existing.first['id']! as int;
    }

    return txn.insert(DatabaseService.tagsTable, {'tag': tagName});
  }

  Future<int?> _findTagId({
    required Transaction txn,
    required String tagName,
  }) async {
    final existing = await txn.query(
      DatabaseService.tagsTable,
      columns: ['id'],
      where: 'tag = ?',
      whereArgs: [tagName],
      limit: 1,
    );

    if (existing.isEmpty) {
      return null;
    }

    return existing.first['id'] as int;
  }

  Future<int?> _findDuplicatePictureId({
    required Transaction txn,
    required Map<String, dynamic> row,
    required int resolvedTagId,
  }) async {
    final existing = await txn.query(
      DatabaseService.picturesTable,
      columns: ['id'],
      where:
          'user_id = ? AND tag_id = ? AND date = ? AND '
          'COALESCE(note, "") = COALESCE(?, "")',
      whereArgs: [row['user_id'], resolvedTagId, row['date'], row['note']],
      limit: 1,
    );

    if (existing.isEmpty) {
      return null;
    }
    return existing.first['id'] as int;
  }

  Future<String> _resolveUniqueFileName({
    required String directoryPath,
    required String preferredName,
  }) async {
    final dotIndex = preferredName.lastIndexOf('.');
    final hasExtension = dotIndex > 0 && dotIndex < preferredName.length - 1;
    final baseName = hasExtension
        ? preferredName.substring(0, dotIndex)
        : preferredName;
    final extension = hasExtension ? preferredName.substring(dotIndex) : '';

    var candidate = preferredName;
    var counter = 1;
    while (File('$directoryPath/$candidate').existsSync()) {
      candidate = '${baseName}_$counter$extension';
      counter++;
    }
    return candidate;
  }

  Future<void> _clearDirectoryFiles(Directory directory) async {
    if (!directory.existsSync()) {
      await directory.create(recursive: true);
      return;
    }

    await for (final entity in directory.list()) {
      if (entity is File) {
        await entity.delete();
      }
    }
  }
}
