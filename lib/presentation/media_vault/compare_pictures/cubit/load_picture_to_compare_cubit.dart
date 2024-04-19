import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/compare_images_model.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'load_picture_to_compare_state.dart';
part 'load_picture_to_compare_cubit.freezed.dart';

class LoadPictureToCompareCubit extends Cubit<LoadPictureToCompareState> {
  LoadPictureToCompareCubit(this.bodyPictureRepository)
      : super(const LoadPictureToCompareState.initial());

  final BodyPictureRepository bodyPictureRepository;

  Future<void> loadPicture({
    required String tag,
    required DateTime firstDate,
    required DateTime secondDate,
  }) async {
    emit(const LoadPictureToCompareState.loading());

    final result = await bodyPictureRepository.getBodyPicturesByTagAndTwoDate(
      tag: tag,
      firstdate: firstDate,
      seconddate: secondDate,
    );

    result.fold((l) {
      emit(LoadPictureToCompareState.error(l));
    }, (r) {
      emit(LoadPictureToCompareState.loaded(compareImagesModel: r));
    });
  }
}
