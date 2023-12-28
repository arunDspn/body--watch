import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';

part 'search_widgets_event.dart';
part 'search_widgets_state.dart';
part 'search_widgets_bloc.freezed.dart';

class SearchWidgetsBloc extends Bloc<SearchWidgetsEvent, SearchWidgetsState> {
  SearchWidgetsBloc() : super(const _Loading()) {
    on<SearchWidgetsEvent>((event, emit) {
      event.map(
        addData: (value) {
          emit(const SearchWidgetsState.loading());
          lists = [...value.list];
          emit(SearchWidgetsState.loaded(lists: lists));
        },
        keyChanged: (value) {
          emit(const SearchWidgetsState.loading());
          final newList = lists
              .where(
                (element) => element.name
                    .toString()
                    .toLowerCase()
                    .contains(value.key.toLowerCase()),
              )
              .toList();
          emit(SearchWidgetsState.loaded(lists: newList));
        },
      );
    });
  }
  List<LatestMeasurementDisplayModel> lists = [];
}
