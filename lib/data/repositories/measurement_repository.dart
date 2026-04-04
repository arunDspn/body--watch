import 'dart:convert';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:watcha_body/data/services/database_service.dart';
import 'package:watcha_body/domain/measurement/i_measurements.dart';
import 'package:watcha_body/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/domain/measurement/models/measurement_model.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/domain/metrics_units/models/metric_units_model.dart';
import 'package:watcha_body/domain/models/two_dates_record_model.dart';

class MeasurementRepository extends IMeasurementsFacade {
  MeasurementRepository(this.databaseService);

  final DatabaseService databaseService;

  // static const _latestDetailsQuery = '''
  //   WITH ranked AS
  //   (SELECT id, value, date, type, unit,row_number()
  //   OVER (PARTITION BY type ORDER BY date DESC) AS rn
  //   FROM measurements)
  //   SELECT id, value, date, type, unit
  //   FROM ranked
  //   WHERE rn <= 2
  //   ORDER BY type, date DESC;
  //   ''';

  final _lastestQueryBard1 = '''
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
    required MeasurementEntity measurement,
  }) async {
    try {
      final db = await databaseService.database;
      await db.insert(
        DatabaseService.measurementsDataTable,
        measurement.toJson()..remove('id'),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteAllData({String? id}) async {
    // try {
    //   await databaseService.delete(
    //     id: id,
    //   );
    //   return const Right(unit);
    // } catch (e) {
    //   return Left(e.toString());
    // }
    throw UnimplementedError();
  }

  // @override
  // Future<Either<String, List<Measurement>>> getMeasurementItemDataByDateRange({
  //   required DateTime startDate,
  //   required DateTime endDate,
  //   required int measurementItemId,
  //   required String preferredWeightUnit,
  //   required String preferredLengthUnit,
  // }) async {
  //   throw UnimplementedError();

  //   // try {
  //   //   final _data = await databaseService.getData(
  //   //     startDate: startDate,
  //   //     endDate: endDate,
  //   //     type: type,
  //   //   );
  //   //   final _dData = _data.map(Measurement.fromMap).toList();
  //   //   final _fixedData = _convertToPreferredUnits(
  //   //     _dData,
  //   //     preferredWeightUnit,
  //   //     preferredLengthUnit,
  //   //   );
  //   //   return Right(_fixedData);
  //   // } catch (e) {
  //   //   return Left(e.toString());
  //   // }
  // }

  double _convertInchToCm(double inch) => (inch * 2.54).toFixedOfTwo();
  double _convertCmToInch(double cm) => (cm / 2.54).toFixedOfTwo();
  double _convertPoundToKg(double pound) => (pound / 2.20462262).toFixedOfTwo();
  double _convertKgToPound(double kg) => (kg * 2.20462262).toFixedOfTwo();

  @override
  Future<Either<String, List<MeasurementEntity>>> getLatestDetails() async {
    // try {
    // //   final _db = await databaseService.database;
    // //   final _data = await _db.rawQuery(_lastestQueryBard1);
    // //   final _dData = _data.map(Measurement.fromMap).toList();
    // //   final _fixedData = _convertToPreferredUnits(
    // //     _dData,
    // //     preferredWeightUnit,
    // //     preferredLengthUnit,
    // //   );
    // //   return Right(_fixedData);
    // // } catch (e) {
    // //   return Left(e.toString());
    // // }

    // throw UnimplementedError();
    // } catch (e) {
    //   return Left(e.toString());
    // }
    throw UnimplementedError();
  }

  List<MeasurementEntity> _convertToPreferredUnits(
    List<MeasurementEntity> measurements,
    String preferredWeightUnit,
    String preferredLengthUnit,
  ) {
    // return measurements.map((e) {
    //   if (e.unit == 'inch' || e.unit == 'cm') {
    //     if (e.unit != preferredLengthUnit) {
    //       if (preferredLengthUnit == 'inch') {
    //         return e.copyWith(value: _convertCmToInch(e.value));
    //       } else {
    //         return e.copyWith(value: _convertInchToCm(e.value));
    //       }
    //       // e.copyWith(unit: preferredLengthUnit);
    //     }
    //     return e;
    //   } else if (e.unit == 'kg' || e.unit == 'lbs') {
    //     if (e.unit != preferredWeightUnit) {
    //       if (preferredWeightUnit == 'kg') {
    //         return e.copyWith(value: _convertPoundToKg(e.value));
    //       } else {
    //         return e.copyWith(value: _convertKgToPound(e.value));
    //       }
    //       // e.copyWith(unit: preferredWeightUnit);
    //     }
    //     return e;
    //   } else {
    //     return e;
    //   }
    // }).toList();

    throw UnimplementedError();
  }

  @override
  Future<Either<String, Unit>> updateMeasurement({
    required MeasurementEntity measurement,
  }) async {
    // try {
    //   await databaseService.update(
    //     map: measurement.toMap(),
    //   );
    //   return const Right(unit);
    // } catch (e) {
    //   return Left(e.toString());
    // }
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<MeasurementTargetModel>>> getAddedTypes() async {
    try {
      final _db = await databaseService.database;

      final _data = await _db.rawQuery(
        '''
        SELECT 
          mt.*,
          m.code as metric_code,
          m.base_unit,
          mu.unit,
          mu.to_base_factor
        FROM ${DatabaseService.measurementTargetsTable} mt
        JOIN ${DatabaseService.targetMetricsTable} tm ON tm.target_id = mt.id
        JOIN ${DatabaseService.metricsTable} m ON m.id = tm.metric_id
        JOIN ${DatabaseService.metricUnitsTable} mu ON mu.metric_id = m.id
        WHERE NOT EXISTS (
          SELECT 1
          FROM ${DatabaseService.measurementsDataTable} md
          WHERE md.target_id = mt.id
            AND md.user_id = ?
        )
        ORDER BY mt.display_order;
      ''',
        [1],
      );

      log(_data.toString());

      final _dData = _transformUnitsToNestedStructureInTarget(_data);
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  List<MeasurementTargetModel> _transformUnitsToNestedStructureInTarget(
    List<Map<String, dynamic>> flatResults,
  ) {
    // Group by id
    final grouped = groupBy<Map<String, dynamic>, int>(
      flatResults,
      (row) => row['id'] as int,
    );

    // Transform each group into a Target object
    final targets = grouped.entries.map((entry) {
      final id = entry.key;
      final rows = entry.value;

      // Take common fields from first row
      final firstRow = rows.first;

      // Create units list from all rows in this group
      final units = rows.map((row) {
        return MetricUnitsModel(
          unit: row['unit'] as String,
          toBaseFactor: (row['to_base_factor'] as num).toDouble(),
          // baseUnit: row['base_unit'] as String,
          code: row['code'] as String,
        );
      }).toList();

      return MeasurementTargetModel(
        id: id,
        name: firstRow['name'] as String,
        code: firstRow['code'] as String,
        type: firstRow['type'] as String,
        category: firstRow['category'] as String,
        displayOrder: firstRow['display_order'] as int,
        metricCode: firstRow['metric_code'] as String,
        units: units,
      );
    }).toList();

    return targets;
  }

  @override
  Future<Either<String, String>> backupDatabase() async {
    // try {
    //   final _data = await databaseService.getData();
    //   final _jsonData = const JsonEncoder().convert(_data);
    //   return Right(_jsonData);
    // } catch (e) {
    //   return Left(e.toString());
    // }
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Unit>> restoreDatabase({
    bool merge = false,
    required String stringifiedDatas,
  }) async {
    // try {
    //   //
    //   final dynamic _datas = const JsonDecoder().convert(stringifiedDatas);
    //   // as List<Map<String, dynamic>>;
    //   // Merge or delete all data and insert new data
    //   if (!merge) {
    //     await databaseService.delete();
    //   }
    //   await databaseService.restoreData(
    //     datas: _datas,
    //   );
    //   return const Right(unit);
    // } catch (e) {
    //   return Left(e.toString());
    // }

    throw UnimplementedError();
  }

  @override
  Future<Either<String, Unit>> deleteMeasurement({required String id}) async {
    // try {
    //   await databaseService.delete(
    //     id: id,
    //   );
    //   return const Right(unit);
    // } catch (e) {
    //   return Left(e.toString());
    // }

    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<MeasurementModel>>> getAllMeasurementsByDate({
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

      final formattedDate = date.toIso8601String().substring(
        0,
        10,
      ); // Extract YYYY-MM-DD
      final whereArgs = [formattedDate];

      final result = await _db.rawQuery('''
            SELECT 
              m.id,
              m.value,
              m.date,
              m.notes,
              m.target_id,
              m.created_at,
              m.updated_at,
              mt.name as target_name,
              mt.type,
              met.code as metric_code,
              met.base_unit
            FROM (
              SELECT 
                *,
                ROW_NUMBER() OVER (PARTITION BY target_id ORDER BY date DESC, id DESC) as rn
              FROM ${DatabaseService.measurementsDataTable}
              WHERE user_id = 1 AND STRFTIME("%Y-%m-%d", date) = ?

            ) m
            INNER JOIN ${DatabaseService.measurementTargetsTable} mt ON m.target_id = mt.id
            INNER JOIN ${DatabaseService.targetMetricsTable} tm ON mt.id = tm.target_id
            INNER JOIN ${DatabaseService.metricsTable} met ON tm.metric_id = met.id
            ORDER BY m.target_id, m.date DESC
          ''', whereArgs);

      final _dData = result.map(MeasurementModel.fromJson).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TwoDatesRecord>>> getAllRecordsByTwoDates({
    required DateTime dateOne,
    required DateTime dateTwo,
  }) async {
    try {
      final db = await databaseService.database;

      // Query for first date
      final resultOne = await db.rawQuery(
        '''
        SELECT 
          m.value,
          m.date,
          mt.name as target_name,
          met.code as metric_code
        FROM ${DatabaseService.measurementsDataTable} m
        INNER JOIN ${DatabaseService.measurementTargetsTable} mt ON m.target_id = mt.id
        INNER JOIN ${DatabaseService.targetMetricsTable} tm ON mt.id = tm.target_id
        INNER JOIN ${DatabaseService.metricsTable} met ON tm.metric_id = met.id
        WHERE m.user_id = ? AND STRFTIME("%Y-%m-%d", m.date) = ?
        ORDER BY mt.name
        ''',
        [1, dateOne.toIso8601String().substring(0, 10)],
      );

      // Query for second date
      final resultTwo = await db.rawQuery(
        '''
        SELECT 
          m.value,
          m.date,
          mt.name as target_name,
          met.code as metric_code
        FROM ${DatabaseService.measurementsDataTable} m
        INNER JOIN ${DatabaseService.measurementTargetsTable} mt ON m.target_id = mt.id
        INNER JOIN ${DatabaseService.targetMetricsTable} tm ON mt.id = tm.target_id
        INNER JOIN ${DatabaseService.metricsTable} met ON tm.metric_id = met.id
        WHERE m.user_id = ? AND STRFTIME("%Y-%m-%d", m.date) = ?
        ORDER BY mt.name
        ''',
        [1, dateTwo.toIso8601String().substring(0, 10)],
      );

      log(resultOne.toString());
      log(resultTwo.toString());

      // final recordsDateOne = resultOne.map(MeasurementModel.fromJson).toList();

      // final recordsDateTwo = resultTwo.map(MeasurementModel.fromJson).toList();

      final combinedRecords = <TwoDatesRecord>[];

      // Group resultOne by target_name
      final groupedResultOne = <String, Map<String, dynamic>>{};
      for (final record in resultOne) {
        groupedResultOne[record['target_name'] as String] = record;
      }

      // Group resultTwo by target_name
      final groupedResultTwo = <String, Map<String, dynamic>>{};
      for (final record in resultTwo) {
        groupedResultTwo[record['target_name'] as String] = record;
      }

      // Get all unique target names from both results
      final allTargetNames = <String>{
        ...groupedResultOne.keys,
        ...groupedResultTwo.keys,
      };

      // Create combined records
      for (final targetName in allTargetNames) {
        final recordOne = groupedResultOne[targetName];
        final recordTwo = groupedResultTwo[targetName];

        combinedRecords.add(
          TwoDatesRecord(
            name: targetName,
            data1: recordOne?['value'] as double?,
            data2: recordTwo?['value'] as double?,
            metricCode1: recordOne?['metric_code'] as String?,
            metricCode2: recordTwo?['metric_code'] as String?,
          ),
        );
      }
      return Right(combinedRecords);
    } catch (exception) {
      return left(exception.toString());
    }
  }

  @override
  Future<Either<String, List<String>>> getAllMeasurementItems() async {
    try {
      final db = await databaseService.database;
      final result = await db.query('', columns: ['name']);
      final muscleGroups = result.map((e) => e['name'] as String).toList();
      return Right(muscleGroups);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<MeasurementEntity>>>
  getMeasurementItemDataByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    required int measurementItemId,
  }) {
    // TODO: implement getMeasurementItemDataByDateRange
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Map<String, List<MeasurementModel>>>>
  getLatestThreeMeasurements({int userId = 1}) async {
    try {
      final db = await databaseService.database;
      final result = await db.rawQuery(
        '''
            SELECT 
              m.id,
              m.value,
              m.date,
              m.notes,
              m.target_id,
              m.created_at,
              m.updated_at,
              mt.name as target_name,
              mt.type,
              met.code as metric_code,
              met.base_unit
            FROM (
              SELECT 
                *,
                ROW_NUMBER() OVER (PARTITION BY target_id ORDER BY date DESC, id DESC) as rn
              FROM ${DatabaseService.measurementsDataTable}
              WHERE user_id = ?
            ) m
            INNER JOIN ${DatabaseService.measurementTargetsTable} mt ON m.target_id = mt.id
            INNER JOIN ${DatabaseService.targetMetricsTable} tm ON mt.id = tm.target_id
            INNER JOIN ${DatabaseService.metricsTable} met ON tm.metric_id = met.id
            WHERE m.rn <= 3
            ORDER BY m.target_id, m.date DESC
          ''',
        [userId],
      );
      final _dData = result.map(MeasurementModel.fromJson).toList();

      final groupedData = <String, List<MeasurementModel>>{};
      for (final measurement in _dData) {
        final type = measurement.targetName;
        if (groupedData.containsKey(type)) {
          groupedData[type]!.add(measurement);
        } else {
          groupedData[type] = [measurement];
        }
      }
      return Right(groupedData);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

extension on double {
  double toFixedOfTwo() => num.parse(toStringAsFixed(2)) as double;
}
