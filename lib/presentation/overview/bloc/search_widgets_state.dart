part of 'search_widgets_bloc.dart';

@freezed
class SearchWidgetsState with _$SearchWidgetsState {
  const factory SearchWidgetsState.loading() = _Loading;
  const factory SearchWidgetsState.loaded({
    required List<LatestMeasurementDisplayModel> lists,
  }) = _Loaded;
  const factory SearchWidgetsState.failed() = _Failed;
}
