part of 'chartdata_bloc.dart';

@freezed
sealed class ChartdataState with _$ChartdataState {
  const factory ChartdataState.initial() = ChartDataStateInitial;
  const factory ChartdataState.loading() = ChartDataStateLoading;
  const factory ChartdataState.success({
    required List<ChartDisplayModel> chartDisplayModelList,
    required DurationsEnum durationsEnum,
    required DateTime startDate,
  }) = ChartDataStateSuccess;
  const factory ChartdataState.failed({
    required String cause,
  }) = ChartDataStateFailed;
}
