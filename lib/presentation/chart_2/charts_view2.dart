import 'package:flutter/material.dart';
import 'models/chart_models.dart';
import 'widgets/body_measurement_chart.dart';

class ChartsView2 extends StatefulWidget {
  const ChartsView2({super.key});

  @override
  State<ChartsView2> createState() => _ChartsView2State();
}

class _ChartsView2State extends State<ChartsView2> {
  // Mock data for testing
  List<DataPoint> get _mockWeightData {
    final now = DateTime.now();
    return [
      DataPoint(dateTime: now.subtract(const Duration(days: 30)), value: 70.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 28)), value: 70.2),
      DataPoint(dateTime: now.subtract(const Duration(days: 25)), value: 70.0),
      DataPoint(dateTime: now.subtract(const Duration(days: 22)), value: 69.8),
      DataPoint(dateTime: now.subtract(const Duration(days: 20)), value: 69.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 18)), value: 69.3),
      DataPoint(dateTime: now.subtract(const Duration(days: 15)), value: 69.0),
      // Multiple entries on the same day (12 days ago)
      DataPoint(
          dateTime: now.subtract(const Duration(days: 12, hours: 8)),
          value: 68.8),
      DataPoint(
          dateTime: now.subtract(const Duration(days: 12, hours: 20)),
          value: 68.6),
      DataPoint(dateTime: now.subtract(const Duration(days: 10)), value: 68.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 8)), value: 68.2),
      // Multiple entries on the same day (5 days ago)
      DataPoint(
          dateTime: now.subtract(const Duration(days: 5, hours: 7)),
          value: 68.0),
      DataPoint(
          dateTime: now.subtract(const Duration(days: 5, hours: 19)),
          value: 67.9),
      DataPoint(dateTime: now.subtract(const Duration(days: 3)), value: 67.8),
      // Gap here to demonstrate interpolation (between day 3 and day 1)
      DataPoint(
          dateTime: now.subtract(const Duration(days: 1, hours: 12)),
          value: 67.5),
      DataPoint(dateTime: now, value: 67.3),
    ];
  }

  ChartConfig get _weightChartConfig {
    return const ChartConfig(
      unit: 'kg',
      title: 'Weight Progress',
      color: Colors.blue,
      backgroundColor: Colors.blue,
      showGridLines: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Measurement Charts'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction text
              Text(
                'Phase 6: Interactions & Tooltips Complete',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enhanced tooltip display with \"Value - Date\" format, improved tap feedback with visual selection, better touch handling, and custom tooltip styling.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 24),

              // Weight Chart
              BodyMeasurementChart(
                data: _mockWeightData,
                config: _weightChartConfig,
                defaultFilter: ChartFilter.month,
              ),

              const SizedBox(height: 32),

              // Data summary
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mock Data Summary',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text('Total data points: ${_mockWeightData.length}'),
                      Text(
                          'Date range: ${_mockWeightData.first.dateTime.toString().split(' ')[0]} to ${_mockWeightData.last.dateTime.toString().split(' ')[0]}'),
                      Text(
                          'Weight range: ${_mockWeightData.map((e) => e.value).reduce((a, b) => a < b ? a : b)} kg to ${_mockWeightData.map((e) => e.value).reduce((a, b) => a > b ? a : b)} kg'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
