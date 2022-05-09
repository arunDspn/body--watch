import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/data_layer/database_service.dart';
import 'package:watcha_body/data/domain/i_measurements.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class ChestRepo extends IMeasurementsFacade<Chest> {
  ChestRepo(this.databaseService);

  static const _tableName = 'chest';

  final DatabaseService databaseService;
  @override
  Future<Either<String, Unit>> createMeasurement(Chest measurement) async {
    try {
      await databaseService.insert(
        tableName: _tableName,
        map: measurement.toMap(),
      );
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteMeasurement(String id) {
    // TODO: implement deleteMeasurement
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Chest>>> getAllDetails() {
    // TODO: implement getAllDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Chest>>> getLatestDetails() async {
    try {
      final _data = await databaseService.getData(
        tableName: _tableName,
        limit: 2,
      );
      final _dData = _data.map(Chest.fromMap).toList();
      return Right(_dData);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateMeasurement(Chest measurement) {
    // TODO: implement updateMeasurement
    throw UnimplementedError();
  }
}
