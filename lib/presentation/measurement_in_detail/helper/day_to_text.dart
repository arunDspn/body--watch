import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class DayToText {
  DayToText({required this.timeUnit});

  final Set<String> _data = {};

  final TimeUnit timeUnit;

  String getRelevantText(DateTime dateTime) {
    return switch (timeUnit) {
      TimeUnit.week => weekBottomTitleText(dateTime),
      TimeUnit.month => '',
      TimeUnit.threeMonth => '',
      TimeUnit.year => 'null',
    };
  }

  String weekBottomTitleText(DateTime dateTime) {
    final weekday = dateTime.weekday;

    final weekName = switch (weekday) {
      1 => 'Mon',
      2 => 'Tue',
      3 => 'Wed',
      4 => 'Thu',
      5 => 'Fri',
      6 => 'Sat',
      7 => 'Sun',
      _ => '',
    };

    if (_data.contains(weekName)) {
      return '';
    } else {
      _data.add(weekName);
      return weekName;
    }
    // Fixed
    // const weekDays = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }

  // String monthBottomTitleText(BuildContext context, DateTime date) {
  //   // Week Days
  //   final data = context.read<TimeRangeService>().getWeeksInMonth(date);
  //   return data.map((e) => ' ${e.endDate.day} ${e.endDate.month}').toList();
  // }

  // String threeMonthBottomTitleWidget(DateTime date) {
  //   final data =
  //       List.generate(3, (index) => DateTime(date.year, date.month + index));

  //   return data.map((e) => e.month.toString()).toList();
  // }

  // String yearBottomTitleWidget() {
  //   // Fixed
  //   const shortMonthNames = [
  //     'Jan',
  //     'Feb',
  //     'Mar',
  //     'Apr',
  //     'May',
  //     'Jun',
  //     'Jul',
  //     'Aug',
  //     'Sep',
  //     'Oct',
  //     'Nov',
  //     'Dec',
  //   ];

  //   return shortMonthNames;
  // }
}
