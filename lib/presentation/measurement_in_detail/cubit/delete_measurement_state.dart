part of 'delete_measurement_cubit.dart';

@freezed
class DeleteMeasurementState with _$DeleteMeasurementState {
  const factory DeleteMeasurementState.initial() = _Initial;
  const factory DeleteMeasurementState.loading() = _Loading;
  const factory DeleteMeasurementState.deleted(String id) = _Deleted;
  const factory DeleteMeasurementState.error(String message) = _Error;
}
