import 'dart:math' as math;

import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';

class BodyCompositionEstimatorService {
  BodyCompositionEstimatorService({required this.databaseService});

  final DatabaseService databaseService;
  static const String _bmiActivationSettingKey = 'auto_target_active:bmi';

  static const String _manualSource = 'manual';
  static const String _estimatedSource = 'estimated_formula';
  static const String _bodyFatMethod = 'navy_bf_v1';
  static const String _smmMethod = 'smm_from_lean_v1';
  static const String _bmiMethod = 'bmi_v1';

  static const Set<String> _triggerTargetCodes = <String>{
    'weight',
    'height',
    'waist',
    'neck',
    'hips',
    'body_fat_percentage',
  };

  Future<void> refreshForManualMeasurements({
    required List<MeasurementEntity> measurements,
  }) async {
    final db = await databaseService.database;
    final targetCodeById = await _loadTargetCodeMap(db);
    final anchorDates = <String, _EstimatorAnchor>{};

    for (final measurement in measurements) {
      final targetCode = targetCodeById[measurement.targetId];
      if (measurement.source != _manualSource ||
          targetCode == null ||
          !_triggerTargetCodes.contains(targetCode)) {
        continue;
      }

      final key = '${measurement.userId}-${_dateOnly(measurement.date)}';
      anchorDates[key] = _EstimatorAnchor(
        userId: measurement.userId,
        date: measurement.date,
      );
    }

    for (final anchor in anchorDates.values) {
      await _refreshForDate(
        db: db,
        userId: anchor.userId,
        anchorDate: anchor.date,
      );
    }
  }

  Future<void> _refreshForDate({
    required Database db,
    required int userId,
    required DateTime anchorDate,
  }) async {
    final targetIds = await _loadTargetIdMap(db);
    final bucketKey = buildBucketKey(anchorDate);
    final weightKg = await _sameDayMeasurementByCode(
      db: db,
      userId: userId,
      targetCode: 'weight',
      anchorDate: anchorDate,
    );
    final heightCm = await _resolveHeightCm(
      db: db,
      userId: userId,
      anchorDate: anchorDate,
    );

    final bmiTargetId = targetIds['bmi'];
    final bmiTrackingActive = await _isAutomaticTargetActive(
      db: db,
      userId: userId,
      settingKey: _bmiActivationSettingKey,
    );
    final bmiValue = _calculateBmi(weightKg: weightKg, heightCm: heightCm);
    if (bmiTrackingActive && bmiTargetId != null && bmiValue != null) {
      await _insertEstimatedMeasurementIfMissing(
        db: db,
        userId: userId,
        targetId: bmiTargetId,
        value: bmiValue,
        date: anchorDate,
        bucketKey: _dateOnly(anchorDate),
        method: _bmiMethod,
        notes: 'Auto-calculated BMI',
        replaceExisting: true,
      );
    }

    final gender = await _loadUserGender(db: db, userId: userId);
    if (gender == null) {
      return;
    }

    final waistCm = await _latestMeasurementByCode(
      db: db,
      userId: userId,
      targetCode: 'waist',
      anchorDate: anchorDate,
    );
    final neckCm = await _latestMeasurementByCode(
      db: db,
      userId: userId,
      targetCode: 'neck',
      anchorDate: anchorDate,
    );
    final hipsCm = await _latestMeasurementByCode(
      db: db,
      userId: userId,
      targetCode: 'hips',
      anchorDate: anchorDate,
    );

    final estimatedBodyFatPercent = _calculateBodyFatPercent(
      gender: gender,
      heightCm: heightCm,
      waistCm: waistCm,
      neckCm: neckCm,
      hipsCm: hipsCm,
    );

    final bodyFatTargetId = targetIds['body_fat_percentage'];
    if (estimatedBodyFatPercent != null && bodyFatTargetId != null) {
      await _insertEstimatedMeasurementIfMissing(
        db: db,
        userId: userId,
        targetId: bodyFatTargetId,
        value: estimatedBodyFatPercent,
        date: anchorDate,
        bucketKey: bucketKey,
        method: _bodyFatMethod,
        notes: 'Estimated from formula',
      );
    }

    final manualBodyFatPercent = await _sameDayMeasurementByCode(
      db: db,
      userId: userId,
      targetCode: 'body_fat_percentage',
      anchorDate: anchorDate,
      source: _manualSource,
    );
    final bodyFatForSmm = manualBodyFatPercent ?? estimatedBodyFatPercent;
    final smmPercent = _calculateSmmPercent(
      weightKg: weightKg,
      bodyFatPercent: bodyFatForSmm,
    );

    final smmTargetId = targetIds['skeletal_muscle_mass'];
    if (smmPercent != null && smmTargetId != null) {
      await _insertEstimatedMeasurementIfMissing(
        db: db,
        userId: userId,
        targetId: smmTargetId,
        value: smmPercent,
        date: anchorDate,
        bucketKey: bucketKey,
        method: _smmMethod,
        notes: 'SMM estimate',
      );
    }
  }

