import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';

abstract interface class IBodyPictureFacade {
  // Save a new body picture
  Future<Either<String, VaultImage>> saveBodyPicture(VaultImage bodyPicture);

  // // Get all body pictures
  Future<Either<String, List<VaultImage>>> getAllBodyPictures();

  // // Get a body picture by id
  Future<Either<String, VaultImage>> getBodyPictureById(int id);

  // // Delete a body picture
  Future<Either<String, void>> deleteBodyPicture(String id);

  // // Update a body picture
  Future<Either<String, VaultImage>> updateBodyPicture(VaultImage bodyPicture);

  // // Delete all body pictures
  Future<Either<String, void>> deleteAllBodyPictures();

  // Tags
  /// Get all tags
  Future<Either<String, List<String>>> getAllTags();

  /// Add a tag
  Future<Either<String, String>> addTag(String tag);

  /// Remove a tag
  Future<Either<String, void>> removeTag(String tag);

  /// Get all body pictures with a tag
  Future<Either<String, List<VaultImage>>> getBodyPicturesByTag(String tag);
}
