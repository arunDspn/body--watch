import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'picture_type_filter_modal_event.dart';
part 'picture_type_filter_modal_state.dart';
part 'picture_type_filter_modal_bloc.freezed.dart';

class PictureTypeFilterModalBloc
    extends Bloc<PictureTypeFilterModalEvent, PictureTypeFilterModalState> {
  PictureTypeFilterModalBloc(this.bodyPictureRepository)
      : super(const PictureTypeFilterModalState.loading()) {
    on<PictureTypeFilterModalEvent>((event, emit) async {
      switch (event) {
        case _Started():
          // Fetch all picture types
          final result = await bodyPictureRepository.getAllTags();
          result.fold(
            (l) => emit(PictureTypeFilterModalState.failed(message: l)),
            (r) {
              emit(
                PictureTypeFilterModalState.success(
                  allTypes: r,
                  selectedTypes: [],
                ),
              );
            },
          );

        case _Toggle(:final type):
          if (state is PictureTypeFilterModalStateSuccess) {
            final currentState = state as PictureTypeFilterModalStateSuccess;
            emit(const PictureTypeFilterModalState.loading());
            final selectedList = [...currentState.selectedTypes];
            // if (value.value) {
            //   selectedList = [...currentState.selectedTypes, value.type];
            // } else {
            //   selectedList = [...currentState.selectedTypes];
            //   selectedList.remove(value.type);
            // }

            if (selectedList.contains(type)) {
              selectedList.remove(type);
            } else {
              selectedList.add(type);
            }
            emit(
              currentState.copyWith(
                selectedTypes: selectedList,
              ),
            );
          }

        case _Search():
          // TODO: Handle this case.
          throw UnimplementedError();
        case _Clear():
          if (state is PictureTypeFilterModalStateSuccess) {
            final previousState = state as PictureTypeFilterModalStateSuccess;
            emit(const PictureTypeFilterModalState.loading());
            emit(
              previousState.copyWith(
                selectedTypes: [],
              ),
            );
          }
      }

      // await event.map(
      //   started: (value) async {},
      //   search: (value) {},
      //   toggle: (value) {},
      //   clear: (value) {},
      // );
    });
  }
  final BodyPictureRepository bodyPictureRepository;
}
