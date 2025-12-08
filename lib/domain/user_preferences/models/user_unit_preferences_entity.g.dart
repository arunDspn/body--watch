// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_unit_preferences_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserUnitPreferencesEntity _$UserUnitPreferencesEntityFromJson(
        Map<String, dynamic> json) =>
    _UserUnitPreferencesEntity(
      userId: (json['user_id'] as num).toInt(),
      preferredUnit: json['preferred_unit'] as String,
      metricCode: json['metric_code'] as String,
    );

Map<String, dynamic> _$UserUnitPreferencesEntityToJson(
        _UserUnitPreferencesEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'preferred_unit': instance.preferredUnit,
      'metric_code': instance.metricCode,
    };
