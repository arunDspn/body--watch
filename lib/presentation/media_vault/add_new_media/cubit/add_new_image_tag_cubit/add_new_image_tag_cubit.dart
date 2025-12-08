import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'add_new_image_tag_state.dart';
part 'add_new_image_tag_cubit.freezed.dart';

class AddNewImageTagCubit extends Cubit<AddNewImageTagState> {
  AddNewImageTagCubit({
    required BodyPictureRepository bodyPictureRepository,
  })  : _bodyPictureRepository = bodyPictureRepository,
        super(const AddNewImageTagState.initial());
  final BodyPictureRepository _bodyPictureRepository;

  /// Adds a new image tag.
  Future<void> addImageTag(String tag) async {
    emit(const AddNewImageTagState.loading());
    final result = await _bodyPictureRepository.addTag(tag);
    result.fold(
      (failure) => emit(AddNewImageTagState.error(message: failure)),
      (newTag) => emit(AddNewImageTagState.success(tag: newTag)),
    );
  }
}
