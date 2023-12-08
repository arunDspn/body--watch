part of 'time_range_filter_bloc.dart';

@freezed
class TimeRangeFilterState with _$TimeRangeFilterState {
  const factory TimeRangeFilterState.state({
    required DateTime startDate,
    required DateTime endDate,
    required List<Measurement> measurements,
    required TimeUnit timeUnit,
    required bool nextable,
  }) = _State;
  const factory TimeRangeFilterState.loading() = _Loading;
}
