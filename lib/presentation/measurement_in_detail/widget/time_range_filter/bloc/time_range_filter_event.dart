part of 'time_range_filter_bloc.dart';

@freezed
class TimeRangeFilterEvent with _$TimeRangeFilterEvent {
  const factory TimeRangeFilterEvent.nextRange() = _NextRange;
  const factory TimeRangeFilterEvent.previousRange() = _PreviousRange;
  const factory TimeRangeFilterEvent.currentRange() = _CurrentRange;
}
