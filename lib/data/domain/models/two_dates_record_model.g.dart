// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_dates_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TwoDatesRecord _$TwoDatesRecordFromJson(Map<String, dynamic> json) =>
    _TwoDatesRecord(
      name: json['name'] as String,
      data1: (json['data1'] as num?)?.toDouble(),
      metricCode1: json['metricCode1'] as String?,
      data2: (json['data2'] as num?)?.toDouble(),
      metricCode2: json['metricCode2'] as String?,
    );

Map<String, dynamic> _$TwoDatesRecordToJson(_TwoDatesRecord instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data1': instance.data1,
      'metricCode1': instance.metricCode1,
      'data2': instance.data2,
      'metricCode2': instance.metricCode2,
    };
