// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_vault_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveVaultImageModel _$SaveVaultImageModelFromJson(Map<String, dynamic> json) =>
    _SaveVaultImageModel(
      tag: json['tag'] as String,
      path: json['path'] as String,
      date: DateTime.parse(json['date'] as String),
      muscleGroup: (json['muscleGroup'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SaveVaultImageModelToJson(
  _SaveVaultImageModel instance,
) => <String, dynamic>{
  'tag': instance.tag,
  'path': instance.path,
  'date': instance.date.toIso8601String(),
  'muscleGroup': instance.muscleGroup,
};
