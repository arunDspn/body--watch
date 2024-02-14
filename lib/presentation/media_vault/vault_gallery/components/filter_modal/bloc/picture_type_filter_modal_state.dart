part of 'picture_type_filter_modal_bloc.dart';

@freezed
class PictureTypeFilterModalState with _$PictureTypeFilterModalState {
  const factory PictureTypeFilterModalState.loading() = _Loading;
  // failed
  const factory PictureTypeFilterModalState.failed({
    required String message,
  }) = _Failed;
  // success
  const factory PictureTypeFilterModalState.success({
    required List<String> allTypes,
    required List<String> selectedTypes,
  }) = Success;
}
