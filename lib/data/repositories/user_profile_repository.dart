import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/services/database_service.dart';

class UserProfileSetupData {
  const UserProfileSetupData({
    this.gender,
    this.dob,
    this.height,
    this.heightUnit,
    this.weight,
    this.weightUnit,
  });

  final String? gender;
  final DateTime? dob;
  final double? height;
  final String? heightUnit;
  final double? weight;
  final String? weightUnit;
}

class UserProfileRepository {
  UserProfileRepository(DatabaseService databaseService)
    : _databaseService = databaseService;

  final DatabaseService _databaseService;

  static const String _heightKey = 'profile_height';
  static const String _heightUnitKey = 'profile_height_unit';
  static const String _weightKey = 'profile_weight';
  static const String _weightUnitKey = 'profile_weight_unit';

  Future<UserProfileSetupData> getProfileSetup({required int userId}) async {
    final db = await _databaseService.database;

    final users = await db.query(
      DatabaseService.userTable,
      columns: ['gender', 'dob'],
      where: 'id = ?',
      whereArgs: [userId],
      limit: 1,
    );

    final settingsRows = await db.query(
      DatabaseService.userSettingsTable,
      columns: ['setting_key', 'setting_value'],
      where: 'user_id = ? AND setting_key IN (?, ?, ?, ?)',
      whereArgs: [
        userId,
        _heightKey,
        _heightUnitKey,
        _weightKey,
        _weightUnitKey,
      ],
    );

    final settings = <String, String>{
      for (final row in settingsRows)
        row['setting_key'] as String: row['setting_value'] as String,
    };

    DateTime? parsedDob;
    String? gender;
    if (users.isNotEmpty) {
      final row = users.first;
      gender = row['gender'] as String?;
      final dobString = row['dob'] as String?;
      if (dobString != null && dobString.isNotEmpty) {
        parsedDob = DateTime.tryParse(dobString);
      }
    }

    return UserProfileSetupData(
      gender: gender,
      dob: parsedDob,
      height: double.tryParse(settings[_heightKey] ?? ''),
      heightUnit: settings[_heightUnitKey],
      weight: double.tryParse(settings[_weightKey] ?? ''),
      weightUnit: settings[_weightUnitKey],
    );
  }

  Future<void> saveProfileSetup({
    required int userId,
    required String gender,
    DateTime? dob,
    double? height,
    String? heightUnit,
    double? weight,
    String? weightUnit,
  }) async {
    final db = await _databaseService.database;

    await db.transaction((txn) async {
      final users = await txn.query(
        DatabaseService.userTable,
        columns: ['id', 'name', 'dob'],
        where: 'id = ?',
        whereArgs: [userId],
        limit: 1,
      );

      if (users.isEmpty) {
        await txn.insert(DatabaseService.userTable, {
          'id': userId,
          'name': 'User',
          'dob': (dob ?? DateTime(1970, 1, 1)).toIso8601String(),
          'gender': gender,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      } else {
        final existingUser = users.first;
        await txn.update(
          DatabaseService.userTable,
          {
            'gender': gender,
            'dob': (dob ?? DateTime.parse(existingUser['dob'] as String))
                .toIso8601String(),
          },
          where: 'id = ?',
          whereArgs: [userId],
        );
      }

      await _upsertOrDeleteSetting(
        txn: txn,
        userId: userId,
        key: _heightKey,
        value: height?.toString(),
      );
      await _upsertOrDeleteSetting(
        txn: txn,
        userId: userId,
        key: _heightUnitKey,
        value: heightUnit,
      );
      await _upsertOrDeleteSetting(
        txn: txn,
        userId: userId,
        key: _weightKey,
        value: weight?.toString(),
      );
      await _upsertOrDeleteSetting(
        txn: txn,
        userId: userId,
        key: _weightUnitKey,
        value: weightUnit,
      );
    });
  }

  Future<void> _upsertOrDeleteSetting({
    required Transaction txn,
    required int userId,
    required String key,
    required String? value,
  }) async {
    if (value == null || value.trim().isEmpty) {
      await txn.delete(
        DatabaseService.userSettingsTable,
        where: 'user_id = ? AND setting_key = ?',
        whereArgs: [userId, key],
      );
      return;
    }

    await txn.insert(
      DatabaseService.userSettingsTable,
      {'user_id': userId, 'setting_key': key, 'setting_value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
