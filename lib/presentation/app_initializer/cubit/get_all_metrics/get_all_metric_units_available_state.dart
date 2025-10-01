part of 'get_all_metric_units_available_cubit.dart';

@freezed
class GetAllMetricUnitsAvailableState with _$GetAllMetricUnitsAvailableState {
  const factory GetAllMetricUnitsAvailableState.initial() = _Initial;

  // Loading state
  const factory GetAllMetricUnitsAvailableState.loading() = _Loading;
  // Loaded state with data
  const factory GetAllMetricUnitsAvailableState.loaded({
    Map<String, List<MetricUnitsModel>>? metricUnits,
  }) = _Loaded;

  // Error state with message
  const factory GetAllMetricUnitsAvailableState.error(String message) = _Error;
}
