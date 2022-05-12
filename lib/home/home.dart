import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/domain/models/pmeasurement.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  static const routeName = '/charts';

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: DateTimeAxis(
              maximumLabels: 20,
            ),
            title: ChartTitle(text: 'Chest Measurements'),
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<Measurement, DateTime>>[
              LineSeries<Measurement, DateTime>(
                dataSource: <Measurement>[
                  Measurement(50, DateTime(2020, 1, 1)),
                  Measurement(51, DateTime(2020, 1, 2)),
                  Measurement(52, DateTime(2020, 1, 3)),
                  Measurement(51, DateTime(2020, 2, 1)),
                  Measurement(48, DateTime(2020, 3, 1)),
                  Measurement(49, DateTime(2020, 4, 1)),
                  Measurement(50, DateTime(2020, 5, 1)),
                  Measurement(51, DateTime(2020, 6, 1)),
                  Measurement(48, DateTime(2020, 7, 1)),
                  Measurement(49, DateTime(2020, 8, 1)),
                ],
                xValueMapper: (Measurement chest, _) => chest.date,
                yValueMapper: (Measurement chest, _) => chest.measurement,
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          ),
        ],
      ),
    );
  }
}
