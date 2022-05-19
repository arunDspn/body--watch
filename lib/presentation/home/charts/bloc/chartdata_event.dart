part of 'chartdata_bloc.dart';

@freezed
class ChartdataEvent with _$ChartdataEvent {
  const factory ChartdataEvent.fetchData({
    required Duration duration,
  }) = _FetchData;
}