  String buildBucketKey(DateTime date) {
    final bucket = (((date.day - 1) ~/ 8) + 1).clamp(1, 4);
    final month = date.month.toString().padLeft(2, '0');
    return '${date.year}-$month-b$bucket';
  }

  double? _calculateBodyFatPercent({
    required String gender,
    required double? heightCm,
    required double? waistCm,
    required double? neckCm,
    required double? hipsCm,
  }) {
    if (heightCm == null || waistCm == null || neckCm == null) {
      return null;
    }

    if (gender == 'male') {
      final difference = waistCm - neckCm;
      if (difference <= 0 || heightCm <= 0) {
        return null;
      }

      final value =
          86.010 * math.log(difference) / math.ln10 -
          70.041 * math.log(heightCm) / math.ln10 +
          36.76;
      return _normalizePercentage(value);
    }

    if (gender == 'female') {
      if (hipsCm == null) {
        return null;
      }

      final difference = waistCm + hipsCm - neckCm;
      if (difference <= 0 || heightCm <= 0) {
        return null;
      }

      final value =
          163.205 * math.log(difference) / math.ln10 -
          97.684 * math.log(heightCm) / math.ln10 -
          78.387;
      return _normalizePercentage(value);
    }

    return null;
  }

  double? _calculateSmmPercent({
    required double? weightKg,
    required double? bodyFatPercent,
  }) {
    if (weightKg == null || weightKg <= 0 || bodyFatPercent == null) {
      return null;
    }

    final fatMassKg = weightKg * (bodyFatPercent / 100);
    final leanMassKg = weightKg - fatMassKg;
    final smmKg = leanMassKg * 0.55;
    final smmPercent = (smmKg / weightKg) * 100;
    return _normalizePercentage(smmPercent);
  }

  double? _calculateBmi({
    required double? weightKg,
    required double? heightCm,
  }) {
    if (weightKg == null ||
        heightCm == null ||
        weightKg <= 0 ||
        heightCm <= 0) {
      return null;
    }

    final heightM = heightCm / 100;
    final bmi = weightKg / (heightM * heightM);
    if (bmi.isNaN || bmi.isInfinite || bmi <= 0) {
      return null;
    }
    return bmi;
  }

  double? _normalizePercentage(double value) {
    if (value.isNaN || value.isInfinite || value <= 0 || value >= 100) {
      return null;
    }
    return value;
  }

