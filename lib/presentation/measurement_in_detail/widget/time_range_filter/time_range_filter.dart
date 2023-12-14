import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:watcha_body/app/app_preferences_bloc/apppreferences_bloc.dart';
import 'package:watcha_body/data/domain/models/app_preferences.dart';
import 'package:watcha_body/data/domain/models/failures/app_preferences_failures.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_range_filter/bloc/time_range_filter_bloc.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class TimeRangeFilterInputStepper extends StatelessWidget {
  const TimeRangeFilterInputStepper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appPref = context.read<ApppreferencesBloc>().state as SavedAndReady;
    return BlocBuilder<TimeRangeFilterBloc, TimeRangeFilterState>(
      builder: (context, state) {
        return state.map(
          state: (value) {
            String title() {
              final monthFormat = DateFormat('MMMM');
              final startMonthName = monthFormat.format(value.startDate);
              final endMonthName = monthFormat.format(value.endDate);
              final timeUnit = value.timeUnit;

              return switch (timeUnit) {
                TimeUnit.week =>
                  '$startMonthName ${value.startDate.day} - $endMonthName ${value.endDate.day}',
                TimeUnit.month => '$startMonthName - ${value.startDate.year}',
                TimeUnit.threeMonth =>
                  '$startMonthName - $endMonthName ${value.startDate.year}',
                TimeUnit.year => value.startDate.year.toString(),
              };
            }

            // Measurement
            var max = '';
            var min = '';
            if (value.filteredMeasurements.isNotEmpty) {
              max = value.filteredMeasurements
                  .reduce(
                    (value, element) =>
                        value.value > element.value ? value : element,
                  )
                  .value
                  .toStringAsFixed(0);

              min = value.filteredMeasurements
                  .reduce(
                    (value, element) =>
                        value.value < element.value ? value : element,
                  )
                  .value
                  .toStringAsFixed(0);

              final unit = value.filteredMeasurements.first.unit;

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
                  onPressed: value.nextable
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
          loading: (_) {
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
