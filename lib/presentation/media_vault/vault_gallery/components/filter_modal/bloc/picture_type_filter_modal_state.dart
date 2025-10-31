part of 'picture_type_filter_modal_bloc.dart';

@freezed
sealed class PictureTypeFilterModalState with _$PictureTypeFilterModalState {
  const factory PictureTypeFilterModalState.loading() =
      PictureTypeFilterModalStateLoading;
  // failed
  const factory PictureTypeFilterModalState.failed({
    required String message,
  }) = PictureTypeFilterModalStateFailed;
  // success
  const factory PictureTypeFilterModalState.success({
    required List<ImageTagModel> allTypes,
    required List<ImageTagModel> selectedTypes,
  }) = PictureTypeFilterModalStateSuccess;
}
