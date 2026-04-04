import 'package:watcha_body/presentation/chart_2/models/chart_models.dart';

class ChartDateUtils {
  static DateTime calculateCurrentPeriod(ChartFilter filter, DateTime now) {
    switch (filter) {
      case ChartFilter.week:
        return startOfWeek(now);
      case ChartFilter.month:
        return DateTime(now.year, now.month, 1);
      case ChartFilter.threeMonth:
        final quarterMonth = ((now.month - 1) ~/ 3) * 3 + 1;
        return DateTime(now.year, quarterMonth, 1);
      case ChartFilter.year:
        return DateTime(now.year, 1, 1);
    }
  }

  static DateTime getNextPeriod(DateTime current, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return current.add(const Duration(days: 7));
      case ChartFilter.month:
        return DateTime(current.year, current.month + 1, 1);
      case ChartFilter.threeMonth:
        return DateTime(current.year, current.month + 3, 1);
      case ChartFilter.year:
        return DateTime(current.year + 1, 1, 1);
    }
  }

  static DateTime getPreviousPeriod(DateTime current, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return current.subtract(const Duration(days: 7));
      case ChartFilter.month:
        return DateTime(current.year, current.month - 1, 1);
      case ChartFilter.threeMonth:
        return DateTime(current.year, current.month - 3, 1);
      case ChartFilter.year:
        return DateTime(current.year - 1, 1, 1);
    }
  }

  static DateTime getPeriodEndDate(DateTime period, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return period.add(const Duration(days: 7));
      case ChartFilter.month:
        return DateTime(period.year, period.month + 1, 1);
      case ChartFilter.threeMonth:
        return DateTime(period.year, period.month + 3, 1);
      case ChartFilter.year:
        return DateTime(period.year + 1, 1, 1);
    }
  }

  static DateTime startOfWeek(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);
    return normalizedDate.subtract(
      Duration(days: normalizedDate.weekday % DateTime.daysPerWeek),
    );
  }

  static DateTime endOfWeekExclusive(DateTime date) {
    return startOfWeek(date).add(const Duration(days: 7));
  }

  static List<int> getMonthLabelDays(DateTime period) {
    final daysInMonth = DateTime(period.year, period.month + 1, 0).day;
    final firstDay = DateTime(period.year, period.month, 1);
    final firstSundayOffset = (DateTime.sunday - firstDay.weekday + 7) % 7;
    final firstSunday = 1 + firstSundayOffset;

    final labelDays = <int>[];
    for (int day = firstSunday; day <= daysInMonth; day += 7) {
      labelDays.add(day);
    }

    if (labelDays.isEmpty) {
      for (int day = 7; day <= daysInMonth; day += 7) {
        labelDays.add(day);
      }
    }

    return labelDays;
  }

  static bool isCurrentViewPeriod(
    ChartFilter filter,
    DateTime currentPeriod,
    DateTime now,
  ) {
    switch (filter) {
      case ChartFilter.week:
        final currentWeekStart = startOfWeek(now);
        return currentPeriod.year == currentWeekStart.year &&
            currentPeriod.month == currentWeekStart.month &&
            currentPeriod.day == currentWeekStart.day;
      case ChartFilter.month:
        return currentPeriod.year == now.year &&
            currentPeriod.month == now.month;
      case ChartFilter.threeMonth:
        final currentQuarterStart = DateTime(
          now.year,
          ((now.month - 1) ~/ 3) * 3 + 1,
          1,
        );
        return currentPeriod.year == currentQuarterStart.year &&
            currentPeriod.month == currentQuarterStart.month;
      case ChartFilter.year:
        return currentPeriod.year == now.year;
    }
  }

  static bool isInCurrentPeriod(
    ChartFilter filter,
    DateTime dateTime,
    DateTime currentPeriod,
    DateTime now,
  ) {
    if (!isCurrentViewPeriod(filter, currentPeriod, now)) {
      return false;
    }

    switch (filter) {
      case ChartFilter.week:
        return dateTime.year == now.year &&
            dateTime.month == now.month &&
            dateTime.day == now.day;
      case ChartFilter.month:
        final weekStart = startOfWeek(now);
        final weekEnd = endOfWeekExclusive(now);
        return dateTime.isAfter(
              weekStart.subtract(const Duration(seconds: 1)),
            ) &&
            dateTime.isBefore(weekEnd);
      case ChartFilter.threeMonth:
        return dateTime.year == now.year && dateTime.month == now.month;
      case ChartFilter.year:
        final currentQuarter = (now.month - 1) ~/ 3;
        final dateQuarter = (dateTime.month - 1) ~/ 3;
        return dateTime.year == now.year && dateQuarter == currentQuarter;
    }
  }

  static String shortMonthName(int month) {
    const months = [
      '',
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
    return months[month];
  }

  static String monthName(int month) {
    final normalizedMonth = ((month - 1) % 12 + 12) % 12 + 1;
    const months = [
      '',
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
    return months[normalizedMonth];
  }

  static String formatDate(DateTime date) {
    return '${shortMonthName(date.month)} ${date.day}';
  }

  static String getPeriodDisplayText(DateTime period, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        final weekStart = period;
        final weekEnd = period.add(const Duration(days: 6));
        final startLabel = '${weekStart.day} ${monthName(weekStart.month)}';
        final endLabel = '${weekEnd.day} ${monthName(weekEnd.month)}';

        if (weekStart.year == weekEnd.year) {
          if (weekStart.month == weekEnd.month) {
            return '${weekStart.day}-${weekEnd.day} ${monthName(weekStart.month)} ${weekStart.year}';
          }
          return '$startLabel - $endLabel ${weekStart.year}';
        }

        return '$startLabel ${weekStart.year} - $endLabel ${weekEnd.year}';
      case ChartFilter.month:
        return '${monthName(period.month)} ${period.year}';
      case ChartFilter.threeMonth:
        final quarterEnd = DateTime(period.year, period.month + 2, 1);

        if (period.year == quarterEnd.year) {
          return '${monthName(period.month)}-${monthName(quarterEnd.month)} ${period.year}';
        }

        return '${monthName(period.month)} ${period.year}-${monthName(quarterEnd.month)} ${quarterEnd.year}';
      case ChartFilter.year:
        return '${period.year}';
    }
  }

  static double getMaxXValue(DateTime period, ChartFilter filter) {
    switch (filter) {
      case ChartFilter.week:
        return 7.0;
      case ChartFilter.month:
      case ChartFilter.threeMonth:
      case ChartFilter.year:
        final endDate = getPeriodEndDate(period, filter);
        return endDate.difference(period).inDays.toDouble();
    }
  }
}
