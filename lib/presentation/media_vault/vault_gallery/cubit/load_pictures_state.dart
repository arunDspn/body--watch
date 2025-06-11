part of 'load_pictures_cubit.dart';

@freezed
sealed class LoadPicturesState with _$LoadPicturesState {
  // Loading
  const factory LoadPicturesState.loading() = LoadPicturesStateLoading;
  // Loaded
  const factory LoadPicturesState.loaded(List<VaultImage> pictures) =
      LoadPicturesStateLoaded;
  // Failed
  const factory LoadPicturesState.failed(String message) =
      LoadPicturesStateFailed;
}
