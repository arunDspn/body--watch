import 'package:freezed_annotation/freezed_annotation.dart';
part 'save_vault_image_request.freezed.dart';
part 'save_vault_image_request.g.dart';

@freezed
abstract class SaveVaultImageRequest with _$SaveVaultImageRequest {
  const factory SaveVaultImageRequest({
    /// Tag ID associated with the image
    required int tagId,

    /// Tag associated with the image
    required String tag,

    /// Targets (muscle groups) associated with the image
    required List<int> targets,

    /// Path where the image is stored in the device
    required String path,

    /// Date when the image was taken
    required DateTime date,

    /// Note associated with the image
    required String note,
  }) = _SaveVaultImageRequest;

  factory SaveVaultImageRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveVaultImageRequestFromJson(json);
}
