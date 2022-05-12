import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class LatestMeasurementDisplayModel {
  LatestMeasurementDisplayModel({
    required this.name,
    required this.tableName,
    required this.latest,
    required this.previous,
    required this.delta,
  });

  factory LatestMeasurementDisplayModel.fromMeasurementList({
    required List<Measurement> measurement,
    required String name,
    required String tableName,
  }) {
    return LatestMeasurementDisplayModel(
      name: name,
      tableName: tableName,
      latest: measurement.first,
      delta: measurement.length == 1 ? null : _calculate(measurement),
      previous: measurement.length == 1 ? null : measurement.last.date,
    );
  }

  final String name;
  final String tableName;
  final Measurement latest;
  final DateTime? previous;
  final double? delta;
}

double _calculate(List<Measurement> measurement) {
  return measurement.first.measurement - measurement.last.measurement;
}
