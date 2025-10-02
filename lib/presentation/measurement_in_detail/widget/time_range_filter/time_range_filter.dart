import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_range_filter/bloc/time_range_filter_bloc.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class TimeRangeFilterInputStepper extends StatelessWidget {
  const TimeRangeFilterInputStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final appPref = context.read<ApppreferencesBloc>().state as SavedAndReady;
    return BlocBuilder<TimeRangeFilterBloc, TimeRangeFilterState>(
      builder: (context, state) {
        return switch (state) {
          // TODO: Handle this case.
          TimeRangeFilterStateState(
            :final startDate,
            :final endDate,
            :final nextable,
            :final timeUnit,
            :final filteredMeasurements,
          ) =>
            Builder(
              builder: (context) {
                String title() {
                  final monthFormat = DateFormat('MMMM');
                  final startMonthName = monthFormat.format(startDate);
                  final endMonthName = monthFormat.format(endDate);
                  // final timeUnit = timeUnit;

                  return switch (timeUnit) {
                    TimeUnit.week =>
                      '$startMonthName ${startDate.day} - $endMonthName ${endDate.day}',
                    TimeUnit.month => '$startMonthName - ${startDate.year}',
                    TimeUnit.threeMonth =>
                      '$startMonthName - $endMonthName ${startDate.year}',
                    TimeUnit.year => startDate.year.toString(),
                  };
                }

                // Measurement
                var max = '';
                var min = '';
                if (filteredMeasurements.isNotEmpty) {
                  max = filteredMeasurements
                      .reduce(
                        (value, element) =>
                            value.value > element.value ? value : element,
                      )
                      .value
                      .toStringAsFixed(0);

                  min = filteredMeasurements
                      .reduce(
                        (value, element) =>
                            value.value < element.value ? value : element,
                      )
                      .value
                      .toStringAsFixed(0);

                  // final unit = filteredMeasurements.first.unit;
                  final unit = '';

                  // min = min + unit;
                  min = '$min $unit';
                }

                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<TimeRangeFilterBloc>().add(
                              const TimeRangeFilterEvent.previousRange(),
                            );
                      },
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            title(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          if (min != '')
                            Text(
                              '$max - $min',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          else
                            const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    IconButton(
                      ///  today 29-11
                      ///
                      onPressed: nextable
                          ? () {
                              context.read<TimeRangeFilterBloc>().add(
                                    const TimeRangeFilterEvent.nextRange(),
                                  );
                            }
                          : null,
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                );
              },
            ),
          TimeRangeFilterStateLoading() => const CircularProgressIndicator(),
        };

        // return state.map(
        //   state: (value) {},
        //   loading: (_) {
        //     return
        //   },
        // );
      },
    );
  }
}
