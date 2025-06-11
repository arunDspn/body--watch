part of 'apptheme_bloc.dart';

@freezed
sealed class AppthemeEvent with _$AppthemeEvent {
  const factory AppthemeEvent.changeTheme({
    required AppTheme appTheme,
  }) = AppThemeEventChangeTheme;
}
