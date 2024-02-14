import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'load_pictures_state.dart';
part 'load_pictures_cubit.freezed.dart';

class LoadPicturesCubit extends Cubit<LoadPicturesState> {
  LoadPicturesCubit(this.bodyPictureRepository)
      : super(const LoadPicturesState.loading());

  final BodyPictureRepository bodyPictureRepository;

  List<VaultImage> allImages = [];
  List<VaultImage> filteredImages = [];

  Future<void> load() async {
    final result = await bodyPictureRepository.getAllBodyPictures();

    result.fold(
      (l) => emit(LoadPicturesState.failed(l)),
      (r) {
        allImages = r;
        filteredImages = r;
        emit(LoadPicturesState.loaded(filteredImages));
      },
    );
  }

  void updateList(VaultImage newImageData) {
    final currentState = state;
    if (currentState is Loaded) {
      allImages.add(newImageData);
      filteredImages = [...allImages];
      emit(LoadPicturesState.loaded(filteredImages));
    }
  }

  void filterImages({required List<String> selectedTags}) {
    if (selectedTags.isEmpty) {
      emit(LoadPicturesState.loaded(allImages));
    }
    emit(LoadPicturesState.loaded(
      allImages.where((element) => selectedTags.contains(element.tag)).toList(),
    ));
  }

  // Future<void> delete(int id) async {
  //   await bodyPictureRepository.deleteBodyPicture(id);
  //   load();
  // }
}
