// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_vault_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveVaultImageModelImpl _$$SaveVaultImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveVaultImageModelImpl(
      tag: json['tag'] as String,
      path: json['path'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$SaveVaultImageModelImplToJson(
        _$SaveVaultImageModelImpl instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'path': instance.path,
      'date': instance.date.toIso8601String(),
    };
