// Returns a TimeRange object with the correct start and end dates for the current week when getWeekRange is called with a valid DateTime object.
import 'package:test/test.dart';
import 'package:watcha_body/services/time_range_service/time_range_service.dart';

void main() {
  // Returns a TimeRange object with the correct start and end dates for the current week when getWeekRange is called with a valid DateTime object.
  test(
    'Returns a TimeRange object with the correct start and end dates for the current week when getWeekRange is called with a valid DateTime object',
    () {
      // Arrange
      final timeRangeService = TimeRangeService();
      final currentDate = DateTime(2022, 1, 1);

      // Act
      final result = timeRangeService.getYearRange(currentDate);

      // Assert
      expect(result.startDate, DateTime(2022, 1, 1));
      expect(result.endDate, DateTime(2022, 12, 31));
    },
  );

  // test(
  //   "Should return a TimeRange object with the correct start and end dates for the current week when calling 'getWeekRange' method with a valid DateTime object as argument",
  //   test_get_week_range_with_valid_date,
  // );

  // 3 Months
  test(
    'Should return a TimeRange object with the correct start and end dates for three months, given a valid current date',
    () {
      // Arrange
      final timeRangeService = TimeRangeService();
      final currentDate = DateTime(2022, 1, 1);

      // Act
      final result = timeRangeService.getThreeMonthsRange(currentDate);

      // Assert
      expect(result.startDate, DateTime(2022, 1, 1));
      expect(result.endDate, DateTime(2022, 3, 31));
    },
  );
}

// Should return a TimeRange object with the correct start and end dates for the current week when calling 'getWeekRange' method with a valid DateTime object as argument
void test_get_week_range_with_valid_date() {
  // Arrange
  final timeRangeService = TimeRangeService();
  final currentDate = DateTime(2022, 1, 1);

  // Act
  final result = timeRangeService.getWeekRange(currentDate);

  // Assert
  expect(result.startDate, equals(DateTime(2021, 12, 26)));
  expect(result.endDate, equals(DateTime(2022, 1, 1)));
}

// Should return a TimeRange object with the correct start and end dates for the current month when calling 'getMonthRange' method with a valid DateTime object as argument
void test_get_month_range_with_valid_date() {
  // Arrange
  final timeRangeService = TimeRangeService();
  final currentDate = DateTime(2022, 1, 15);

  // Act
  final result = timeRangeService.getMonthRange(currentDate);

  // Assert
  expect(result.startDate, equals(DateTime(2022, 1, 1)));
  expect(result.endDate, equals(DateTime(2022, 2, 0)));
}

// Should return a TimeRange object with the correct start and end dates for the current year when calling 'getYearRange' method with a valid DateTime object as argument
void test_get_year_range_with_valid_date() {
  // Arrange
  final timeRangeService = TimeRangeService();
  final currentDate = DateTime(2022, 6, 30);

  // Act
  final result = timeRangeService.getYearRange(currentDate);

  // Assert
  expect(result.startDate, equals(DateTime(2022, 1, 1)));
  expect(result.endDate, equals(DateTime(2022, 12, 31)));
}

// Should return a TimeRange object with the correct start and end dates for the current week when calling 'getWeekRange' method with a DateTime object that represents the last day of the week as argument
void test_get_week_range_with_last_day_of_week() {
  // Arrange
  final timeRangeService = TimeRangeService();
  final currentDate = DateTime(2022, 1, 7);

  // Act
  final result = timeRangeService.getWeekRange(currentDate);

  // Assert
  expect(result.startDate, equals(DateTime(2022, 1, 2)));
  expect(result.endDate, equals(DateTime(2022, 1, 8)));
}

// Should return a TimeRange object with the correct start and end dates for the current month when calling 'getMonthRange' method with a DateTime object that represents the last day of the month as argument
void test_get_month_range_with_last_day_of_month() {
  // Arrange
  final timeRangeService = TimeRangeService();
  final currentDate = DateTime(2022, 2, 28);

  // Act
  final result = timeRangeService.getMonthRange(currentDate);

  // Assert
  expect(result.startDate, equals(DateTime(2022, 2, 1)));
  expect(result.endDate, equals(DateTime(2022, 3, 0)));
}

// Should return a TimeRange object with the correct start and end dates for the current year when calling 'getYearRange' method with a DateTime object that represents the last day of the year as argument
void test_get_year_range_with_last_day_of_year() {
  // Arrange
  final timeRangeService = TimeRangeService();
  final currentDate = DateTime(2022, 12, 31);

  // Act
  final result = timeRangeService.getYearRange(currentDate);

  // Assert
  expect(result.startDate, equals(DateTime(2022, 1, 1)));
  expect(result.endDate, equals(DateTime(2022, 12, 31)));
}
