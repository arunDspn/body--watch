import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'add_new_media_state.dart';
part 'add_new_media_cubit.freezed.dart';

class AddNewMediaCubit extends Cubit<AddNewMediaState> {
  AddNewMediaCubit(this.bodyPictureRepository)
      : super(const AddNewMediaState.initial());

  final BodyPictureRepository bodyPictureRepository;

  Future<void> saveMedia(VaultImage image) async {
    final result = await bodyPictureRepository.saveBodyPicture(image);

    result.fold(
      (l) => emit(AddNewMediaState.failure(l)),
      (r) => emit(AddNewMediaState.success(savedImage: r)),
    );
  }
}
