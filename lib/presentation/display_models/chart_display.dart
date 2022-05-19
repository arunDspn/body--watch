import 'package:charts_flutter/flutter.dart' as charts;
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class ChartDisplayModel {
  ChartDisplayModel({
    required this.measurementName,
    required this.tableName,
    required this.measurementList,
    required this.lastMeasurement,
  });

  factory ChartDisplayModel.fromMeasurementList({
    required List<Measurement> measurement,
    required String name,
    required String tableName,
  }) {
    return ChartDisplayModel(
      tableName: tableName,
      measurementName: name,
      measurementList: _createSampleData(measurement),
      lastMeasurement: measurement.first.measurement.toStringAsFixed(2),
    );
  }

  final String measurementName;
  final String tableName;
  final String lastMeasurement;
  final List<charts.Series<Measurement, DateTime>> measurementList;
}

/// Create one series with sample hard coded data.
List<charts.Series<Measurement, DateTime>> _createSampleData(
  List<Measurement> measurements,
) {
  return [
    charts.Series<Measurement, DateTime>(
      id: 'Sales',
      domainFn: (Measurement sales, _) => sales.date,
      measureFn: (Measurement sales, _) => sales.measurement,
      data: measurements,
    )
  ];
}
