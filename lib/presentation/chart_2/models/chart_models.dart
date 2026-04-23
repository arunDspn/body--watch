import 'package:flutter/material.dart';

/// Represents a single data point for the chart
class DataPoint {
  final DateTime dateTime;
  final double value;
  final String source;
  final String? method;

  const DataPoint({
    required this.dateTime,
    required this.value,
    this.source = 'manual',
    this.method,
  });

  String get sourceLabel =>
      source == 'estimated_formula' ? 'Estimated' : 'Manual';

  @override
  String toString() {
    return 'DataPoint(dateTime: $dateTime, value: $value, source: $source, method: $method)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataPoint &&
        other.dateTime == dateTime &&
        other.value == value &&
        other.source == source &&
        other.method == method;
  }

  @override
  int get hashCode => Object.hash(dateTime, value, source, method);
}

class ChartRangeBand {
  const ChartRangeBand({
    required this.start,
    required this.end,
    required this.color,
    required this.label,
  });

  final double start;
  final double end;
  final Color color;
  final String label;
}

/// Configuration class for chart styling and behavior
class ChartConfig {
  final String unit; // e.g., 'kg', 'cm', '%'
  final String title; // e.g., 'Weight', 'Height'
  final Color color; // Line and point color
  final Color? backgroundColor;
  final bool showGridLines; // Default: true (horizontal only)
  final List<ChartRangeBand> rangeBands;

  const ChartConfig({
    required this.unit,
    required this.title,
    required this.color,
    this.backgroundColor,
    this.showGridLines = true,
    this.rangeBands = const <ChartRangeBand>[],
  });

  @override
  String toString() {
    return 'ChartConfig(unit: $unit, title: $title, color: $color, backgroundColor: $backgroundColor, showGridLines: $showGridLines)';
  }
}

/// Enum for different time filter types
enum ChartFilter {
  week('Week'),
  month('Month'),
  threeMonth('3 Month'),
  year('Year');

  const ChartFilter(this.displayName);

  final String displayName;

  @override
  String toString() => displayName;
}
