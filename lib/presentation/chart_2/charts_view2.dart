import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/chart_models.dart';
import 'widgets/body_measurement_chart.dart';

class ChartsView2 extends StatefulWidget {
  const ChartsView2({
    super.key,
    this.data,
    this.config,
    this.defaultFilter = ChartFilter.month,
  });

  final List<DataPoint>? data;
  final ChartConfig? config;
  final ChartFilter defaultFilter;

  @override
  State<ChartsView2> createState() => _ChartsView2State();
}

class _ChartsView2State extends State<ChartsView2> {
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  final DateFormat _dayMonthFormatter = DateFormat('d MMM');

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
        value: 68.8,
      ),
      DataPoint(
        dateTime: now.subtract(const Duration(days: 12, hours: 20)),
        value: 68.6,
      ),
      DataPoint(dateTime: now.subtract(const Duration(days: 10)), value: 68.5),
      DataPoint(dateTime: now.subtract(const Duration(days: 8)), value: 68.2),
      // Multiple entries on the same day (5 days ago)
      DataPoint(
        dateTime: now.subtract(const Duration(days: 5, hours: 7)),
        value: 68.0,
      ),
      DataPoint(
        dateTime: now.subtract(const Duration(days: 5, hours: 19)),
        value: 67.9,
      ),
      DataPoint(dateTime: now.subtract(const Duration(days: 3)), value: 67.8),
      // Gap here to demonstrate interpolation (between day 3 and day 1)
      DataPoint(
        dateTime: now.subtract(const Duration(days: 1, hours: 12)),
        value: 67.5,
      ),
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

  List<DataPoint> get _chartData => widget.data ?? _mockWeightData;

  ChartConfig get _chartConfig => widget.config ?? _weightChartConfig;

  bool get _isUsingMockData => widget.data == null || widget.config == null;

  List<DataPoint> get _sortedChartData {
    final copy = List<DataPoint>.from(_chartData);
    copy.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return copy;
  }

  String _valueText(double value) {
    return '${value.toStringAsFixed(1)} ${_chartConfig.unit}'.trim();
  }

  String _relativeDateText(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final diff = today.difference(target).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff > 1 && diff <= 7) return '$diff days ago';
    return _dayMonthFormatter.format(date);
  }

  Widget _buildMeasurementElements(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final measurements = _sortedChartData;

    if (measurements.isEmpty) {
      return const SizedBox.shrink();
    }

    final latest = measurements.first;
    final recentRows = measurements.take(8).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Measurements',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '${measurements.length}',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: colorScheme.primaryContainer,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.45),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.bolt_rounded,
                  size: 20,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _valueText(latest.value),
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _relativeDateText(latest.dateTime),
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onPrimaryContainer.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colorScheme.surfaceContainerHigh,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: recentRows.asMap().entries.map((entry) {
                final index = entry.key;
                final measurement = entry.value;
                final hasOlder = index + 1 < recentRows.length;
                final delta = hasOlder
                    ? measurement.value - recentRows[index + 1].value
                    : null;
                final isUp = delta != null && delta > 0;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 3,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colorScheme.surface,
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -1),
                      leading: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: colorScheme.secondaryContainer,
                        ),
                        child: Icon(
                          Icons.show_chart_rounded,
                          size: 16,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      title: Text(
                        _valueText(measurement.value),
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        _dateFormatter.format(measurement.dateTime),
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      trailing: delta == null
                          ? Text(
                              _relativeDateText(measurement.dateTime),
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color:
                                    (isUp
                                            ? colorScheme.tertiaryContainer
                                            : colorScheme.errorContainer)
                                        .withValues(alpha: 0.85),
                              ),
                              child: Text(
                                '${isUp ? '+' : ''}${delta.toStringAsFixed(1)}',
                                style: textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isUp
                                      ? colorScheme.onTertiaryContainer
                                      : colorScheme.onErrorContainer,
                                ),
                              ),
                            ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isUsingMockData ? 'Body Measurement Charts' : _chartConfig.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isUsingMockData) ...[
                Text(
                  'Phase 8: Animations & Polish Complete',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Smooth animations on filter changes and navigation (400ms fade/scale), enhanced filter tabs with InkWell ripple effects and shadows, polished navigation with animated opacity transitions, improved chart styling with rounded corners, subtle shadows, and dashed grid lines, gradient line styling with increased smoothness (0.35), and performance-optimized animations using SingleTickerProvider.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),
              ],

              // Weight Chart
              BodyMeasurementChart(
                data: _chartData,
                config: _chartConfig,
                defaultFilter: widget.defaultFilter,
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.all(8),
                child: _buildMeasurementElements(context),
              ),

              const SizedBox(height: 24),

              if (_isUsingMockData)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mock Data Summary',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Total data points: ${_chartData.length}'),
                        Text(
                          'Date range: ${_chartData.first.dateTime.toString().split(' ')[0]} to ${_chartData.last.dateTime.toString().split(' ')[0]}',
                        ),
                        Text(
                          '${_chartConfig.title} range: ${_chartData.map((e) => e.value).reduce((a, b) => a < b ? a : b)} ${_chartConfig.unit} to ${_chartData.map((e) => e.value).reduce((a, b) => a > b ? a : b)} ${_chartConfig.unit}',
                        ),
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
