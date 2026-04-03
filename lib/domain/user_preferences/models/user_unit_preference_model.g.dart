// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_unit_preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserUnitPreferenceModel _$UserUnitPreferenceModelFromJson(
  Map<String, dynamic> json,
) => _UserUnitPreferenceModel(
  metricCode: json['metric_code'] as String,
  toBaseFactor: (json['to_base_factor'] as num).toDouble(),
  preferredUnit: json['preferred_unit'] as String,
);

Map<String, dynamic> _$UserUnitPreferenceModelToJson(
  _UserUnitPreferenceModel instance,
) => <String, dynamic>{
  'metric_code': instance.metricCode,
  'to_base_factor': instance.toBaseFactor,
  'preferred_unit': instance.preferredUnit,
};
