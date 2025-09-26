import 'package:flutter/material.dart';

/// Represents a single data point for the chart
class DataPoint {
  final DateTime dateTime;
  final double value;

  const DataPoint({
    required this.dateTime,
    required this.value,
  });

  @override
  String toString() {
    return 'DataPoint(dateTime: $dateTime, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataPoint &&
        other.dateTime == dateTime &&
        other.value == value;
  }

  @override
  int get hashCode => dateTime.hashCode ^ value.hashCode;
}

/// Configuration class for chart styling and behavior
class ChartConfig {
  final String unit; // e.g., 'kg', 'cm', '%'
  final String title; // e.g., 'Weight', 'Height'
  final Color color; // Line and point color
  final Color? backgroundColor;
  final bool showGridLines; // Default: true (horizontal only)

  const ChartConfig({
    required this.unit,
    required this.title,
    required this.color,
    this.backgroundColor,
    this.showGridLines = true,
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
