part of 'getallwidgets_cubit.dart';

@freezed
class GetallwidgetsState with _$GetallwidgetsState {
  const factory GetallwidgetsState.initial() = _Initial;
  const factory GetallwidgetsState.loading() = _Loading;
  const factory GetallwidgetsState.failure(String cause) = _Failure;
  const factory GetallwidgetsState.success(List<MeasurementWidget> widgets) =
      _Success;
}
