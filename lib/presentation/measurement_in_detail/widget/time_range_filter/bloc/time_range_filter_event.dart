part of 'time_range_filter_bloc.dart';

@freezed
sealed class TimeRangeFilterEvent with _$TimeRangeFilterEvent {
  const factory TimeRangeFilterEvent.nextRange(
      // List<Measurement> allMeasurements,
      ) = _NextRange;
  const factory TimeRangeFilterEvent.previousRange(
      // List<Measurement> allMeasurements,
      ) = _PreviousRange;
  const factory TimeRangeFilterEvent.currentRange(
      // List<Measurement> allMeasurements,
      ) = _CurrentRange;
  const factory TimeRangeFilterEvent.updateData({
    required List<Measurement> newMeasurementList,
  }) = _UpdateData;
}
