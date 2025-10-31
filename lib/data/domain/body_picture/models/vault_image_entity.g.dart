// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_image_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VaultImageEntity _$VaultImageEntityFromJson(Map<String, dynamic> json) =>
    _VaultImageEntity(
      tagId: (json['tag_id'] as num).toInt(),
      file: json['file'] as String,
      thumbnailFile: json['thumbnail_file'] as String,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
    );

Map<String, dynamic> _$VaultImageEntityToJson(_VaultImageEntity instance) =>
    <String, dynamic>{
      'tag_id': instance.tagId,
      'file': instance.file,
      'thumbnail_file': instance.thumbnailFile,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };
