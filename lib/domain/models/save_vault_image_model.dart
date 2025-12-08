import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_vault_image_model.freezed.dart';
part 'save_vault_image_model.g.dart';

@freezed
abstract class SaveVaultImageModel with _$SaveVaultImageModel {
  const factory SaveVaultImageModel({
    /// Tag associated with the image
    required String tag,

    /// Path where the image is stored in the device
    required String path,

    /// Date when the image was taken
    required DateTime date,

    /// Muscle group associated with the image
    required List<String> muscleGroup,
  }) = _SaveVaultImageModel;

  factory SaveVaultImageModel.fromJson(Map<String, dynamic> json) =>
      _$SaveVaultImageModelFromJson(json);
}
