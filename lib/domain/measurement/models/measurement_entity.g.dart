// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeasurementEntity _$MeasurementEntityFromJson(Map<String, dynamic> json) =>
    _MeasurementEntity(
      value: (json['value'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      targetId: (json['target_id'] as num).toInt(),
      notes: json['notes'] as String,
      source: json['source'] as String? ?? 'manual',
      method: json['method'] as String? ?? 'manual_entry',
      estimateBucketKey: json['estimate_bucket_key'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userId: (json['user_id'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MeasurementEntityToJson(_MeasurementEntity instance) =>
    <String, dynamic>{
      'value': instance.value,
      'date': instance.date.toIso8601String(),
      'target_id': instance.targetId,
      'notes': instance.notes,
      'source': instance.source,
      'method': instance.method,
      'estimate_bucket_key': instance.estimateBucketKey,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'id': instance.id,
    };
