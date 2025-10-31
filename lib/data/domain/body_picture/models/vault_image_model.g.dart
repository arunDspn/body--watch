// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VaultImageModel _$VaultImageModelFromJson(Map<String, dynamic> json) =>
    _VaultImageModel(
      id: (json['id'] as num).toInt(),
      tag: json['tag'] as String,
      targets:
          (json['targets'] as List<dynamic>).map((e) => e as String).toList(),
      file: json['file'] as String,
      thumbnailFile: json['thumbnail_file'] as String,
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
    );

Map<String, dynamic> _$VaultImageModelToJson(_VaultImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'targets': instance.targets,
      'file': instance.file,
      'thumbnail_file': instance.thumbnailFile,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
    };
