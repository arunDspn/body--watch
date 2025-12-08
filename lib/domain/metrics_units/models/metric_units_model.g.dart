// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric_units_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetricUnitsModel _$MetricUnitsModelFromJson(Map<String, dynamic> json) =>
    _MetricUnitsModel(
      unit: json['unit'] as String,
      code: json['code'] as String,
      toBaseFactor: (json['to_base_factor'] as num).toDouble(),
    );

Map<String, dynamic> _$MetricUnitsModelToJson(_MetricUnitsModel instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'code': instance.code,
      'to_base_factor': instance.toBaseFactor,
    };
