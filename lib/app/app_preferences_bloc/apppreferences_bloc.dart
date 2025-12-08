import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:watcha_body/domain/models/app_preferences.dart';

part 'apppreferences_event.dart';
part 'apppreferences_state.dart';
part 'apppreferences_bloc.freezed.dart';

class ApppreferencesBloc
    extends HydratedBloc<ApppreferencesEvent, ApppreferencesState> {
  ApppreferencesBloc() : super(const ApppreferencesState.notSavedOrReady()) {
    on<ApppreferencesEvent>((event, emit) {
      switch (event) {
        case ApppreferencesEvent(appPreferences: final appPreferences):
          emit(
            ApppreferencesState.savedAndReady(
              appPreferences: appPreferences,
            ),
          );
          break;
      }
    });
  }

  @override
  Map<String, dynamic>? toJson(ApppreferencesState state) {
    return switch (state) {
      SavedAndReady(
        appPreferences: final appPreferences,
      ) =>
        <String, dynamic>{
          'weightUnit': appPreferences.weightUnit,
          'lengthUnit': appPreferences.lengthUnit,
          'heightUnit': appPreferences.heightUnit,
          'lang': appPreferences.lang,
        },
      ApppreferencesState() => null,
    };

    // return state.maybeMap(
    //   orElse: () => null,
    //   savedAndReady: (value) {},
    //   // notSavedOrReady: (value) {
    //   //   return <String, dynamic>{
    //   //     'weightUnit': '',
    //   //     'lengthUnit': '',
    //   //     'lang': '',
    //   //   };
    //   // },
    // );
  }

  @override
  ApppreferencesState? fromJson(Map<String, dynamic> json) {
    if (json['weightUnit'] == null) {
      return const ApppreferencesState.notSavedOrReady();
    } else {
      return ApppreferencesState.savedAndReady(
        appPreferences: AppPreferences(
          weightUnit: json['weightUnit'] as String?,
          lengthUnit: json['lengthUnit'] as String?,
          heightUnit: json['heightUnit'] as String?,

          lang: json['lang'] as String? ?? 'en',
          // EnumToString.fromString<WeightUnit>(
          //       WeightUnit.values,
          //       json['weightUnit'] as String,
          //     ) ??
          //     WeightUnit.kg,
          // EnumToString.fromString<LengthUnit>(
          //       LengthUnit.values,
          //       json['lengthUnit'] as String,
          //     ) ??
          //     LengthUnit.cm,
          // json['lang'] as String,
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

// final AppPreferences intialappPreferences =
//     AppPreferences(WeightUnit.kg, LengthUnit.inch, 'en');
