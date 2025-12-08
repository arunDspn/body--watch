import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/user_preference/user_preference_reposiotry.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preferences_entity.dart';

part 'set_user_unit_preferences_state.dart';
part 'set_user_unit_preferences_cubit.freezed.dart';

class SetUserUnitPreferencesCubit extends Cubit<SetUserUnitPreferencesState> {
  SetUserUnitPreferencesCubit(this.userPreferenceRepository)
      : super(const SetUserUnitPreferencesState.initial());

  final UserPreferenceRepository userPreferenceRepository;

  /// Set user unit preferences
  Future<void> setUserUnitPreferences({
    required List<UserUnitPreferencesEntity> userUnitPreferences,
  }) async {
    emit(const SetUserUnitPreferencesState.loading());
    try {
      await userPreferenceRepository.setAllPreferences(userUnitPreferences);
      emit(const SetUserUnitPreferencesState.success());
    } catch (e) {
      emit(SetUserUnitPreferencesState.error(e.toString()));
    }
  }
}
