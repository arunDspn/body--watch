part of 'time_range_filter_bloc.dart';

@freezed
class TimeRangeFilterState with _$TimeRangeFilterState {
  const factory TimeRangeFilterState.state({
    required DateTime startDate,
    required DateTime endDate,
    required List<Measurement> filteredMeasurements,
    required TimeUnit timeUnit,
    required bool nextable,
    required Measurement? previousMeasurement,
    required Measurement? nextMeasurement,
  }) = _State;
  const factory TimeRangeFilterState.loading() = _Loading;
}
