// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_target_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MeasurementTargetModel _$MeasurementTargetModelFromJson(
  Map<String, dynamic> json,
) => _MeasurementTargetModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  code: json['code'] as String,
  type: json['type'] as String,
  category: json['category'] as String,
  metricCode: json['metric_code'] as String,
  displayOrder: (json['display_order'] as num).toInt(),
  units: (json['units'] as List<dynamic>)
      .map((e) => MetricUnitsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  isCustom: json['is_custom'] as bool? ?? false,
);

Map<String, dynamic> _$MeasurementTargetModelToJson(
  _MeasurementTargetModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'type': instance.type,
  'category': instance.category,
  'metric_code': instance.metricCode,
  'display_order': instance.displayOrder,
  'units': instance.units,
  'is_custom': instance.isCustom,
};
