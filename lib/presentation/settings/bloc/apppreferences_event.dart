part of 'apppreferences_bloc.dart';

@freezed
class ApppreferencesEvent with _$ApppreferencesEvent {
  const factory ApppreferencesEvent.savePreferences({
    required AppPreferences appPreferences,
  }) = _LoadSavedPreferences;
}
