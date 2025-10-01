part of 'set_user_unit_preferences_cubit.dart';

@freezed
class SetUserUnitPreferencesState with _$SetUserUnitPreferencesState {
  const factory SetUserUnitPreferencesState.initial() = _Initial;

  // Loading
  const factory SetUserUnitPreferencesState.loading() = _Loading;

  // Success
  const factory SetUserUnitPreferencesState.success() = _Success;

  // Error
  const factory SetUserUnitPreferencesState.error(String message) = _Error;
}
