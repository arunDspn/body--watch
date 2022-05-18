import 'package:bloc/bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'apptheme_event.dart';
part 'apptheme_state.dart';
part 'apptheme_bloc.freezed.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppthemeBloc extends HydratedBloc<AppthemeEvent, AppTheme> {
  AppthemeBloc() : super(AppTheme.lightTheme) {
    on<AppthemeEvent>((event, emit) {
      event.map(
        changeTheme: (e) {
          emit(e.appTheme);
        },
      );
    });
  }

  @override
  AppTheme? fromJson(Map<String, dynamic> json) {
    return EnumToString.fromString<AppTheme>(
      AppTheme.values,
      json['appTheme'] as String,
    );
  }

  @override
  Map<String, dynamic>? toJson(AppTheme state) {
    return <String, dynamic>{
      'appTheme': EnumToString.convertToString(state),
    };
  }
}
