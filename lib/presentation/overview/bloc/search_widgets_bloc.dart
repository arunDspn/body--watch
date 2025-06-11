import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/presentation/display_models/measurement_display.dart';

part 'search_widgets_event.dart';
part 'search_widgets_state.dart';
part 'search_widgets_bloc.freezed.dart';

class SearchWidgetsBloc extends Bloc<SearchWidgetsEvent, SearchWidgetsState> {
  SearchWidgetsBloc() : super(const SearchWidgetsState.loading()) {
    on<SearchWidgetsEvent>((event, emit) {
      switch (event) {
        case _AddData(:final list):
          emit(const SearchWidgetsState.loading());
          lists = [...list];
          emit(SearchWidgetsState.loaded(lists: lists));

          break;
        case _KeyChanged(:final key):
          emit(const SearchWidgetsState.loading());
          final newList = lists
              .where(
                (element) => element.name
                    .toString()
                    .toLowerCase()
                    .contains(key.toLowerCase()),
              )
              .toList();
          emit(SearchWidgetsState.loaded(lists: newList));

          break;
      }
    });
  }
  List<LatestMeasurementDisplayModel> lists = [];
}
