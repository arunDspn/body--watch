import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_vault_image_model.freezed.dart';
part 'save_vault_image_model.g.dart';

@freezed
class SaveVaultImageModel with _$SaveVaultImageModel {
  const factory SaveVaultImageModel({
    required String tag,
    required String path,
    required DateTime date,
  }) = _SaveVaultImageModel;

  factory SaveVaultImageModel.fromJson(Map<String, dynamic> json) =>
      _$SaveVaultImageModelFromJson(json);
}
