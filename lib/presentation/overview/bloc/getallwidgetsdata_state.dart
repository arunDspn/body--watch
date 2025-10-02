part of 'getallwidgetsdata_bloc.dart';

@freezed
sealed class GetallwidgetsdataState with _$GetallwidgetsdataState {
  const factory GetallwidgetsdataState.initial() =
      GetallwidgetsdataStateInitial;
  const factory GetallwidgetsdataState.loading() =
      GetallwidgetsdataStateLoading;
  const factory GetallwidgetsdataState.failure(String cause) =
      GetallwidgetsdataStateFailure;
  const factory GetallwidgetsdataState.success({
    required Map<String, List<MeasurementModel>> widgets,
  }) = GetallwidgetsdataStateSuccess;
}
