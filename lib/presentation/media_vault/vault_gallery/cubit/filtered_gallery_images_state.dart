part of 'filtered_gallery_images_cubit.dart';

@freezed
class FilteredGalleryImagesState with _$FilteredGalleryImagesState {
  const factory FilteredGalleryImagesState.data({
    required List<VaultImage> galleryImages,
  }) = FilteredGalleryImagesData;
}
