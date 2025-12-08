// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'vault_image_model.freezed.dart';
part 'vault_image_model.g.dart';

/// This is used for translation of db records
@freezed
abstract class VaultImageModel with _$VaultImageModel {
  const factory VaultImageModel({
    required int id,
    required String tag,
    required List<String> targets,
    required String file,
    @JsonKey(name: 'thumbnail_file') required String thumbnailFile,
    required DateTime date,
    required String note,
  }) = _VaultImageModel;

  factory VaultImageModel.fromJson(Map<String, dynamic> json) =>
      _$VaultImageModelFromJson(json);
}
