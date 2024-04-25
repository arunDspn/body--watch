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

  _filterByDate() {
    allImages.sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> load() async {
    final result = await bodyPictureRepository.getAllBodyPictures();

    result.fold(
      (l) => emit(LoadPicturesState.failed(l)),
      (r) {
        allImages = r;
        _filterByDate();
        emit(LoadPicturesState.loaded(allImages));
      },
    );
  }

  void reset() {
    allImages = [];
    emit(const LoadPicturesState.loading());
  }

  Future<void> updateList(VaultImage newImageData) async {
    final currentState = state;
    emit(const LoadPicturesState.loading());
    if (currentState is Loaded) {
      allImages.add(newImageData);
      _filterByDate();
      emit(LoadPicturesState.loaded(allImages));
    }
  }

  void filterImages({required List<String> selectedTags}) {
    if (selectedTags.isEmpty) {
      emit(LoadPicturesState.loaded(allImages));
    }
    emit(
      LoadPicturesState.loaded(
        allImages
            .where((element) => selectedTags.contains(element.tag))
            .toList(),
      ),
    );
  }

  Future<void> delete(String path) async {
    // delay 3 seconds to show loading

    // await Future.delayed(const Duration(seconds: 3));
    emit(const LoadPicturesState.loading());
    final result = await bodyPictureRepository.deleteBodyPicture(path);
    result.fold(
      (l) => emit(LoadPicturesState.failed(l)),
      (r) {
        allImages.removeWhere((element) => element.path == path);
        emit(LoadPicturesState.loaded(allImages));
      },
    );
  }
}
