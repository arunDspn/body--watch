// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeasurementEntity _$MeasurementEntityFromJson(Map<String, dynamic> json) =>
    _MeasurementEntity(
      value: (json['value'] as num).toDouble(),
      goalValue: (json['goal_value'] as num?)?.toDouble(),
      date: DateTime.parse(json['date'] as String),
      targetId: (json['target_id'] as num).toInt(),
      notes: json['notes'] as String,
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
      'goal_value': instance.goalValue,
      'date': instance.date.toIso8601String(),
      'target_id': instance.targetId,
      'notes': instance.notes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'id': instance.id,
    };
