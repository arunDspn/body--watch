part of 'add_initial_measurement_data_cubit.dart';

@freezed
class AddInitialMeasurementDataState with _$AddInitialMeasurementDataState {
  const factory AddInitialMeasurementDataState.initial() = _Initial;

  const factory AddInitialMeasurementDataState.loading() = _Loading;

  const factory AddInitialMeasurementDataState.success() = _Success;

  const factory AddInitialMeasurementDataState.failure(String message) =
      _Failure;
}
