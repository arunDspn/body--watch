import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/body_picture/models/save_vault_image_request.dart';
import 'package:watcha_body/data/domain/body_picture/models/vault_image_model.dart';
import 'package:watcha_body/data/domain/models/save_vault_image_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'add_new_media_state.dart';
part 'add_new_media_cubit.freezed.dart';

class AddNewMediaCubit extends Cubit<AddNewMediaState> {
  AddNewMediaCubit(this.bodyPictureRepository)
      : super(const AddNewMediaState.initial());

  final BodyPictureRepository bodyPictureRepository;

  Future<void> saveMedia({
    /// Tag ID associated with the image
    required int tagId,

    /// Tag associated with the image
    required String tag,

    /// Targets (muscle groups) associated with the image
    required List<int> targets,

    /// Path where the image is stored in the device
    required String path,

    /// Date when the image was taken
    required DateTime date,

    /// Note associated with the image
    required String note,
  }) async {
    emit(const AddNewMediaState.loading());

    final image = SaveVaultImageRequest(
      tagId: tagId,
      tag: tag,
      targets: targets,
      path: path,
      date: date,
      note: note,
    );

    final result = await bodyPictureRepository.saveBodyPicture(image);

    result.fold(
      (l) => emit(AddNewMediaState.failure(l)),
      (r) => emit(AddNewMediaState.success(savedImage: r)),
    );
  }
}
