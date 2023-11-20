import 'package:watcha_body/services/time_range_service/models.dart';

/// The `TimeRangeService` class provides methods to calculate different time ranges based on a given date.
class TimeRangeService {
  /// Calculates the time range for a week based on the given current date.
  /// It subtracts the number of days from the current date's weekday to get the start date of the week,
  /// and adds the remaining days to get the end date of the week.
  ///
  /// @param currentDate The current date.
  /// @return The time range for a week.
  TimeRange getWeekRange(DateTime currentDate) {
    final weekStartDate =
        currentDate.subtract(Duration(days: currentDate.weekday - 1));
    final weekEndDate = weekStartDate.add(Duration(days: 6));

    return TimeRange(
      startDate: weekStartDate,
      endDate: weekEndDate,
    );
  }

  /// Calculates the time range for three months based on the given current date.
  /// It sets the start date as the current date and adds 90 days to get the end date.
  /// It then adjusts the end date to the last day of the month.
  ///
  /// @param currentDate The current date.
  /// @return The time range for three months.
  TimeRange getThreeMonthsRange(DateTime currentDate) {
    // Calculate the start date as the first day of the current month
    final threeMonthsStartDate =
        DateTime(currentDate.year, currentDate.month, 1);

    // Calculate the end date as three months from the current date
    final threeMonthsEndDate = DateTime(
      currentDate.year,
      currentDate.month + 2,
      currentDate.day,
    );

    // Adjust the end date to the last day of the month
    final adjustedEndDate = DateTime(
      threeMonthsEndDate.year,
      threeMonthsEndDate.month + 1,
      0,
    );

    return TimeRange(
      startDate: threeMonthsStartDate,
      endDate: adjustedEndDate,
    );
  }

  /// Calculates the time range for a year based on the given current date.
  /// It sets the start date as the first day of the current year and the end date as the last day of the current year.
  ///
  /// @param currentDate The current date.
  /// @return The time range for a year.
  TimeRange getYearRange(DateTime currentDate) {
    final yearStartDate = DateTime(currentDate.year);
    final yearEndDate = DateTime(currentDate.year, 12, 31);

    return TimeRange(
      startDate: yearStartDate,
      endDate: yearEndDate,
    );
  }

  /// Calculates the time range for a month based on the given current date.
  /// It sets the start date as the first day of the current month and the end date as the last day of the current month.
  ///
  /// @param currentDate The current date.
  /// @return The time range for a month.
  TimeRange getMonthRange(DateTime currentDate) {
    final monthStartDate = DateTime(currentDate.year, currentDate.month);
    final monthEndDate = DateTime(currentDate.year, currentDate.month + 1, 0);

    return TimeRange(
      startDate: monthStartDate,
      endDate: monthEndDate,
    );
  }
}
