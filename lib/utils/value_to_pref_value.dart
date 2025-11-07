import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/app/user_preferences_cubit/user_preferences_cubit.dart';

class UserMetricHelper {
  static String convertToUserPref({
    required double value,
    required String metricCode,
    int decimalPlaces = 2,
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
      throw Exception('No preference found for metric code: $metricCode');
    }

    // Convert the value based on the preferred unit

    return (value / preference.toBaseFactor).toStringAsFixed(decimalPlaces);
  }

  /// Convert user preferred value to base unit value
  static double convertToBaseUnit({
    required double value,
    required String metricCode,
    required BuildContext context,
  }) {
    // Get user preferred units from context
    final userPref =
        (context.read<UserPreferencesCubit>() as UserPreferencesLoaded)
            .preferences;

    // Find the preference for the given metric code
    final preference = userPref.firstWhereOrNull(
      (pref) => pref.metricCode == metricCode,
    );

    if (preference == null) {
      throw Exception('No preference found for metric code: $metricCode');
    }

    // Convert the value to base unit
    return value * preference.toBaseFactor;
  }
}
