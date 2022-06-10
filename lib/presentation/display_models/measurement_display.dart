import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class LatestMeasurementDisplayModel {
  LatestMeasurementDisplayModel({
    required this.name,
    required this.latest,
    required this.previous,
    required this.delta,
  });

  factory LatestMeasurementDisplayModel.fromMeasurementList({
    required List<Measurement> measurement,
  }) {
    return LatestMeasurementDisplayModel(
      name: measurementTypeFromString(measurement.first.type)!,
      latest: measurement.first,
      delta: measurement.length == 1 ? null : _calculateDifference(measurement),
      previous: measurement.length == 1 ? null : measurement.last.date,
    );
  }

  final MeasurementType name;
  final Measurement latest;
  final DateTime? previous;
  final double? delta;
}

double _calculateDifference(List<Measurement> measurement) {
  return measurement.first.value - measurement.last.value;
}
