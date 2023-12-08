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

            /// oct nov dec
            ///
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                measurements: [],
                timeUnit: timeUnit,
                nextable: isNextable(range.endDate),
              ),
            );
          },
          previousRange: (value) {
            // print(state as _State);
            late DateTime date;
            final currentState = state as _State;
            if (timeUnit == TimeUnit.threeMonth) {
              date = DateTime(
                currentState.startDate.year,
                currentState.startDate.month - 3,
              );
            } else {
              date = currentState.startDate.subtract(const Duration(days: 1));
            }
            final range = rangeCalculator(
              timeUnit,
              date,
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                measurements: [],
                timeUnit: timeUnit,
                nextable: true,
              ),
            );
          },
          currentRange: (value) {
            late DateTime date;

            final current = DateTime.now();
            if (timeUnit == TimeUnit.threeMonth) {
              date = DateTime(current.year, current.month - 2);
            } else {
              date = current;
            }
            final range = rangeCalculator(
              timeUnit,
              date,
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                measurements: [],
                timeUnit: timeUnit,
                nextable: false,
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

  bool isNextable(DateTime startDate) {
    final range =
        rangeCalculator(timeUnit, startDate.add(const Duration(days: 1)));
    if (range.startDate.isBefore(DateTime.now())) {
      return true;
    } else {
      return false;
    }

    // 29
    // 4 is before 29
  }

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
