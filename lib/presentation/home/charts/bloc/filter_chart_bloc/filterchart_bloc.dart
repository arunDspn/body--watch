import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/presentation/display_models/chart_display.dart';
import 'package:watcha_body/presentation/home/charts/bloc/chartdata_bloc.dart';

part 'filterchart_event.dart';
part 'filterchart_state.dart';
part 'filterchart_bloc.freezed.dart';

class FilterchartBloc extends Bloc<FilterchartEvent, FilterchartState> {
  FilterchartBloc() : super(const FilterchartState.initial()) {
    on<FilterchartEvent>((event, emit) {
      switch (event) {
        case _IntialData(
            :final chartDisplayModelList,
            :final durationsEnum,
            :final startDate
          ):
          emit(
            FilterchartState.data(
              chartDisplayModelList: chartDisplayModelList,
              durationsEnum: durationsEnum,
              startDate: startDate,
              filteredTypes: <String>[],
            ),
          );
        case _Filtering(
            :final chartDisplayModelList,
            :final durationsEnum,
            :final startDate,
            :final filterString
          ):
          emit(
            FilterchartState.data(
              chartDisplayModelList: chartDisplayModelList,
              durationsEnum: durationsEnum,
              startDate: startDate,
              filteredTypes: filterString,
            ),
          );
      }

      // event.map(
      //   initialData: (value) {
      //     emit(
      //       FilterchartState.data(
      //         chartDisplayModelList: value.chartDisplayModelList,
      //         durationsEnum: value.durationsEnum,
      //         startDate: value.startDate,
      //         filteredTypes: <String>[],
      //       ),
      //     );
      //   },
      //   filtering: (value) {
      //     emit(
      //       FilterchartState.data(
      //         chartDisplayModelList: value.chartDisplayModelList,
      //         durationsEnum: value.durationsEnum,
      //         startDate: value.startDate,
      //         filteredTypes: value.filterString,
      //       ),
      //     );
      //   },
      // );
    });
  }
}
