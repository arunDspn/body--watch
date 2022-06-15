part of 'apppreferences_bloc.dart';

@freezed
class ApppreferencesState with _$ApppreferencesState {
  const factory ApppreferencesState.savedAndReady({
    required AppPreferences appPreferences,
  }) = SavedAndReady;
  const factory ApppreferencesState.notSavedOrReady() = NotSavedOrReady;
}
