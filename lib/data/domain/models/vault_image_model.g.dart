// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaultImageImpl _$$VaultImageImplFromJson(Map<String, dynamic> json) =>
    _$VaultImageImpl(
      id: json['id'] as String,
      tag: json['tag'] as String,
      file: json['file'] as String,
      thumbnailFile: json['thumbnail_file'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$VaultImageImplToJson(_$VaultImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'file': instance.file,
      'thumbnail_file': instance.thumbnailFile,
      'date': instance.date.toIso8601String(),
    };
