part of 'filterchart_bloc.dart';

@freezed
sealed class FilterchartState with _$FilterchartState {
  const factory FilterchartState.initial() = FilterchartStateInitial;
  const factory FilterchartState.data({
    required List<ChartDisplayModel> chartDisplayModelList,
    required DurationsEnum durationsEnum,
    required DateTime startDate,
    required List<String> filteredTypes,
  }) = FilterchartStateData;
}
