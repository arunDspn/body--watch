import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';

part 'filtered_gallery_images_state.dart';
part 'filtered_gallery_images_cubit.freezed.dart';

class FilteredGalleryImagesCubit extends Cubit<FilteredGalleryImagesState> {
  FilteredGalleryImagesCubit()
      : super(const FilteredGalleryImagesState.data(galleryImages: []));

  // List<VaultImage> _galleryImages = [];

  // void reset() {
  //   emit(FilteredGalleryImagesState.data(galleryImages: _galleryImages));
  // }

  // void loadImages({
  //   required List<VaultImage> images,
  // }) {
  //   _galleryImages = images;
  //   emit(FilteredGalleryImagesState.data(galleryImages: images));
  // }

  // void updateList(VaultImage newImageData) {
  //   _galleryImages.add(newImageData);
  //   emit(FilteredGalleryImagesState.data(galleryImages: _galleryImages));
  // }

  void filterImages({
    required List<String> selectedTags,
    required List<VaultImage> galleryImages,
  }) {
    if (selectedTags.isEmpty) {
      emit(FilteredGalleryImagesState.data(galleryImages: galleryImages));
    } else {
      emit(
        FilteredGalleryImagesState.data(
          galleryImages: galleryImages
              .where((element) => selectedTags.contains(element.tag))
              .toList(),
        ),
      );
    }
  }
}
