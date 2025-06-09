part of 'apptheme_bloc.dart';

@freezed
abstract class AppthemeEvent with _$AppthemeEvent {
  const factory AppthemeEvent.changeTheme({
    required AppTheme appTheme,
  }) = _ChangeTheme;
}
