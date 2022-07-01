import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class MeasurementRepository extends IMeasurementsFacade {
  MeasurementRepository(this.databaseService);

  final DatabaseService databaseService;

  static const latestDetailsQuery = '''
    WITH ranked AS
    (SELECT id, value, date, type, unit,row_number() 
    OVER (PARTITION BY type ORDER BY date DESC) AS rn
    FROM measurements)
    SELECT id, value, date, type, unit
    FROM ranked
    WHERE rn <= 2
    ORDER BY type, date DESC;
    ''';
  @override
  Future<Either<String, Unit>> createMeasurement({
    required Measurement measurement,
  }) async {
    try {
      await databaseService.insert(
        map: measurement.toMap(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteMeasurement({
    required String id,
  }) {
    // TODO: implement deleteMeasurement
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Measurement>>> getDetailsByDate({
    required String preferredWeightUnit,
    required String preferredLengthUnit,
    DateTime? startDate,
    DateTime? endDate,
    String? type,
  }) async {
    try {
      final _data = await databaseService.getData(
        startDate: startDate,
        endDate: endDate,
        type: type,
      );
      final _dData = _data.map(Measurement.fromMap).toList();
      final _fixedData = _convertToPreferredUnits(
        _dData,
        preferredWeightUnit,
        preferredLengthUnit,
      );
      return Right(_fixedData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  double _convertInchToCm(double inch) => (inch * 2.54).toFixedOfTwo();
  double _convertCmToInch(double cm) => (cm / 2.54).toFixedOfTwo();
  double _convertPoundToKg(double pound) => (pound / 2.20462262).toFixedOfTwo();
  double _convertKgToPound(double kg) => (kg * 2.20462262).toFixedOfTwo();

  @override
  Future<Either<String, List<Measurement>>> getLatestDetails({
    required String preferredWeightUnit,
    required String preferredLengthUnit,
  }) async {
    try {
      final _db = await databaseService.database;
      final _data = await _db.rawQuery(latestDetailsQuery);
      final _dData = _data.map(Measurement.fromMap).toList();
      final _fixedData = _convertToPreferredUnits(
        _dData,
        preferredWeightUnit,
        preferredLengthUnit,
      );
      return Right(_fixedData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  List<Measurement> _convertToPreferredUnits(
    List<Measurement> measurements,
    String preferredWeightUnit,
    String preferredLengthUnit,
  ) {
    return measurements.map((e) {
      if (e.unit == 'inch' || e.unit == 'cm') {
        if (e.unit != preferredLengthUnit) {
          if (preferredLengthUnit == 'inch') {
            return e.copyWith(value: _convertCmToInch(e.value));
          } else {
            return e.copyWith(value: _convertInchToCm(e.value));
          }
          // e.copyWith(unit: preferredLengthUnit);
        }
        return e;
      } else if (e.unit == 'kg' || e.unit == 'lbs') {
        if (e.unit != preferredWeightUnit) {
          if (preferredWeightUnit == 'kg') {
            return e.copyWith(value: _convertPoundToKg(e.value));
          } else {
            return e.copyWith(value: _convertKgToPound(e.value));
          }
          // e.copyWith(unit: preferredWeightUnit);
        }
        return e;
      } else {
        return e;
      }
    }).toList();
  }

  @override
  Future<Either<String, Unit>> updateMeasurement({
    required Measurement measurement,
  }) {
    // TODO: implement updateMeasurement
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<String>>> getAddedTypes() async {
    try {
      final _db = await databaseService.database;
      final _data =
          await _db.rawQuery('SELECT DISTINCT(type) from measurements');

      final _dData = _data.map((e) => e['type'] as String).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

extension on double {
  double toFixedOfTwo() => num.parse(toStringAsFixed(2)) as double;
}
