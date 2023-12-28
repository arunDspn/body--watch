part of 'search_widgets_bloc.dart';

@freezed
class SearchWidgetsEvent with _$SearchWidgetsEvent {
  const factory SearchWidgetsEvent.addData({
    required List<LatestMeasurementDisplayModel> list,
  }) = _AddData;
  const factory SearchWidgetsEvent.keyChanged(String key) = _KeyChanged;
}
