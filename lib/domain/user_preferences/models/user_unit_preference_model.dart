import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_unit_preference_model.freezed.dart';
part 'user_unit_preference_model.g.dart';

// @freezed
// abstract class UserPreferenceModel with _$UserPreferenceModel {
//   const factory UserPreferenceModel({
//     required String metricCode,
//     @JsonKey(name: 'to_base_factor') required double toBaseFactor,
//     @JsonKey(name: 'preference_unit') required String preferenceUnit,
//   }) = _UserPreferenceModel;

//   factory UserPreferenceModel.fromJson(Map<String, Object?> json) =>
//       _$UserPreferenceModelFromJson(json);
// }

@freezed
abstract class UserUnitPreferenceModel with _$UserUnitPreferenceModel {
  const factory UserUnitPreferenceModel({
    @JsonKey(name: 'metric_code') required String metricCode,
    @JsonKey(name: 'to_base_factor') required double toBaseFactor,
    @JsonKey(name: 'preferred_unit') required String preferredUnit,
  }) = _UserUnitPreferenceModel;

  factory UserUnitPreferenceModel.fromJson(Map<String, Object?> json) =>
      _$UserUnitPreferenceModelFromJson(json);
}
