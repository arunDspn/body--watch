import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/domain/measurement/models/measurement_entity.dart';
import 'package:watcha_body/data/domain/measurement/models/measurement_model.dart';
import 'package:watcha_body/data/domain/measurement_target/model/measurement_target_model.dart';
import 'package:watcha_body/data/domain/models/two_dates_record_model.dart';

abstract class IMeasurementsFacade {
  /// Will return a list of each latest Measurement from
  /// all added Measurement Targets
  /// Used in Home Screen -- Overview Section
  Future<Either<String, List<MeasurementEntity>>> getLatestDetails();

  /// Will return a list of [MeasurementEntity]s
  /// It contains all types ex: Chest, Waist, etc.. that added in table
  /// startDate and endDate are optional
  /// if its empty all data will be returned
  Future<Either<String, List<MeasurementEntity>>>
      getMeasurementItemDataByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    required int measurementItemId,
  });

  /// Creates a new [MeasurementEntity]
  Future<Either<String, Unit>> createMeasurement({
    required MeasurementEntity measurement,
  });

  /// Updates a [MeasurementEntity]
  /// Based on [MeasurementEntity.id]
  Future<Either<String, Unit>> updateMeasurement({
    required MeasurementEntity measurement,
  });

  /// Deletes all [MeasurementEntity] Data
  Future<Either<String, Unit>> deleteAllData({
    String? id,
  });

  /// Deletes a [MeasurementEntity]
  /// Based on [MeasurementEntity.id]
  Future<Either<String, Unit>> deleteMeasurement({
    required String id,
  });

  /// Gets latest 3 Measurements data of all added measurement types
  Future<Either<String, Map<String, List<MeasurementModel>>>>
      getLatestThreeMeasurements({
    int userId = 1,
  });

  /// Returns List of Types added in table as String
  /// Use this filter it with All Types available from App Binary
  /// To get remaining types
  Future<Either<String, List<MeasurementTargetModel>>> getAddedTypes();

  Future<Either<String, String>> backupDatabase();

  Future<Either<String, Unit>> restoreDatabase({
    bool merge = false,
    required String stringifiedDatas,
  });

  /// Returns List of [MeasurementEntity]s
  /// It contains  all types ex: Chest, Waist, etc.. that added in table
  Future<Either<String, List<MeasurementModel>>> getAllMeasurementsByDate({
    required DateTime date,
  });

  /// Get all records by two dates
  Future<Either<String, List<TwoDatesRecord>>> getAllRecordsByTwoDates({
    required DateTime dateOne,
    required DateTime dateTwo,
  });

  /// Get all measurement items
  Future<Either<String, List<String>>> getAllMeasurementItems();
}
