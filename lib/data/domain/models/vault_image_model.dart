// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'vault_image_model.freezed.dart';
part 'vault_image_model.g.dart';

/// This is used for translation of db records
@freezed
class VaultImage with _$VaultImage {
  const factory VaultImage({
    required String id,
    required String tag,
    required String file,
    @JsonKey(name: 'thumbnail_file') required String thumbnailFile,
    required DateTime date,
    required String note,
  }) = _VaultImage;

  factory VaultImage.fromJson(Map<String, dynamic> json) =>
      _$VaultImageFromJson(json);
}
