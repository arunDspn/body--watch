import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/repositories/measurement_repository.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';

class BodyCompositionDateContext {
  const BodyCompositionDateContext({required this.sameDayWeightKg});

  final double? sameDayWeightKg;

  bool get hasSameDayWeight => sameDayWeightKg != null;
}

class BodyCompositionSavePayload {
  const BodyCompositionSavePayload({
    required this.primaryMeasurement,
    this.weightMeasurement,
  });

  final MeasurementEntity primaryMeasurement;
  final MeasurementEntity? weightMeasurement;
}

class BodyCompositionService {
  BodyCompositionService({
    required this.databaseService,
    required this.measurementRepository,
  });

  final DatabaseService databaseService;
  final MeasurementRepository measurementRepository;

  static const String bodyFatTargetCode = 'body_fat_percentage';
  static const String skeletalMuscleMassTargetCode = 'skeletal_muscle_mass';
  static const List<String> supportedUnits = <String>['%', 'kg', 'lbs'];

  static bool isBodyCompositionTargetCode(String code) {
    return code == bodyFatTargetCode || code == skeletalMuscleMassTargetCode;
  }

  bool isBodyCompositionTarget(MeasurementTargetModel target) {
    return isBodyCompositionTargetCode(target.code);
  }

  Future<BodyCompositionDateContext> getDateContext({
    required DateTime date,
    int userId = 1,
  }) async {
    return BodyCompositionDateContext(
      sameDayWeightKg: await getSameDayWeightKg(date: date, userId: userId),
    );
  }

  Future<double?> getSameDayWeightKg({
    required DateTime date,
    int userId = 1,
  }) async {
    final db = await databaseService.database;
    final formattedDate = _dateOnly(date);
    final rows = await db.rawQuery(
      '''
      SELECT m.value
      FROM ${DatabaseService.measurementsDataTable} m
      INNER JOIN ${DatabaseService.measurementTargetsTable} mt
        ON mt.id = m.target_id
      WHERE m.user_id = ?
        AND mt.code = 'weight'
        AND STRFTIME('%Y-%m-%d', m.date) = ?
      ORDER BY m.date DESC, m.id DESC
      LIMIT 1
      ''',
      <Object?>[userId, formattedDate],
    );

    if (rows.isEmpty) {
      return null;
    }

    return (rows.first['value'] as num).toDouble();
  }

  double? convertCanonicalPercentToDisplayValue({
    required double canonicalPercent,
    required String outputUnit,
    double? bodyWeightKg,
  }) {
    switch (outputUnit) {
      case '%':
        return canonicalPercent;
      case 'kg':
        if (bodyWeightKg == null) {
          return null;
        }
        return bodyWeightKg * (canonicalPercent / 100);
      case 'lbs':
        if (bodyWeightKg == null) {
          return null;
        }
        return _kgToLbs(bodyWeightKg * (canonicalPercent / 100));
      default:
        throw ArgumentError('Unsupported unit: $outputUnit');
    }
  }

  double convertInputToCanonicalPercent({
    required double inputValue,
    required String inputUnit,
    required double? bodyWeightKg,
  }) {
    switch (inputUnit) {
      case '%':
        return inputValue;
      case 'kg':
        if (bodyWeightKg == null || bodyWeightKg <= 0) {
          throw StateError('Body weight required for kg conversion');
        }
        return (inputValue / bodyWeightKg) * 100;
      case 'lbs':
        if (bodyWeightKg == null || bodyWeightKg <= 0) {
          throw StateError('Body weight required for lbs conversion');
        }
        return (_lbsToKg(inputValue) / bodyWeightKg) * 100;
      default:
        throw ArgumentError('Unsupported unit: $inputUnit');
    }
  }

  Future<BodyCompositionSavePayload> buildManualSavePayload({
    required MeasurementTargetModel target,
    required DateTime date,
    required double inputValue,
    required String inputUnit,
    required String notes,
    double? enteredWeightValue,
    String weightUnit = 'kg',
    int userId = 1,
    int? measurementId,
  }) async {
    if (!isBodyCompositionTarget(target)) {
      throw ArgumentError(
        'Unsupported body composition target: ${target.code}',
      );
    }

    final existingWeightKg = await getSameDayWeightKg(
      date: date,
      userId: userId,
    );
    final shouldCreateWeightMeasurement =
        existingWeightKg == null && enteredWeightValue != null;
    final resolvedWeightKg = shouldCreateWeightMeasurement
        ? _convertWeightToKg(value: enteredWeightValue, unit: weightUnit)
        : existingWeightKg;

    final canonicalPercent = convertInputToCanonicalPercent(
      inputValue: inputValue,
      inputUnit: inputUnit,
      bodyWeightKg: resolvedWeightKg,
    );

    final primaryMeasurement = MeasurementEntity(
      id: measurementId,
      userId: userId,
      value: canonicalPercent,
      date: date,
      targetId: target.id,
      notes: notes,
    );

    final weightTargetId = shouldCreateWeightMeasurement
        ? await _lookupTargetIdByCode(code: 'weight')
        : null;

    final weightMeasurement =
        shouldCreateWeightMeasurement && weightTargetId != null
        ? MeasurementEntity.createNew(
            value: _convertWeightToKg(
              value: enteredWeightValue,
              unit: weightUnit,
            ),
            date: date,
            targetId: weightTargetId,
            notes: 'Added during ${target.name} entry',
          )
        : null;

    return BodyCompositionSavePayload(
      primaryMeasurement: primaryMeasurement,
      weightMeasurement: weightMeasurement,
    );
  }

  Future<Either<String, Unit>> saveManualEntry({
    required BodyCompositionSavePayload payload,
  }) async {
    final measurements = <MeasurementEntity>[
      if (payload.weightMeasurement != null) payload.weightMeasurement!,
      payload.primaryMeasurement,
    ];

    return measurementRepository.saveMeasurements(measurements: measurements);
  }

  Future<int?> _lookupTargetIdByCode({required String code}) async {
    final db = await databaseService.database;
    final rows = await db.query(
      DatabaseService.measurementTargetsTable,
      columns: <String>['id'],
      where: 'code = ?',
      whereArgs: <Object?>[code],
      limit: 1,
    );

    if (rows.isEmpty) {
      return null;
    }

    return rows.first['id'] as int;
  }

  double _convertWeightToKg({required double value, required String unit}) {
    switch (unit) {
      case 'kg':
        return value;
      case 'lbs':
        return _lbsToKg(value);
      default:
        throw ArgumentError('Unsupported weight unit: $unit');
    }
  }

  double _lbsToKg(double value) => value / 2.20462262;
  double _kgToLbs(double value) => value * 2.20462262;

  String _dateOnly(DateTime date) => date.toIso8601String().substring(0, 10);
}
