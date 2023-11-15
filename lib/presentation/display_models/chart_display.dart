import 'package:flutter/material.dart';
import 'package:watcha_body/app/data/app_data.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';

class ChartDisplayModel {
  ChartDisplayModel({
    required this.measurementName,
    required this.type,
    // required this.measurementList,
    required this.lastMeasurement,
  });

  factory ChartDisplayModel.fromMeasurementList({
    required List<Measurement> measurement,
    required String name,
  }) {
    return ChartDisplayModel(
      type: measurementTypeFromString(name)!,
      measurementName: name,
      // measurementList: _createSampleData(measurement),
      lastMeasurement: measurement.first.value.toStringAsFixed(2),
    );
  }

  final String measurementName;
  final MeasurementType type;
  final String lastMeasurement;
  // final List<charts.Series<Measurement, DateTime>> measurementList;
}

/// Create one series with sample hard coded data.
// List<charts.Series<Measurement, DateTime>> _createSampleData(
//   List<Measurement> measurements,
// ) {
//   return [
//     charts.Series<Measurement, DateTime>(
//       id: 'Measurements',
//       domainFn: (Measurement sales, _) => sales.date,
//       measureFn: (Measurement sales, _) => sales.value,
//       fillColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
//       colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
//       areaColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.purple),
//       patternColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.purple),
//       seriesColor: charts.ColorUtil.fromDartColor(Colors.purple),
//       data: measurements,
//     )
//   ];
// }
