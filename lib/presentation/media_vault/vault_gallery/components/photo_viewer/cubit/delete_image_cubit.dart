import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'delete_image_state.dart';
part 'delete_image_cubit.freezed.dart';

class DeleteImageCubit extends Cubit<DeleteImageState> {
  DeleteImageCubit(this.bodyPictureRepository)
      : super(const DeleteImageState.initial());

  final BodyPictureRepository bodyPictureRepository;

  Future<void> delete(int id) async {
    final result = await bodyPictureRepository.deleteBodyPicture(id);

    result.fold(
      (l) {
        emit(DeleteImageState.failed(l));
      },
      (r) {
        emit(DeleteImageState.success(deletedItemId: id));
      },
    );
  }
}
