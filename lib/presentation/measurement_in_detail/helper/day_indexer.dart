import 'package:intl/intl.dart';

class DayIndex {
  factory DayIndex() {
    return _instance;
  }
  DayIndex._private({DateTime? referenceDate})
      : referenceDate = referenceDate ?? ref,
        monthDayFormater = DateFormat('MMMM d');

  final DateTime referenceDate;

  final DateFormat monthDayFormater;

  static final DayIndex _instance = DayIndex._private();

  static final ref = DateTime(2000);

  int calculateDaysSinceReference(DateTime date) {
    return date.difference(referenceDate).inDays;
  }

  DateTime getDateFromDayIndex(int dayIndex) {
    return referenceDate.add(Duration(days: dayIndex));
  }

  String getDateStringFromDayIndex(int dayIndex) {
    return monthDayFormater.format(referenceDate.add(Duration(days: dayIndex)));
  }
}
