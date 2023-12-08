import 'package:watcha_body/presentation/measurement_in_detail/widget/time_unit_segemented_filter/cubit/time_unit_filter_cubit.dart';

class DayToText {
  DayToText({
    required this.startDate,
    required this.endDate,
    required this.timeUnit,
  });

  final Set<String> _data = {};

  final TimeUnit timeUnit;

  final DateTime startDate;
  final DateTime endDate;

  static const monthNamesFull = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String getRelevantText(DateTime dateTime) {
    return switch (timeUnit) {
      TimeUnit.week => weekBottomTitleText(dateTime),
      TimeUnit.month => '',
      TimeUnit.threeMonth => '',
      TimeUnit.year => 'null',
    };
  }

  String getRelevantTextByNumber(double x) {
    return switch (timeUnit) {
      TimeUnit.week => weekBottomTitleTextByX(x.toInt()),
      TimeUnit.month => monthBottomText(x),
      TimeUnit.threeMonth => getXMonthName(x),
      TimeUnit.year => getMonthName(x.toInt()),
    };
  }

  double convertMonthToXValue(int month) {
    if (month == startDate.month) {
      return 1;
    } else if (month == endDate.month) {
      return 3;
    } else {
      return 2;
    }
  }

  String monthBottomText(double x) {
    if (x < 1) {
      return '';
    }
    return 'Week ${x.toInt()}';
  }

  String getXMonthName(double x) {
    if (x <= 0.9 || x > 3.0 || startDate.isAfter(endDate)) {
      return '';
    }

    // Calculate the total number of months between start and end date
    final totalMonths =
        (endDate.year - startDate.year) * 12 + endDate.month - startDate.month;

    // Calculate the target month based on x
    var targetMonth = startDate.month + ((x * totalMonths) ~/ 3);

    // Adjust the target month to stay within the valid range (1 - 12)
    targetMonth = (targetMonth - 1) % 12 + 1;

    // Get the month name
    final monthNames = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    return monthNames[targetMonth - 1];
  }

  String weekBottomTitleTextByX(int x) {
    final weekName = switch (x) {
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
  }

  String getMonthName(int month) {
    if (month < 1 || month > 12) {
      return '';
    }

    final monthNames = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return monthNames[month - 1];
  }

  String dayToMonth(int dayNumber) {
    final year = endDate.year;
    if (dayNumber < 1 || dayNumber > (isLeapYear(year) ? 366 : 365)) {
      return '';
    }

    // Define the cumulative days in each month, considering a leap year
    final daysInMonth = <int>[
      0,
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ];
    if (isLeapYear(year)) {
      daysInMonth[2] = 29; // February has 29 days in a leap year
    }

    // Find the month for the given day number
    var month = 1;
    while (dayNumber > daysInMonth[month]) {
      dayNumber -= daysInMonth[month];
      month++;
    }

    return month.toString();
  }

  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  String dayToMonthInDateRange(int dayNumber) {
    if (dayNumber < 1 || dayNumber > 90 || startDate.isAfter(endDate)) {
      return 'Invalid input';
    }

    // Calculate the total number of days between start and end date
    int totalDays = endDate.difference(startDate).inDays;

    // Check if the day number is within the valid range
    if (dayNumber > totalDays) {
      return 'Invalid day number for the given date range';
    }

    // Find the month for the given day number
    DateTime currentDate = startDate;
    while (currentDate.add(Duration(days: dayNumber)).isBefore(endDate)) {
      currentDate = currentDate.add(Duration(days: dayNumber));
    }

    return 'Month ${currentDate.month}';
  }

  String dayToWeekRange(int day, int month, int year) {
    DateTime date = DateTime(year, month, day);

    // Find the first day of the month
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);

    // Calculate the weekday index of the first day of the month (0 - Sunday, 1 - Monday, ..., 6 - Saturday)
    int firstDayOfWeekIndex = firstDayOfMonth.weekday - 1;

    // Calculate the weekday index of the given day
    int dayOfWeekIndex = date.weekday - 1;

    // Calculate the week range
    int weekNumber = ((day - 1) + firstDayOfWeekIndex) ~/ 7 + 1;

    return 'Week $weekNumber of the month';
  }

// OLD
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

  // Fractional Representer

