part of 'getallmeasurments_cubit.dart';

@freezed
sealed class GetSingleMeasurmentsDetailsState
    with _$GetSingleMeasurmentsDetailsState {
  const factory GetSingleMeasurmentsDetailsState.initial() =
      GetSingleMeasurmentsDetailsStateInitial;
  const factory GetSingleMeasurmentsDetailsState.loading() =
      GetSingleMeasurmentsDetailsStateLoading;
  const factory GetSingleMeasurmentsDetailsState.failed({
    required String cause,
  }) = GetSingleMeasurmentsDetailsStateFailed;
  const factory GetSingleMeasurmentsDetailsState.success({
    required List<Measurement> list,
    // required DurationsEnum durationsEnum,
    // required DateTime startDate,
  }) = AllMeasurementsLoaded;
}
