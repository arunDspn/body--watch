import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/measurement/i_measurements.dart';
import 'package:watcha_body/domain/user_preferences/i_user_preferences_repository.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preference_model.dart';
import 'package:watcha_body/domain/user_preferences/models/user_unit_preferences_entity.dart';

class UserPreferenceRepository implements IUserPreferencesRepository {
  UserPreferenceRepository(DatabaseService databaseService)
    : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<List<UserUnitPreferenceModel>> getAllPreferences({
    required int userId,
  }) async {
    final db = await _databaseService.database;
    final result = await db.rawQuery(
      '''
      SELECT
        uup.metric_code,
        uup.preferred_unit,
        mu.to_base_factor
      FROM ${DatabaseService.userUnitPreferencesTable} uup
      JOIN ${DatabaseService.metricsTable} m ON m.code = uup.metric_code
      JOIN ${DatabaseService.metricUnitsTable} mu
        ON mu.metric_id = m.id
       AND mu.unit = uup.preferred_unit
      WHERE uup.user_id = ?
      ''',
      [userId],
    );

    return result.map(UserUnitPreferenceModel.fromJson).toList();
  }

  @override
  Future<void> setAllPreferences(
    List<UserUnitPreferencesEntity> preferences,
  ) async {
    final db = await _databaseService.database;
    final batch = db.batch();

    for (final pref in preferences) {
      batch.insert(
        DatabaseService.userUnitPreferencesTable,
        pref.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<void> updateAPreference(UserUnitPreferencesEntity preference) async {
    final db = await _databaseService.database;
    await db.update(
      DatabaseService.userUnitPreferencesTable,
      preference.toJson(),
      where: 'user_id = ? AND metric_code = ?',
      whereArgs: [preference.userId, preference.metricCode],
    );
  }

  @override
  Future<bool> preferencesExist({required String userId}) async {
    final db = await _databaseService.database;
    final result = await db.rawQuery(
      '''
      SELECT 1
      FROM ${DatabaseService.userUnitPreferencesTable}
      WHERE user_id = ?
      LIMIT 1
      ''',
      [userId],
    );
    return result.isNotEmpty;
  }

  @override
  Future<MeasurementSourceFilter> getChartSourceFilter({
    required int userId,
  }) async {
    final db = await _databaseService.database;
    final result = await db.query(
      DatabaseService.userSettingsTable,
      columns: ['setting_value'],
      where: 'user_id = ? AND setting_key = ?',
      whereArgs: [userId, 'chart_source_filter'],
      limit: 1,
    );

    if (result.isEmpty) {
      return MeasurementSourceFilter.manual;
    }

    final value = result.first['setting_value'] as String;
    return MeasurementSourceFilter.values.firstWhere(
      (item) => item.name == value,
      orElse: () => MeasurementSourceFilter.manual,
    );
  }

  @override
  Future<void> setChartSourceFilter({
    required int userId,
    required MeasurementSourceFilter filter,
  }) async {
    final db = await _databaseService.database;
    await db.insert(
      DatabaseService.userSettingsTable,
      {
        'user_id': userId,
        'setting_key': 'chart_source_filter',
        'setting_value': filter.name,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
