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

  Future<void> load() async {
    final result = await bodyPictureRepository.getAllBodyPictures();

    result.fold(
      (l) => emit(LoadPicturesState.failed(l)),
      (r) => emit(LoadPicturesState.loaded(r)),
    );
  }

  void updateList(VaultImage newImageData) {
    final currentState = state;
    if (currentState is Loaded) {
      emit(LoadPicturesState.loaded([...currentState.pictures, newImageData]));
    }
  }

  // Future<void> delete(int id) async {
  //   await bodyPictureRepository.deleteBodyPicture(id);
  //   load();
  // }
}
