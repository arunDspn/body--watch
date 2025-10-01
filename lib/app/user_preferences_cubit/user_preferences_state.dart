part of 'user_preferences_cubit.dart';

@freezed
class UserPreferencesState with _$UserPreferencesState {
  const factory UserPreferencesState.initial() = _Initial;

  // Loading
  const factory UserPreferencesState.loading() = UserPreferencesLoading;

  // Failure state
  // Use failure
  // const factory UserPreferencesState.failure(String message) =
  //     UserPreferencesLoadingFailure;

  // Loaded with user preferences data
  const factory UserPreferencesState.loaded({
    required List<UserUnitPreferenceModel> preferences,
  }) = UserPreferencesLoaded;

  // UserSettings Empty
  const factory UserPreferencesState.empty() = UserPreferencesEmpty;

  // Error state
  const factory UserPreferencesState.error(String message) =
      UserPreferencesError;
}
