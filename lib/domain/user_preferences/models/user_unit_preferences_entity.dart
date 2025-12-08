import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_unit_preferences_entity.freezed.dart';
part 'user_unit_preferences_entity.g.dart';

// @freezed
// abstract class UserPreferencesModel with _$UserPreferencesModel {
//   const factory UserPreferencesModel({
//     required int id,
//     @JsonKey(name: 'user_id') required int userId,
//     @JsonKey(name: 'preference_type') required String preferenceType,
//     @JsonKey(name: 'metric_id') required int metricId,
//   }) = _UserPreferencesModel;

//   factory UserPreferencesModel.fromJson(Map<String, Object?> json) =>
//       _$UserPreferencesModelFromJson(json);
// }

// @freezed
// abstract class UserPreferencesEntity with _$UserPreferencesEntity {
//   const factory UserPreferencesEntity({
//     required int id,
//     @JsonKey(name: 'user_id') required int userId,
//     @JsonKey(name: 'preference_type') required String preferenceType,
//     @JsonKey(name: 'metric_id') required int metricId,
//   }) = _UserPreferencesEntity;

//   factory UserPreferencesEntity.fromJson(Map<String, Object?> json) =>
//       _$UserPreferencesEntityFromJson(json);
// }

@freezed
abstract class UserUnitPreferencesEntity with _$UserUnitPreferencesEntity {
  const factory UserUnitPreferencesEntity({
    // required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'preferred_unit') required String preferredUnit,
    @JsonKey(name: 'metric_code') required String metricCode,
  }) = _UserUnitPreferencesEntity;

  factory UserUnitPreferencesEntity.fromJson(Map<String, Object?> json) =>
      _$UserUnitPreferencesEntityFromJson(json);
}
