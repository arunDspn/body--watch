part of 'time_unit_filter_cubit.dart';

enum TimeUnit {
  week,
  month,
  threeMonth,
  year;

  @override
  String toString() {
    switch (this) {
      case TimeUnit.week:
        return 'Week';
      case TimeUnit.month:
        return 'Month';
      case TimeUnit.threeMonth:
        return '3 Months';
      case TimeUnit.year:
        return 'Year';
    }
  }
}

@freezed
class TimeUnitFilterState with _$TimeUnitFilterState {
  const factory TimeUnitFilterState.on({
    required TimeUnit timeUnit,
  }) = _On;
}
