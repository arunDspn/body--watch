import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

abstract class IMeasurementsFacade {
  /// Will return a list of [Measurement]s
  /// It contains all types that added in table
  Future<Either<String, List<Measurement>>> getLatestDetails({
    required String preferredWeightUnit,
    required String preferredLengthUnit,
  });

  /// Will return a list of [Measurement]s
  /// It contains all types ex: Chest, Waist, etc.. that added in table
  /// startDate and endDate are optional
  /// if its empty all data will be returned
  Future<Either<String, List<Measurement>>> getDetailsByDate({
    required String preferredWeightUnit,
    required String preferredLengthUnit,
    DateTime? startDate,
    DateTime? endDate,
    String? type,
  });

  /// Creates a new [Measurement]
  Future<Either<String, Unit>> createMeasurement({
    required Measurement measurement,
  });

  /// Updates a [Measurement]
  /// Based on [Measurement.id]
  Future<Either<String, Unit>> updateMeasurement({
    required Measurement measurement,
  });

  /// Deletes a [Measurement]
  /// Based on [Measurement.id]
  Future<Either<String, Unit>> deleteMeasurement({
    String? id,
  });

  /// Returns List of Types added in table as String
  /// Use this filter it with All Types available from App Binary
  /// To get remaining types
  Future<Either<String, List<String>>> getAddedTypes();

  Future<Either<String, String>> backupDatabase();

  Future<Either<String, Unit>> restoreDatabase({
    bool merge = false,
    required String stringifiedDatas,
  });
}
