import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateHelper {
  static String dateFormat({
    DateTime? date,
    String format = 'yMMMMEEEEd',
    String? local,
  }) =>
      DateFormat(format, local ?? Get.locale!.languageCode)
          .format(date ?? DateTime.now());

  static String readableShortStringDate(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  static bool isEqualDate({
    DateTime? a,
    DateTime? b,
  }) {
    return a != null && b != null
        ? dateFormat(date: a, format: 'yyyy-MM-dd') ==
            dateFormat(date: b, format: 'yyyy-MM-dd')
        : false;
  }

  static bool isEqualMonth({
    DateTime? a,
    DateTime? b,
  }) {
    return a != null && b != null
        ? dateFormat(date: a, format: 'yyyy-MM') ==
            dateFormat(date: b, format: 'yyyy-MM')
        : false;
  }

  static bool isEqualYear({
    DateTime? a,
    DateTime? b,
  }) {
    return a != null && b != null
        ? dateFormat(date: a, format: 'yyyy') ==
            dateFormat(date: b, format: 'yyyy')
        : false;
  }

  static DateTime fromString(String? date) =>
      DateTime.parse(date ?? DateTime.now().toIso8601String());

  /// Find the first date of the week which contains the provided date.
  static DateTime firstDateOfTheWeek(DateTime dateTime) =>
      dateTime.subtract(Duration(days: dateTime.weekday - 1));

  /// Find last date of the week which contains provided date.
  static DateTime lastDateOfTheWeek(DateTime dateTime) =>
      dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));

  // get Start of week
  static DateTime startOfWeek(DateTime date) {
    final startWeek = date.subtract(Duration(days: date.weekday - 1));
    return DateTime(startWeek.year, startWeek.month, startWeek.day, 0, 0, 0);
  }

  // get end of week
  static DateTime endOfWeek(DateTime date) {
    final endWeek =
        date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
    return DateTime(endWeek.year, endWeek.month, endWeek.day, 23, 59, 59);
  }
}
