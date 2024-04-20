part of 'comparison_data_cubit.dart';

@freezed
class ComparisonDataState with _$ComparisonDataState {
  const factory ComparisonDataState.initial() = _Initial;

  const factory ComparisonDataState.loading() = _Loading;

  const factory ComparisonDataState.success({
    required List<TwoDatesRecord> records,
  }) = _Success;

  const factory ComparisonDataState.failure({
    required String message,
  }) = _Failure;
}
