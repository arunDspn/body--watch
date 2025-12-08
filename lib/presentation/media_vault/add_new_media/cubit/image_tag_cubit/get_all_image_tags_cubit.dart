import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/domain/body_picture/models/image_tag_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'get_all_image_tags_state.dart';
part 'get_all_image_tags_cubit.freezed.dart';

class GetAllImageTagsCubit extends Cubit<GetAllImageTagsState> {
  GetAllImageTagsCubit({
    required BodyPictureRepository bodyPictureRepository,
  })  : _bodyPictureRepository = bodyPictureRepository,
        super(const GetAllImageTagsState.initial());
  final BodyPictureRepository _bodyPictureRepository;

  Future<void> getAllImageTags() async {
    emit(const GetAllImageTagsState.loading());
    final result = await _bodyPictureRepository.getAllTags();
    result.fold(
      (failure) => emit(GetAllImageTagsState.error(message: failure)),
      (tags) => emit(GetAllImageTagsState.loaded(tags: tags)),
    );
  }

  /// Updates the list of image tags.
  Future<void> refreshImageTags() async {
    final result = await _bodyPictureRepository.getAllTags();
    result.fold(
      (failure) => emit(GetAllImageTagsState.error(message: failure)),
      (tags) => emit(GetAllImageTagsState.loaded(tags: tags)),
    );
  }

  /// Adds a new image tag and refreshes the tag list.
  // Future<void> addImageTag(String tag) async {
  //   emit(const GetAllImageTagsState.loading());
  //   final result = await _bodyPictureRepository.addTag(tag);
  //   result.fold(
  //     (failure) => emit(GetAllImageTagsState.error(message: failure)),
  //     (_) async {
  //       // Refresh the tag list after adding a new tag
  //       final refreshResult = await _bodyPictureRepository.getAllTags();
  //       refreshResult.fold(
  //         (failure) => emit(GetAllImageTagsState.error(message: failure)),
  //         (tags) => emit(GetAllImageTagsState.loaded(tags: tags)),
  //       );
  //     },
  //   );
  // }
}
