import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/repositories/bodypicture_repository.dart';

part 'picture_type_filter_modal_event.dart';
part 'picture_type_filter_modal_state.dart';
part 'picture_type_filter_modal_bloc.freezed.dart';

class PictureTypeFilterModalBloc
    extends Bloc<PictureTypeFilterModalEvent, PictureTypeFilterModalState> {
  PictureTypeFilterModalBloc(this.bodyPictureRepository)
      : super(const _Loading()) {
    on<PictureTypeFilterModalEvent>((event, emit) async {
      await event.map(
        started: (value) async {
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
        },
        search: (value) {},
        toggle: (value) {
          if (state is Success) {
            final currentState = state as Success;
            emit(PictureTypeFilterModalState.loading());
            final selectedList = [...currentState.selectedTypes];
            // if (value.value) {
            //   selectedList = [...currentState.selectedTypes, value.type];
            // } else {
            //   selectedList = [...currentState.selectedTypes];
            //   selectedList.remove(value.type);
            // }

            if (selectedList.contains(value.type)) {
              selectedList.remove(value.type);
            } else {
              selectedList.add(value.type);
            }
            emit(
              currentState.copyWith(
                selectedTypes: selectedList,
              ),
            );
          }
        },
        clear: (value) {
          if (state is Success) {
            final previousState = state as Success;
            emit(const PictureTypeFilterModalState.loading());
            emit(
              previousState.copyWith(
                selectedTypes: [],
              ),
            );
          }
        },
      );
    });
  }
  final BodyPictureRepository bodyPictureRepository;
}
