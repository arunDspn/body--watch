part of 'comparison_data_cubit.dart';

@freezed
sealed class ComparisonDataState with _$ComparisonDataState {
  const factory ComparisonDataState.initial() = ComparisonDataStateInitial;

  const factory ComparisonDataState.loading() = ComparisonDataStateLoading;

  const factory ComparisonDataState.success({
    required List<TwoDatesRecord> records,
  }) = ComparisonDataStateSuccess;

  const factory ComparisonDataState.failure({
    required String message,
  }) = ComparisonDataStateFailure;
}
