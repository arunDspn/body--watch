part of 'getallmeasurments_cubit.dart';

@freezed
class GetSingleMeasurmentsDetailsState with _$GetSingleMeasurmentsDetailsState {
  const factory GetSingleMeasurmentsDetailsState.initial() = _Initial;
  const factory GetSingleMeasurmentsDetailsState.loading() = _Loading;
  const factory GetSingleMeasurmentsDetailsState.failed({
    required String cause,
  }) = _Failed;
  const factory GetSingleMeasurmentsDetailsState.success({
    required List<Measurement> list,
    required DurationsEnum durationsEnum,
    required DateTime startDate,
  }) = _Success;
}
