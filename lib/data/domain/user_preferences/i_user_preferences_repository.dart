import 'package:watcha_body/data/domain/user_preferences/models/user_unit_preference_model.dart';
import 'package:watcha_body/data/domain/user_preferences/models/user_unit_preferences_entity.dart';

abstract class IUserPreferencesRepository {
  /// Check if preferences exist for a user
  Future<bool> preferencesExist({required String userId});

  /// Get all preferences at once
  Future<List<UserUnitPreferenceModel>> getAllPreferences({
    required int userId,
  });

  /// Set all preferences at once
  Future<void> setAllPreferences(List<UserUnitPreferencesEntity> preferences);

  /// Update a specific preference
  Future<void> updateAPreference(UserUnitPreferencesEntity preference);

  /// User Settings
}
