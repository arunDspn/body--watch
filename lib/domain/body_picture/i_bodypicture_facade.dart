import 'package:dartz/dartz.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/domain/body_picture/models/save_vault_image_request.dart';
import 'package:watcha_body/domain/body_picture/models/vault_image_model.dart';
import 'package:watcha_body/domain/models/compare_images_model.dart';

abstract interface class IBodyPictureFacade {
  // Save a new body picture
  Future<Either<String, VaultImageModel>> saveBodyPicture(
    SaveVaultImageRequest request,
  );

  // // Get all body pictures
  Future<Either<String, List<VaultImageModel>>> getAllBodyPictures();

  // // Get a body picture by id
  Future<Either<String, VaultImageModel>> getBodyPictureById(int id);

  // // Delete a body picture
  Future<Either<String, void>> deleteBodyPicture(int id);

  // // Update a body picture
  Future<Either<String, VaultImageModel>> updateBodyPicture(
      VaultImageModel bodyPicture);

  // // Delete all body pictures
  Future<Either<String, Unit>> deleteAllBodyPictures();

  // Tags
  /// Get all tags
  Future<Either<String, List<ImageTagModel>>> getAllTags();

  /// Add a tag
  Future<Either<String, ImageTagModel>> addTag(String tag);

  /// Remove a tag
  Future<Either<String, void>> removeTag(String tag);

  /// Get all body pictures with a tag
  Future<Either<String, List<VaultImageModel>>> getBodyPicturesByTag(
    String tag,
  );

  /// Get a body picture by tag and date
  Future<Either<String, CompareImagesModel>> getBodyPicturesByTagAndTwoDate({
    required int tag,
    required DateTime firstdate,
    required DateTime seconddate,
  });

  Future<Either<String, String>> backupPhotosToZip();

  // // Used as callback for decrypting image provider
  // Future<Uint8List> decryptImageFromPath({
  //   required String path,
  //   required Uint8List nonce,
  // });
}
