import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcha_body/data/domain/models/pmeasurement.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';
import 'package:watcha_body/services/time_range_service/time_range_service.dart';

part 'time_range_filter_event.dart';
part 'time_range_filter_state.dart';
part 'time_range_filter_bloc.freezed.dart';

class TimeRangeFilterBloc
    extends Bloc<TimeRangeFilterEvent, TimeRangeFilterState> {
  TimeRangeFilterBloc(
    this.timeUnit,
    this.timeRangeService,
    this.allMeasurements,
  ) : super(const _Loading()) {
    on<TimeRangeFilterEvent>(
      (event, emit) {
        event.map(
          nextRange: (value) {
            final range = rangeCalculator(
              timeUnit,
              (state as _State).endDate.add(const Duration(days: 1)),
            );

            final (
              Measurement? nextMeasurement,
              Measurement? previousMeasurement
            ) = getPreviousAndNextMeasurements(
              startDate: range.startDate,
              endDate: range.endDate,
            );

            final filteredList = filterMeasurements(
              startDate: range.startDate,
              endDate: range.endDate,
            );

            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                filteredMeasurements: filteredList,
                timeUnit: timeUnit,
                nextable: isNextable(range.endDate),
                nextMeasurement: nextMeasurement,
                previousMeasurement: previousMeasurement,
              ),
            );
          },
          previousRange: (value) {
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
            final (
              Measurement? nextMeasurement,
              Measurement? previousMeasurement
            ) = getPreviousAndNextMeasurements(
              startDate: range.startDate,
              endDate: range.endDate,
            );

            final filteredList = filterMeasurements(
              startDate: range.startDate,
              endDate: range.endDate,
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                filteredMeasurements: filteredList,
                timeUnit: timeUnit,
                nextable: true,
                nextMeasurement: nextMeasurement,
                previousMeasurement: previousMeasurement,
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
            final (
              Measurement? nextMeasurement,
              Measurement? previousMeasurement
            ) = getPreviousAndNextMeasurements(
              startDate: range.startDate,
              endDate: range.endDate,
            );

            final filteredList = filterMeasurements(
              startDate: range.startDate,
              endDate: range.endDate,
            );
            emit(
              TimeRangeFilterState.state(
                startDate: range.startDate,
                endDate: range.endDate,
                filteredMeasurements: filteredList,
                timeUnit: timeUnit,
                nextable: false,
                nextMeasurement: nextMeasurement,
                previousMeasurement: previousMeasurement,
              ),
            );
          },
        );
      },
    );
  }
  final TimeUnit timeUnit;
  final TimeRangeService timeRangeService;
  final List<Measurement> allMeasurements;

  List<Measurement> filterMeasurements({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return allMeasurements
        .where(
          (element) =>
              (element.date.isAfter(startDate) &&
                  element.date.isBefore(endDate)) ||
              element.date.isAtSameMomentAs(startDate) ||
              element.date.isAtSameMomentAs(endDate),
        )
        .toList();
  }

  (Measurement?, Measurement?) getPreviousAndNextMeasurements({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    Measurement? previousMeasurement;
    Measurement? nextMeasurement;

    previousMeasurement = allMeasurements.lastWhereOrNull(
      (element) => element.date.isBefore(startDate),
    );
    nextMeasurement = allMeasurements.firstWhereOrNull(
      (element) => element.date.isAfter(endDate),
    );

    return (nextMeasurement, previousMeasurement);
  }

  bool isNextable(DateTime startDate) {
    final range =
        rangeCalculator(timeUnit, startDate.add(const Duration(days: 1)));
    if (range.startDate.isBefore(DateTime.now())) {
      return true;
    } else {
      return false;
    }
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
