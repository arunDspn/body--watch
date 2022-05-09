import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/domain/models/pmeasurement.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            series: <LineSeries<Chest, DateTime>>[
              LineSeries<Chest, DateTime>(
                dataSource: <Chest>[
                  Chest(50, DateTime(2020, 1, 1)),
                  Chest(51, DateTime(2020, 1, 2)),
                  Chest(52, DateTime(2020, 1, 3)),
                  Chest(51, DateTime(2020, 2, 1)),
                  Chest(48, DateTime(2020, 3, 1)),
                  Chest(49, DateTime(2020, 4, 1)),
                  Chest(50, DateTime(2020, 5, 1)),
                  Chest(51, DateTime(2020, 6, 1)),
                  Chest(48, DateTime(2020, 7, 1)),
                  Chest(49, DateTime(2020, 8, 1)),
                ],
                xValueMapper: (Chest chest, _) => chest.date,
                yValueMapper: (Chest chest, _) => chest.measurement,
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
