import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';

part 'apppreferences_event.dart';
part 'apppreferences_state.dart';
part 'apppreferences_bloc.freezed.dart';

class ApppreferencesBloc
    extends HydratedBloc<ApppreferencesEvent, AppPreferences> {
  ApppreferencesBloc() : super(intialappPreferences) {
    on<ApppreferencesEvent>((event, emit) {
      event.map(
        updatePreferences: (e) {
          emit(e.appPreferences);
        },
      );
    });
  }

  @override
  AppPreferences? fromJson(Map<String, dynamic> json) {
    return AppPreferences(
      EnumToString.fromString<WeightUnit>(
            WeightUnit.values,
            json['weightUnit'] as String,
          ) ??
          WeightUnit.kg,
      EnumToString.fromString<LengthUnit>(
            LengthUnit.values,
            json['lengthUnit'] as String,
          ) ??
          LengthUnit.inch,
    );
  }

  @override
  Map<String, dynamic>? toJson(AppPreferences state) {
    return <String, dynamic>{
      'weightUnit': EnumToString.convertToString(state.weightUnit),
      'lengthUnit': EnumToString.convertToString(state.lengthUnit),
    };
  }
}

final AppPreferences intialappPreferences =
    AppPreferences(WeightUnit.kg, LengthUnit.inch);
