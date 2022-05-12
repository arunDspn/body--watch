part of 'getallwidgetsdata_bloc.dart';

@freezed
class GetallwidgetsdataState with _$GetallwidgetsdataState {
  const factory GetallwidgetsdataState.initial() = _Initial;
  const factory GetallwidgetsdataState.loading() = _Loading;
  const factory GetallwidgetsdataState.failure(String cause) = _Failure;
  const factory GetallwidgetsdataState.success(
      List<LatestMeasurementDisplayModel> widgets) = _Success;
}
