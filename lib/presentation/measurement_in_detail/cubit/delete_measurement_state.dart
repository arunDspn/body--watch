part of 'delete_measurement_cubit.dart';

@freezed
sealed class DeleteMeasurementState with _$DeleteMeasurementState {
  const factory DeleteMeasurementState.initial() =
      DeleteMeasurementStateInitial;
  const factory DeleteMeasurementState.loading() =
      DeleteMeasurementStateLoading;
  const factory DeleteMeasurementState.deleted(String id) =
      DeleteMeasurementStateDeleted;
  const factory DeleteMeasurementState.error(String message) =
      DeleteMeasurementStateError;
}
