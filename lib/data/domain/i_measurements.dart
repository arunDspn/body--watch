import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

abstract class IMeasurementsFacade {
  Future<Either<String, List<Measurement>>> getLatestDetails({
    required String tableName,
  });
  Future<Either<String, List<Measurement>>> getAllDetails({
    required String tableName,
  });
  Future<Either<String, Unit>> createMeasurement({
    required String tableName,
    required Measurement measurement,
  });
  Future<Either<String, Unit>> updateMeasurement({
    required String tableName,
    required Measurement measurement,
  });
  Future<Either<String, Unit>> deleteMeasurement({
    required String tableName,
    required String id,
  });
}
