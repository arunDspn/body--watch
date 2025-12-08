import 'package:dartz/dartz.dart';
import 'package:watcha_body/domain/measurement_target/model/measurement_target_model.dart';

abstract class IMeasurementTargetRepository {
  /// Returns List of [MeasurementTargetModel]s
  Future<Either<String, List<MeasurementTargetModel>>>
      getAllMeasurementTargets();

  /// Returns List of [MeasurementTargetModel]s that aren't added in
  /// measurements table
  Future<Either<String, List<MeasurementTargetModel>>>
      getUnaddedMeasurementTargets();

  /// Creates a new [MeasurementTargetModel]
  Future<Either<String, Unit>> createMeasurementTarget({
    required MeasurementTargetModel measurementTarget,
  });

  /// Updates a [MeasurementTargetModel]
  Future<Either<String, Unit>> updateMeasurementTarget({
    required MeasurementTargetModel measurementTarget,
  });

  /// Deletes a [MeasurementTargetModel]
  Future<Either<String, Unit>> deleteMeasurementTarget({
    required String id,
  });
}
