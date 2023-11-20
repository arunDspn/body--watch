import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_unit_filter_state.dart';
part 'time_unit_filter_cubit.freezed.dart';

class TimeUnitFilterCubit extends Cubit<TimeUnitFilterState> {
  TimeUnitFilterCubit()
      : super(const TimeUnitFilterState.on(timeUnit: TimeUnit.week));

  void toggleUnit(TimeUnit timeUnit) {
    emit(TimeUnitFilterState.on(timeUnit: timeUnit));
  }
}
