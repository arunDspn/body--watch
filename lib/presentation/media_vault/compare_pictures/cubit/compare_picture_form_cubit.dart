import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'compare_picture_form_state.dart';
part 'compare_picture_form_cubit.freezed.dart';

class ComparePictureFormCubit extends Cubit<ComparePictureFormState> {
  ComparePictureFormCubit()
      : super(
          const ComparePictureFormState.state(
            firstDate: null,
            secondDate: null,
            tag: null,
            ready: false,
            targets: [],
          ),
        );

  void alterFirstDate(DateTime? date) {
    final newState = state.copyWith(
      firstDate: date,
    );

    emit(
      newState.copyWith(
        ready: _isReady(newState),
      ),
    );
  }

  void alterSecondDate(DateTime? date) {
    final newState = state.copyWith(
      secondDate: date,
    );

    emit(
      newState.copyWith(
        ready: _isReady(newState),
      ),
    );
  }

  void alterTag(int tag) {
    final newState = state.copyWith(
      tag: tag,
    );

    emit(
      newState.copyWith(
        ready: _isReady(newState),
      ),
    );
  }

  void alerTargets(List<int> targets) {
    final newState = state.copyWith(
      targets: targets,
    );

    emit(
      newState.copyWith(
        ready: _isReady(newState),
      ),
    );
  }

  bool _isReady(ComparePictureFormState state) {
    return state.firstDate != null &&
        state.secondDate != null &&
        state.tag != null;
  }
}
