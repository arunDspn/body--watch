// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaultImageImpl _$$VaultImageImplFromJson(Map<String, dynamic> json) =>
    _$VaultImageImpl(
      tag: json['tag'] as String,
      path: json['path'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$VaultImageImplToJson(_$VaultImageImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'path': instance.path,
      'date': instance.date.toIso8601String(),
    };
