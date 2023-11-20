import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';
import 'package:watcha_body/services/time_range_service/time_range_service.dart';

part 'time_range_filter_event.dart';
part 'time_range_filter_state.dart';
part 'time_range_filter_bloc.freezed.dart';

class TimeRangeFilterBloc
    extends Bloc<TimeRangeFilterEvent, TimeRangeFilterState> {
  TimeRangeFilterBloc(this.timeUnit, this.timeRangeService)
      : super(const _Loading()) {
    on<TimeRangeFilterEvent>(
      (event, emit) {
        event.map(
          nextRange: (value) {
            final range = rangeCalculator(
              timeUnit,
              (state as _State).endDate.add(const Duration(days: 1)),
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                measurements: [],
                timeUnit: timeUnit,
              ),
            );
          },
          previousRange: (value) {
            final range = rangeCalculator(
              timeUnit,
              (state as _State).startDate.subtract(const Duration(days: 1)),
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                measurements: [],
                timeUnit: timeUnit,
              ),
            );
          },
          currentRange: (value) {
            final range = rangeCalculator(
              timeUnit,
              DateTime.now(),
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                measurements: [],
                timeUnit: timeUnit,
              ),
            );
          },
        );
      },
    );

    // _State getk(){

    // }
  }
  final TimeUnit timeUnit;
  final TimeRangeService timeRangeService;

  TimeRange rangeCalculator(
    TimeUnit timeUnit,
    DateTime date,
  ) {
    return switch (timeUnit) {
      TimeUnit.week => timeRangeService.getWeekRange(date),
      TimeUnit.month => timeRangeService.getMonthRange(date),
      TimeUnit.threeMonth => timeRangeService.getThreeMonthsRange(date),
      TimeUnit.year => timeRangeService.getYearRange(date),
    };
  }
}
