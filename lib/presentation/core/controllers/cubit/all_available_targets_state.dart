part of 'all_available_targets_cubit.dart';

@freezed
sealed class AllAvailableTargetsState with _$AllAvailableTargetsState {
  const factory AllAvailableTargetsState.initial() = _Initial;
  const factory AllAvailableTargetsState.loading() = _Loading;
  const factory AllAvailableTargetsState.failure(String cause) = _Failure;
  const factory AllAvailableTargetsState.success({
    required List<MeasurementTargetModel> targets,
  }) = Success;
}
