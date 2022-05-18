import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';

part 'apppreferences_event.dart';
part 'apppreferences_bloc.freezed.dart';

class ApppreferencesBloc extends Bloc<ApppreferencesEvent, AppPreferences> {
  ApppreferencesBloc(this.appPreferences) : super(appPreferences) {
    on<ApppreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final AppPreferences appPreferences;
}
