import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/measurement/i_measurements.dart';
import 'package:watcha_body/domain/user_preferences/i_user_preferences_repository.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preference_model.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preferences_entity.dart';

part 'user_preferences_state.dart';
part 'user_preferences_cubit.freezed.dart';

class UserPreferencesCubit extends Cubit<UserPreferencesState> {
  UserPreferencesCubit(IUserPreferencesRepository repository)
    : _repository = repository,
      super(const UserPreferencesState.initial());

  final IUserPreferencesRepository _repository;

  Future<void> fetchUserPreferences(int userId) async {
    emit(const UserPreferencesState.loading());
    try {
      final preferences = await _repository.getAllPreferences(userId: userId);
      if (preferences.isEmpty) {
        emit(const UserPreferencesState.empty());
      } else {
        emit(UserPreferencesState.loaded(preferences: preferences));
      }
    } catch (_) {
      emit(const UserPreferencesState.error('Failed to load preferences'));
    }
  }

  Future<void> updateAllPreferences(
    List<UserUnitPreferenceModel> preferences,
  ) async {
    try {
      emit(UserPreferencesState.loaded(preferences: preferences));
    } catch (_) {
      emit(const UserPreferencesState.initial());
    }
  }

  Future<void> updateSinglePreference(
    UserUnitPreferenceModel preference,
    int userId,
  ) async {
    final currentState = state;
    if (currentState is! UserPreferencesLoaded) {
      return;
    }

    try {
      final userPrefEntity = UserUnitPreferencesEntity(
        userId: userId,
        metricCode: preference.metricCode,
        preferredUnit: preference.preferredUnit,
      );

      await _repository.updateAPreference(userPrefEntity);

      final newPrefsList = currentState.preferences.map((e) {
        if (e.metricCode == preference.metricCode) {
          return preference;
        }
        return e;
      }).toList();

      emit(UserPreferencesState.loaded(preferences: newPrefsList));
    } catch (e) {
      emit(UserPreferencesState.error(e.toString()));
    }
  }

  Future<MeasurementSourceFilter> getChartSourceFilter(int userId) {
    return _repository.getChartSourceFilter(userId: userId);
  }

  Future<void> setChartSourceFilter({
    required int userId,
    required MeasurementSourceFilter filter,
  }) {
    return _repository.setChartSourceFilter(userId: userId, filter: filter);
  }
}
