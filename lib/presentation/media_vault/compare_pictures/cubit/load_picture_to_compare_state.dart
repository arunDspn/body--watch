part of 'load_picture_to_compare_cubit.dart';

@freezed
sealed class LoadPictureToCompareState with _$LoadPictureToCompareState {
  const factory LoadPictureToCompareState.initial() =
      LoadPictureToCompareStateInitial;
  const factory LoadPictureToCompareState.loading() =
      LoadPictureToCompareStateLoading;
  const factory LoadPictureToCompareState.loaded({
    required CompareImagesModel compareImagesModel,
  }) = LoadPictureToCompareStateLoaded;
  const factory LoadPictureToCompareState.error(String message) =
      LoadPictureToCompareStateError;
}
