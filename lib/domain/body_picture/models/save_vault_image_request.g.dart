// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_vault_image_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveVaultImageRequest _$SaveVaultImageRequestFromJson(
  Map<String, dynamic> json,
) => _SaveVaultImageRequest(
  tagId: (json['tagId'] as num).toInt(),
  tag: json['tag'] as String,
  targets: (json['targets'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  path: json['path'] as String,
  date: DateTime.parse(json['date'] as String),
  note: json['note'] as String,
  userId: (json['user_id'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$SaveVaultImageRequestToJson(
  _SaveVaultImageRequest instance,
) => <String, dynamic>{
  'tagId': instance.tagId,
  'tag': instance.tag,
  'targets': instance.targets,
  'path': instance.path,
  'date': instance.date.toIso8601String(),
  'note': instance.note,
  'user_id': instance.userId,
};
