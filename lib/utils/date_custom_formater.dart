import 'package:intl/intl.dart';

class DateCustomFormater {
  DateCustomFormater._();

  static String format(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  /// 14-03-2022 10:53 PM
  static String formatDateTimeCompleteVerbose(DateTime date) {
    return DateFormat('dd-MM-yyyy hh:mm a').format(date);
  }
}
