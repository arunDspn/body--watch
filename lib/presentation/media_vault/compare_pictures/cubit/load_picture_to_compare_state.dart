part of 'load_picture_to_compare_cubit.dart';

@freezed
class LoadPictureToCompareState with _$LoadPictureToCompareState {
  const factory LoadPictureToCompareState.initial() = _Initial;
  const factory LoadPictureToCompareState.loading() = _Loading;
  const factory LoadPictureToCompareState.loaded({
    required CompareImagesModel compareImagesModel,
  }) = _Loaded;
  const factory LoadPictureToCompareState.error(String message) = _Error;
}
