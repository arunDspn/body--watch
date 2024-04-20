import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/data/domain/models/two_dates_record_model.dart';

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

  final lastestQueryBard1 = '''
SELECT id, value, date, type, unit
FROM (
  SELECT id, value, date, type, unit,
    DENSE_RANK() OVER (PARTITION BY type ORDER BY date DESC) AS rank
  FROM measurements
) AS ranked
WHERE rank <= 2
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
  Future<Either<String, Unit>> deleteAllData({
    String? id,
  }) async {
    try {
      await databaseService.delete(
        id: id,
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
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
      final _data = await _db.rawQuery(lastestQueryBard1);
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
  }) async {
    try {
      await databaseService.update(
        map: measurement.toMap(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<String>>> getAddedTypes() async {
    try {
      final _db = await databaseService.database;
      final _data =
          await _db.rawQuery('SELECT DISTINCT(type) from measurements');

      final _dData = _data.map((e) => e['type']! as String).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> backupDatabase() async {
    try {
      final _data = await databaseService.getData();
      final _jsonData = const JsonEncoder().convert(_data);
      return Right(_jsonData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> restoreDatabase({
    bool merge = false,
    required String stringifiedDatas,
  }) async {
    try {
      //
      final dynamic _datas = const JsonDecoder().convert(stringifiedDatas);
      // as List<Map<String, dynamic>>;
      // Merge or delete all data and insert new data
      if (!merge) {
        await databaseService.delete();
      }
      await databaseService.restoreData(
        datas: _datas,
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteMeasurement({required String id}) async {
    try {
      await databaseService.delete(
        id: id,
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Measurement>>> getAllMeasurementsByDate({
    required DateTime date,
  }) async {
    try {
      // final stringDate = date.toIso8601String();
      final _db = await databaseService.database;
      // final _data = await _db.query(
      //   'measurements',
      //   where: 'date = ?',
      //   whereArgs: [
      //     stringDate,
      //   ],
      // );
      final formattedDate =
          date.toIso8601String().substring(0, 10); // Extract YYYY-MM-DD
      final whereArgs = [formattedDate];

      final result = await _db.rawQuery(
        '''
      SELECT *
      FROM measurements
      WHERE STRFTIME('%Y-%m-%d', date) = ?
      ''',
        whereArgs,
      );
      final _dData = result.map(Measurement.fromMap).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
    // TODO: implement getAllMeasurementsByDate
    // throw UnimplementedError();
  }

  @override
  Future<Either<String, List<TwoDatesRecord>>> getAllRecordsByTwoDates({
    required DateTime dateOne,
    required DateTime dateTwo,
  }) async {
    // TODO: implement getAllRecordsByTwoDates
    // throw UnimplementedError();

    try {
      final db = await databaseService.database;

      //     final result = await db.rawQuery('''
      //   SELECT m1.name, m1.VALUE AS data1, m2.VALUE AS data2
      //   FROM measurements AS m1
      //   FULL JOIN (
      //     SELECT name, VALUE
      //     FROM measurements
      //     WHERE STRFTIME("%Y-%m-%d", date) = ${dateOne.toIso8601String().substring(0, 10)}
      //   ) AS m2 ON m1.name = m2.name
      //   WHERE STRFTIME("%Y-%m-%d", m1.date) = ${dateTwo.toIso8601String().substring(0, 10)}
      // };
      // ''');
      final date = dateOne.toIso8601String().substring(0, 10);
      final sime = await db.query(
        'measurements',
        columns: [
          'type',
          'value',
        ],
        where: 'date = ?',
        whereArgs: [
          date,
        ],
      );

      final resultOne = await db.query(
        'measurements',
        // columns: [
        //   'type',
        //   'value',
        // ],
        where: 'STRFTIME("%Y-%m-%d", date) = ?',
        whereArgs: [
          dateOne.toIso8601String().substring(0, 10),
        ],
      );

      final resultTwo = await db.query(
        'measurements',
        // columns: [
        //   'type',
        //   'value',
        // ],
        where: 'STRFTIME("%Y-%m-%d", date) = ?',
        whereArgs: [
          dateTwo.toIso8601String().substring(0, 10),
        ],
      );

      final dataOne = resultOne.map(Measurement.fromMap).toList();
      final dataTwo = resultTwo.map(Measurement.fromMap).toList();

      var namesSet = dataOne.map((e) => e.type).toSet();
      namesSet = namesSet.union(dataTwo.map((e) => e.type).toSet());

      final data = namesSet.map((e) {
        return TwoDatesRecord(
          name: e,
          data1:
              dataOne.firstWhereOrNull((element) => element.type == e)?.value,
          data2:
              dataTwo.firstWhereOrNull((element) => element.type == e)?.value,
        );
      }).toList();

      return Right(data);

      // return right(result.map(TwoDatesRecord.fromJson).toList());
    } catch (exception) {
      return left(exception.toString());
    }
  }
}

extension on double {
  double toFixedOfTwo() => num.parse(toStringAsFixed(2)) as double;
}
