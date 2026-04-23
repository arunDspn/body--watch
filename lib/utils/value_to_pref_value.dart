import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';

class UserMetricHelper {
  /// Format centimeters as compound feet+inches (e.g., "5' 10\"")
  static String _formatFeetInches(double cm) {
    final totalInches = cm / 2.54;
    final feet = totalInches ~/ 12;
    final inches = (totalInches % 12).round();
    return "$feet' $inches\"";
  }

  /// Format a value as feet+inches or a decimal with unit
  static String formatWithUnit({
    required double value,
    required String unit,
    int decimalPlaces = 2,
  }) {
    if (unit == 'ft') {
      return _formatFeetInches(value);
    }
    return value.toStringAsFixed(decimalPlaces);
  }

  static String convertToUserPref({
    required double value,
    required String metricCode,
    int decimalPlaces = 2,
    required BuildContext context,
    bool showUnit = false,
  }) {
    // Get user preferred units from context

    final userPref =
        (context.read<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;

    // Find the preference for the given metric code
    final preference = userPref.firstWhereOrNull(
      (pref) => pref.metricCode == metricCode,
    );

    if (preference == null) {
      if (metricCode == 'bmi') {
        return value.toStringAsFixed(decimalPlaces);
      }
      throw Exception('No preference found for metric code: $metricCode');
    }

    // Special handling for feet+inches compound format
    if (preference.preferredUnit == 'ft') {
      return _formatFeetInches(value);
    }

    // Convert the value based on the preferred unit

    return (value / preference.toBaseFactor).toStringAsFixed(decimalPlaces) +
        (showUnit ? ' ${preference.preferredUnit}' : '');
  }

  /// Convert user preferred value to base unit value
  static double convertToBaseUnit({
    required double value,
    required String metricCode,
    required BuildContext context,
  }) {
    // Get user preferred units from context
    final userPref =
        (context.read<UserPreferencesCubit>().state as UserPreferencesLoaded)
            .preferences;

    // Find the preference for the given metric code
    final preference = userPref.firstWhereOrNull(
      (pref) => pref.metricCode == metricCode,
    );

    if (preference == null) {
      if (metricCode == 'bmi') {
        return value;
      }
      throw Exception('No preference found for metric code: $metricCode');
    }

    // Convert the value to base unit
    return value * preference.toBaseFactor;
  }
}
