part of 'picture_type_filter_modal_bloc.dart';

@freezed
abstract class PictureTypeFilterModalEvent with _$PictureTypeFilterModalEvent {
  const factory PictureTypeFilterModalEvent.started() = _Started;
  // toggle
  const factory PictureTypeFilterModalEvent.toggle({
    required String type,
    required bool value,
  }) = _Toggle;
  // search
  const factory PictureTypeFilterModalEvent.search({
    required String query,
  }) = _Search;
  //clear
  const factory PictureTypeFilterModalEvent.clear() = _Clear;
}
