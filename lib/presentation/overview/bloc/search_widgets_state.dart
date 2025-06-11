part of 'search_widgets_bloc.dart';

@freezed
sealed class SearchWidgetsState with _$SearchWidgetsState {
  const factory SearchWidgetsState.loading() = SearchWidgetsStateLoading;
  const factory SearchWidgetsState.loaded({
    required List<LatestMeasurementDisplayModel> lists,
  }) = SearchWidgetsStateLoaded;
  const factory SearchWidgetsState.failed() = SearchWidgetsStateFailed;
}
