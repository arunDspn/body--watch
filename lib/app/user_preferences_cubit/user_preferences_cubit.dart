import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/user_preferences/i_user_preferences_repository.dart';
import 'package:watcha_body/data/domain/user_preferences/models/user_unit_preference_model.dart';

part 'user_preferences_state.dart';
part 'user_preferences_cubit.freezed.dart';

/// Cubit to manage user preferences such as preferred units and settings
/// This cubit will handle fetching, updating, and storing user preferences
class UserPreferencesCubit extends Cubit<UserPreferencesState> {
  UserPreferencesCubit(IUserPreferencesRepository repository)
      : _repository = repository,
        super(const UserPreferencesState.initial());

  final IUserPreferencesRepository _repository;

  /// Fetch user preferences from the repository
  Future<void> fetchUserPreferences(int userId) async {
    emit(const UserPreferencesState.loading());
    try {
      final preferences = await _repository.getAllPreferences(userId: userId);
      if (preferences.isEmpty) {
        emit(const UserPreferencesState.empty());
      } else {
        emit(UserPreferencesState.loaded(preferences: preferences));
      }
    } catch (e) {
      emit(const UserPreferencesState.error('Failed to load preferences'));
    }
  }

  /// Update all user preferences
  Future<void> updateAllPreferences(
    List<UserUnitPreferenceModel> preferences,
  ) async {
    emit(const UserPreferencesState.loading());
    try {
      emit(UserPreferencesState.loaded(preferences: preferences));
    } catch (e) {
      // emit(const UserPreferencesState.error('Failed to update preferences'));
      emit(const UserPreferencesState.initial());
    }
  }
}
