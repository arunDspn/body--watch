part of 'apppreferences_bloc.dart';

@freezed
class ApppreferencesEvent with _$ApppreferencesEvent {
  const factory ApppreferencesEvent.updatePreferences({
    required AppPreferences appPreferences,
  }) = _UpdatePreferences;
}
