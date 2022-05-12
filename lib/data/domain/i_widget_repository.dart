import 'package:dartz/dartz.dart';
import 'package:watcha_body/data/domain/models/measurement_widget.dart';

abstract class IWidgetRepository {
  Future<Either<String, Unit>> addWidget({
    required MeasurementWidget measurementWidget,
  });
  Future<Either<String, Unit>> removeWidget();
  Future<Either<String, List<MeasurementWidget>>> getAddedWidgets();
  Future<Either<String, List<MeasurementWidget>>> getAllWidgets();
}
