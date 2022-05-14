part of 'getallmeasurments_cubit.dart';

@freezed
class GetallmeasurmentsState with _$GetallmeasurmentsState {
  const factory GetallmeasurmentsState.initial() = _Initial;
  const factory GetallmeasurmentsState.loading() = _Loading;
  const factory GetallmeasurmentsState.failed({
    required String cause,
  }) = _Failed;
  const factory GetallmeasurmentsState.success({
    required List<Measurement> list,
  }) = _Success;
}