  // To Fractional
  /// 1. Week -> 1 to 7.9
  /// 2. Week range -> 1 to 3.9
  /// 3. Month -> 1 to 29/30/31 .9
  /// 4. Year -> 1 to 12.9

  // To Date
  /// Main purpose -> Dot Painter
  /// ex: 24kg at Septmeber 22
  ///
  ///

  /// Weeks
  double normalizeWeekday(DateTime date) {
    final weekdayIndex = date.weekday;
    // Convert Monday (index 1) to 1 and Sunday (index 7) to 7.9
    final normalizedValue = (weekdayIndex - 1) * (7.9 - 1) / 6 + 1;

    return normalizedValue;
  }

  String denormalizeWeekday(
    double normalizedValue,
  ) {
    if (normalizedValue < 1 || normalizedValue > 7.9e9) {
      throw Exception('Normalized weekday value must be between 1 and 7.9.');
    }

    if (startDate.isAfter(endDate)) {
      throw Exception('Start date must be before end date.');
    }

    // Calculate the total number of days in the week
    final totalDays = endDate.difference(startDate).inDays;

    // Calculate the number of days since the week's start date based on the normalized value
    final daysSinceStart = (normalizedValue - 1) * totalDays / 6;

    // Add the calculated days to the start date to get the real date
    final realDate = startDate.add(Duration(days: daysSinceStart.toInt()));

    return '${realDate.day} ${monthNamesFull[realDate.month - 1]}';
  }

  /// Months

  /// Year
  String derangeifyMonthsInYear(double fraction) {
    // Extract the month and fractional day
    final month = fraction.toInt();
    final fractionalDay = fraction - month;

    // Define the number of days in each month
    final daysInMonth = <int, int>{
      1: 31,
      2: 28,
      3: 31,
      4: 30,
      5: 31,
      6: 30,
      7: 31,
      8: 31,
      9: 30,
      10: 31,
      11: 30,
      12: 31
    };

    // Check for leap year and adjust February's days
    var daysInCurrentMonth = daysInMonth[month]!;
    if (month == 2 && daysInCurrentMonth == 28) {
      daysInCurrentMonth = 29; // Leap year
    }

    // Calculate the day and year
    int day = (fractionalDay * daysInCurrentMonth).toInt() + 1;

    // Create and return the DateTime object
    return '$day ${monthNamesFull[month - 1]}';
  }

  double rangeifyMonthsInYear(DateTime dateTime) {
    // Extract the month and day from the DateTime object
    int month = dateTime.month;
    int day = dateTime.day;

    // Define the number of days in each month
    Map<int, int> daysInMonth = {
      1: 31,
      2: 28,
      3: 31,
      4: 30,
      5: 31,
      6: 30,
      7: 31,
      8: 31,
      9: 30,
      10: 31,
      11: 30,
      12: 31
    };

    // Check for leap year and adjust February's days
    if (dateTime.year % 4 == 0 &&
        (dateTime.year % 100 != 0 || dateTime.year % 400 == 0)) {
      daysInMonth[2] = 29; // Leap year
    }

    // Validate the day
    if (day < 1 || day > daysInMonth[month]!) {
      throw ArgumentError("Invalid day for the given month.");
    }

    // Calculate the fraction representation
    double fraction = month + (day - 1) / daysInMonth[month]!.toDouble();

    return fraction;
  }

  /// Three Months
  double rangeifyThreeMonths(DateTime date) {
    if (date.isBefore(startDate) || date.isAfter(endDate)) {
      throw Exception('Date must be within the start and end date range.');
    }

    final totalDays = endDate.difference(startDate).inDays;
    final daysPassed = date.difference(startDate).inDays;
    final normalizedValue = 1 + (daysPassed / totalDays) * 2.9;

    return normalizedValue;
  }

  String derangeifyThreeMonthsToString(double normalizedValue) {
    if (normalizedValue < 1 || normalizedValue > 3.9) {
      throw Exception('Normalized value must be between 1 and 3.9.');
    }

    final totalDays = endDate.difference(startDate).inDays;
    final daysPassed = (normalizedValue - 1) * totalDays / 2.9;
    final denormalizedDate = startDate.add(Duration(days: daysPassed.toInt()));

    return '${denormalizedDate.day} ${monthNamesFull[denormalizedDate.month - 1]}';
  }

  // END

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
