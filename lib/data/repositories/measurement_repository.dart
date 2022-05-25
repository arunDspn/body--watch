import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class MeasurementRepository extends IMeasurementsFacade {
  MeasurementRepository(this.databaseService);

  final DatabaseService databaseService;
  @override
  Future<Either<String, Unit>> createMeasurement({
    required String tableName,
    required Measurement measurement,
  }) async {
    try {
      await databaseService.insert(
        tableName: tableName,
        map: measurement.toMap(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteMeasurement({
    required String tableName,
    required String id,
  }) {
    // TODO: implement deleteMeasurement
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Measurement>>> getAllDetails({
    required String tableName,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final _data = await databaseService.getData(
        tableName: tableName,
        orderBy: 'date DESC',
        startDate: startDate,
        endDate: endDate,
      );
      final _dData = _data.map(Measurement.fromMap).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Measurement>>> getLatestDetails({
    required String tableName,
  }) async {
    try {
      final _data = await databaseService.getData(
        tableName: tableName,
        limit: 2,
        orderBy: 'date DESC',
      );
      final _dData = _data.map(Measurement.fromMap).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateMeasurement({
    required String tableName,
    required Measurement measurement,
  }) {
    // TODO: implement updateMeasurement
    throw UnimplementedError();
  }
}
