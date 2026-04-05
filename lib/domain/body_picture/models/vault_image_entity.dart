import 'package:freezed_annotation/freezed_annotation.dart';

part 'vault_image_entity.freezed.dart';
part 'vault_image_entity.g.dart';

@freezed
abstract class VaultImageEntity with _$VaultImageEntity {
  const factory VaultImageEntity({
    @JsonKey(name: 'tag_id') required int tagId,
    required String file,
    @JsonKey(name: 'thumbnail_file') required String thumbnailFile,
    required DateTime date,
    required String note,
    @JsonKey(name: 'user_id', defaultValue: 1) @Default(1) int? userId,
  }) = _VaultImageEntity;

  factory VaultImageEntity.fromJson(Map<String, dynamic> json) =>
      _$VaultImageEntityFromJson(json);
}
