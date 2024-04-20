// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_dates_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TwoDatesRecordImpl _$$TwoDatesRecordImplFromJson(Map<String, dynamic> json) =>
    _$TwoDatesRecordImpl(
      name: json['name'] as String,
      data1: (json['data1'] as num?)?.toDouble(),
      data2: (json['data2'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TwoDatesRecordImplToJson(
        _$TwoDatesRecordImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'data1': instance.data1,
      'data2': instance.data2,
    };