  Future<void> _insertEstimatedMeasurementIfMissing({
    required Database db,
    required int userId,
    required int targetId,
    required double value,
    required DateTime date,
    required String bucketKey,
    required String method,
    required String notes,
    bool replaceExisting = false,
  }) async {
    final exists = await db.query(
      DatabaseService.measurementsDataTable,
      columns: <String>['id'],
      where:
          'user_id = ? AND target_id = ? AND source = ? AND estimate_bucket_key = ?',
      whereArgs: <Object?>[userId, targetId, _estimatedSource, bucketKey],
      limit: 1,
    );

    if (exists.isNotEmpty) {
      if (replaceExisting) {
        await db.update(
          DatabaseService.measurementsDataTable,
          <String, Object?>{
            'value': value,
            'date': date.toIso8601String(),
            'notes': notes,
            'method': method,
            'updated_at': DateTime.now().toIso8601String(),
          },
          where:
              'user_id = ? AND target_id = ? AND source = ? AND estimate_bucket_key = ?',
          whereArgs: <Object?>[userId, targetId, _estimatedSource, bucketKey],
        );
      }
      return;
    }

    await db.insert(
      DatabaseService.measurementsDataTable,
      <String, Object?>{
        'user_id': userId,
        'value': value,
        'date': date.toIso8601String(),
        'target_id': targetId,
        'notes': notes,
        'source': _estimatedSource,
        'method': method,
        'estimate_bucket_key': bucketKey,
        'created_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<Map<int, String>> _loadTargetCodeMap(Database db) async {
    final rows = await db.query(
      DatabaseService.measurementTargetsTable,
      columns: <String>['id', 'code'],
    );

    return <int, String>{
      for (final row in rows) row['id'] as int: row['code'] as String,
    };
  }

  Future<Map<String, int>> _loadTargetIdMap(Database db) async {
    final rows = await db.query(
      DatabaseService.measurementTargetsTable,
      columns: <String>['id', 'code'],
    );

    return <String, int>{
      for (final row in rows) row['code'] as String: row['id'] as int,
    };
  }

  Future<String?> _loadUserGender({
    required Database db,
    required int userId,
  }) async {
    final rows = await db.query(
      DatabaseService.userTable,
      columns: <String>['gender'],
      where: 'id = ?',
      whereArgs: <Object?>[userId],
      limit: 1,
    );

    if (rows.isEmpty) {
      return null;
    }

    return rows.first['gender'] as String?;
  }

  Future<double?> _latestMeasurementByCode({
    required Database db,
    required int userId,
    required String targetCode,
    required DateTime anchorDate,
    String? source,
  }) async {
    final rows = await db.rawQuery(
      '''
      SELECT m.value
      FROM ${DatabaseService.measurementsDataTable} m
      INNER JOIN ${DatabaseService.measurementTargetsTable} mt
        ON mt.id = m.target_id
      WHERE m.user_id = ?
        AND mt.code = ?
        AND m.date <= ?
        ${source == null ? '' : 'AND m.source = ?'}
      ORDER BY m.date DESC, m.id DESC
      LIMIT 1
      ''',
      <Object?>[
        userId,
        targetCode,
        anchorDate.toIso8601String(),
        if (source != null) source,
      ],
    );

    if (rows.isEmpty) {
      return null;
    }

    return (rows.first['value'] as num).toDouble();
  }

  Future<double?> _sameDayMeasurementByCode({
    required Database db,
    required int userId,
    required String targetCode,
    required DateTime anchorDate,
    String? source,
  }) async {
    final rows = await db.rawQuery(
      '''
      SELECT m.value
      FROM ${DatabaseService.measurementsDataTable} m
      INNER JOIN ${DatabaseService.measurementTargetsTable} mt
        ON mt.id = m.target_id
      WHERE m.user_id = ?
        AND mt.code = ?
        AND STRFTIME('%Y-%m-%d', m.date) = ?
        ${source == null ? '' : 'AND m.source = ?'}
      ORDER BY m.date DESC, m.id DESC
      LIMIT 1
      ''',
      <Object?>[
        userId,
        targetCode,
        _dateOnly(anchorDate),
        if (source != null) source,
      ],
    );

    if (rows.isEmpty) {
      return null;
    }

    return (rows.first['value'] as num).toDouble();
  }

  Future<double?> _resolveHeightCm({
    required Database db,
    required int userId,
    required DateTime anchorDate,
  }) async {
    final measuredHeight = await _latestMeasurementByCode(
      db: db,
      userId: userId,
      targetCode: 'height',
      anchorDate: anchorDate,
    );
    if (measuredHeight != null) {
      return measuredHeight;
    }

    final settingsRows = await db.query(
      DatabaseService.userSettingsTable,
      columns: <String>['setting_key', 'setting_value'],
      where: 'user_id = ? AND setting_key IN (?, ?)',
      whereArgs: <Object?>[userId, 'profile_height', 'profile_height_unit'],
    );

    final settings = <String, String>{
      for (final row in settingsRows)
        row['setting_key'] as String: row['setting_value'] as String,
    };

    final rawHeight = double.tryParse(settings['profile_height'] ?? '');
    final rawUnit = settings['profile_height_unit'];
    if (rawHeight == null || rawUnit == null) {
      return null;
    }

    return switch (rawUnit) {
      'cm' => rawHeight,
      'inch' => rawHeight * 2.54,
      'ft' => rawHeight * 30.48,
      _ => rawHeight,
    };
  }

  Future<bool> _isAutomaticTargetActive({
    required Database db,
    required int userId,
    required String settingKey,
  }) async {
    final rows = await db.query(
      DatabaseService.userSettingsTable,
      columns: <String>['setting_value'],
      where: 'user_id = ? AND setting_key = ?',
      whereArgs: <Object?>[userId, settingKey],
      limit: 1,
    );

    if (rows.isEmpty) {
      return false;
    }

    return rows.first['setting_value'] == 'true';
  }

  String _dateOnly(DateTime date) => date.toIso8601String().substring(0, 10);
}

class _EstimatorAnchor {
  const _EstimatorAnchor({required this.userId, required this.date});

  final int userId;
  final DateTime date;
}
