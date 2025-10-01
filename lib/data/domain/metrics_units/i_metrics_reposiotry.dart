import 'package:watcha_body/data/domain/metrics_units/models/metric_units_model.dart';

abstract class IMetricsRepository {
  /// Get all metric units available
  Future<Map<String, List<MetricUnitsModel>>> getAllMetricUnitsAvailable();
}
