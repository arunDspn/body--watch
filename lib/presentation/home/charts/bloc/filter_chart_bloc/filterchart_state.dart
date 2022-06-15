part of 'filterchart_bloc.dart';

@freezed
class FilterchartState with _$FilterchartState {
  const factory FilterchartState.initial() = _Initial;
  const factory FilterchartState.data({
    required List<ChartDisplayModel> chartDisplayModelList,
    required DurationsEnum durationsEnum,
    required DateTime startDate,
    required List<String> filteredTypes,
  }) = _Data;
}
