part of 'apppreferences_bloc.dart';

@freezed
abstract class ApppreferencesEvent with _$ApppreferencesEvent {
  const factory ApppreferencesEvent.savePreferences({
    required AppPreferences appPreferences,
  }) = _LoadSavedPreferences;
}
