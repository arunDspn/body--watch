// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeasurementModel _$MeasurementModelFromJson(Map<String, dynamic> json) =>
    _MeasurementModel(
      id: (json['id'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      targetName: json['target_name'] as String,
      metricCode: json['metric_code'] as String,
      type: json['type'] as String,
      notes: json[''] as String?,
      targetId: (json['target_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MeasurementModelToJson(_MeasurementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'date': instance.date.toIso8601String(),
      'target_name': instance.targetName,
      'metric_code': instance.metricCode,
      'type': instance.type,
      '': instance.notes,
      'target_id': instance.targetId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
