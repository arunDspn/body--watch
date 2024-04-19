import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_bodypicture_facade.dart';
import 'package:watcha_body/data/domain/models/compare_images_model.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';

class BodyPictureRepository implements IBodyPictureFacade {
  BodyPictureRepository({
    required this.databaseService,
  });

  final DatabaseService databaseService;

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
  Future<Either<String, void>> deleteAllBodyPictures() {
    // TODO: implement deleteAllBodyPictures
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> deleteBodyPicture(String id) async {
    try {
      final db = await databaseService.database;
      final result = await db.rawDelete(
        'DELETE FROM pictures WHERE path = ?',
        [id],
      );

      if (result != 1) {
        return left('Failed to delete picture, No such id');
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

      return right(data.map(VaultImage.fromJson).toList());
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
      VaultImage bodyPicture) async {
    // Save picture to Flutter secure storage

    // Get the app's documents directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now()}.jpg'; // Unique filename
    final savedImage =
        await File(bodyPicture.path).copy('${appDocDir.path}/$fileName');

    final db = await databaseService.database;

    final newData = bodyPicture.copyWith(
      // path: '${appDocDir.path}/$fileName',
      path: savedImage.path,
    );

    final result = await db.insert('pictures', newData.toJson());

    // handle result

    return right(bodyPicture);

    // Save details to database

    // TODO: implement saveBodyPicture
    // throw UnimplementedError();
  }

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
      return right(
        CompareImagesModel(
          firstImages: firstImagesSet,
          secondImages: secondImagesSet,
        ),
      );
    } catch (exception) {
      return left(exception.toString());
    }
    // TODO: implement getBodyPicturesByTagAndTwoDate
    // throw UnimplementedError();
  }
}
