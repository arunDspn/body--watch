import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class SegmentedMainFilterButtons extends StatelessWidget {
  const SegmentedMainFilterButtons({
    super.key,
  });

  // final Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeUnitFilterCubit, TimeUnitFilterState>(
      builder: (context, state) {
        return SegmentedButton<TimeUnit>(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.amber;
              } else {
                return Colors.lightGreen;
              }
            }),
          ),
          showSelectedIcon: false,
          segments: TimeUnit.values.map((e) {
            return ButtonSegment<TimeUnit>(
              value: e,
              label: Text(
                e.toString(),
              ),
              // enabled: state.timeUnit == e,
            );
          }).toList(),
          selected: <TimeUnit>{state.timeUnit},
          onSelectionChanged: (Set<TimeUnit> newSelection) {
            context.read<TimeUnitFilterCubit>().toggleUnit(newSelection.first);
          },
        );
      },
    );
  }
}
