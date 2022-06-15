part of 'filterchart_bloc.dart';

@freezed
class FilterchartEvent with _$FilterchartEvent {
  const factory FilterchartEvent.initialData({
    required List<ChartDisplayModel> chartDisplayModelList,
    required DurationsEnum durationsEnum,
    required DateTime startDate,
  }) = _IntialData;
  const factory FilterchartEvent.filtering({
    required List<ChartDisplayModel> chartDisplayModelList,
    required DurationsEnum durationsEnum,
    required DateTime startDate,
    required List<String> filterString,
  }) = _Filtering;
}
