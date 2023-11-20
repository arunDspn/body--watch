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
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Text(
                      //   "${value.}",
                      //   style: TextStyle(
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<TimeRangeFilterBloc>().add(
                          const TimeRangeFilterEvent.nextRange(),
                        );
                  },
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
