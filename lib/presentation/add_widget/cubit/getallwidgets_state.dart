part of 'getallwidgets_cubit.dart';

@freezed
sealed class GetallwidgetsState with _$GetallwidgetsState {
  const factory GetallwidgetsState.initial() = GetAllWidgetInitial;
  const factory GetallwidgetsState.loading() = GetAllWidgetLoading;
  const factory GetallwidgetsState.failure(String cause) = GetAllWidgetFailure;
  const factory GetallwidgetsState.success({
    required List<MeasurementTargetModel> widgets,
  }) = GetAllWidgetSuccess;
}
