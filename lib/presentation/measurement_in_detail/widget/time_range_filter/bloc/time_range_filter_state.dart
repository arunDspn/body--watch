part of 'time_range_filter_bloc.dart';

@freezed
sealed class TimeRangeFilterState with _$TimeRangeFilterState {
  const factory TimeRangeFilterState.state({
    required DateTime startDate,
    required DateTime endDate,
    required List<MeasurementEntity> filteredMeasurements,
    required TimeUnit timeUnit,
    required bool nextable,
    required MeasurementEntity? previousMeasurement,
    required MeasurementEntity? nextMeasurement,
  }) = TimeRangeFilterStateState;
  const factory TimeRangeFilterState.loading() = TimeRangeFilterStateLoading;
}
