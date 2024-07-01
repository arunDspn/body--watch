part of 'load_pictures_cubit.dart';

@freezed
class LoadPicturesState with _$LoadPicturesState {
  // Loading
  const factory LoadPicturesState.loading() = _Loading;
  // Loaded
  const factory LoadPicturesState.loaded(
      List<DisplayVaultImageModel> pictures) = Loaded;
  // Failed
  const factory LoadPicturesState.failed(String message) = _Failed;
}
