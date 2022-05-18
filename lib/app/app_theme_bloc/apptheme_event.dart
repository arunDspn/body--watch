part of 'apptheme_bloc.dart';

@freezed
class AppthemeEvent with _$AppthemeEvent {
  const factory AppthemeEvent.changeTheme({
    required AppTheme appTheme,
  }) = _ChangeTheme;
}
