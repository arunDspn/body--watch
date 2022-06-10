part of 'chartdata_bloc.dart';

@freezed
class ChartdataEvent with _$ChartdataEvent {
  const factory ChartdataEvent.fetchData({
    required DurationsEnum duration,
    required AppPreferences appPreferences,
  }) = _FetchData;
}
