import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';

part 'apppreferences_event.dart';
part 'apppreferences_state.dart';
part 'apppreferences_bloc.freezed.dart';

class ApppreferencesBloc
    extends HydratedBloc<ApppreferencesEvent, ApppreferencesState> {
  ApppreferencesBloc() : super(const ApppreferencesState.notSavedOrReady()) {
    on<ApppreferencesEvent>((event, emit) {
      event.map(
        updatePreferences: (e) {
          emit(
            ApppreferencesState.savedAndReady(appPreferences: e.appPreferences),
          );
        },
      );
    });
  }

  @override
  Map<String, dynamic>? toJson(ApppreferencesState state) {
    return state.maybeMap(
      orElse: () => null,
      savedAndReady: (value) {
        return <String, dynamic>{
          'weightUnit':
              EnumToString.convertToString(value.appPreferences.weightUnit),
          'lengthUnit':
              EnumToString.convertToString(value.appPreferences.lengthUnit),
          'lang': value.appPreferences.lang,
        };
      },
      // notSavedOrReady: (value) {
      //   return <String, dynamic>{
      //     'weightUnit': '',
      //     'lengthUnit': '',
      //     'lang': '',
      //   };
      // },
    );
  }

  @override
  ApppreferencesState? fromJson(Map<String, dynamic> json) {
    if (json['weightUnit'] == null) {
      return const ApppreferencesState.notSavedOrReady();
    } else {
      return ApppreferencesState.savedAndReady(
        appPreferences: AppPreferences(
          EnumToString.fromString<WeightUnit>(
                WeightUnit.values,
                json['weightUnit'] as String,
              ) ??
              WeightUnit.kg,
          EnumToString.fromString<LengthUnit>(
                LengthUnit.values,
                json['lengthUnit'] as String,
              ) ??
              LengthUnit.cm,
          json['lang'] as String,
        ),
      );
    }
  }

  // @override
  // Map<String, dynamic>? toJson(AppPreferences state) {
  //   return <String, dynamic>{
  //     'weightUnit': EnumToString.convertToString(state.weightUnit),
  //     'lengthUnit': EnumToString.convertToString(state.lengthUnit),
  //     'lang': state.lang,
  //   };
  // }
}

final AppPreferences intialappPreferences =
    AppPreferences(WeightUnit.kg, LengthUnit.inch, 'en');
