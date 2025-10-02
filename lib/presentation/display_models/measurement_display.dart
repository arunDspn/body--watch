import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/measurement/models/measurement_entity.dart';

class LatestMeasurementDisplayModel {
  LatestMeasurementDisplayModel({
    required this.name,
    required this.latest,
    required this.previous,
    required this.delta,
    required this.lastThreeMonths,
    required this.startDate,
    required this.endDate,
  });

  factory LatestMeasurementDisplayModel.fromMeasurementList({
    required List<MeasurementEntity> measurement,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return LatestMeasurementDisplayModel(
      // name: measurementTypeFromString(measurement.first.type)!,
      name: LengthMeasurementType(name: "Unknown"),
      latest: measurement.first,
      delta: measurement.length == 1 ? null : _calculateDifference(measurement),
      previous: measurement.length == 1 ? null : measurement.last.date,
      lastThreeMonths: measurement,
      startDate: startDate,
      endDate: endDate,
    );
  }

  final MeasurementType name;
  final MeasurementEntity latest;
  final DateTime? previous;
  final double? delta;
  final List<MeasurementEntity> lastThreeMonths;
  final DateTime startDate;
  final DateTime endDate;
}

double _calculateDifference(List<MeasurementEntity> measurement) {
  return measurement.first.value - measurement.last.value;
}
