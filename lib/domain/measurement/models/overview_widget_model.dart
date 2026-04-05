import 'package:watcha_body/domain/measurement/models/measurement_model.dart';

/// Aggregated data used by the Overview widget card per target.
class OverviewWidgetModel {
  const OverviewWidgetModel({
    required this.targetId,
    required this.targetName,
    required this.metricCode,
    required this.type,
    required this.latestMeasurements,
    required this.lowestValue,
    required this.highestValue,
    this.goalValue,
  });

  final int targetId;
  final String targetName;
  final String metricCode;
  final String type;
  final List<MeasurementModel> latestMeasurements;
  final double lowestValue;
  final double highestValue;
  final double? goalValue;
}
