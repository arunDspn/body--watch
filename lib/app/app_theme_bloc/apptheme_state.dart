part of 'apptheme_bloc.dart';

@freezed
abstract class AppthemeState with _$AppthemeState {
  const factory AppthemeState.initial() = _Initial;
}
