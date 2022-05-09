import 'package:dartz/dartz.dart';

abstract class IMeasurementsFacade<T> {
  Future<Either<String, List<T>>> getLatestDetails();
  Future<Either<String, List<T>>> getAllDetails();
  Future<Either<String, Unit>> createMeasurement(T measurement);
  Future<Either<String, Unit>> updateMeasurement(T measurement);
  Future<Either<String, Unit>> deleteMeasurement(String id);
}
