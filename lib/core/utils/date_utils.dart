import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isToday() {
    final now = DateTime.now();
    return isSameDay(now);
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDay(yesterday);
  }

  DateTime get weekStart {
    final daysToSubtract = weekday == 7 ? 0 : weekday;
    return dateOnly.subtract(Duration(days: daysToSubtract));
  }

  DateTime get weekEnd {
    return weekStart.add(const Duration(days: 6));
  }

  DateTime get monthStart {
    return DateTime(year, month, 1);
  }

  DateTime get monthEnd {
    return DateTime(year, month + 1, 0);
  }

  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  String get weekdayName {
    const weekdays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    return weekdays[weekday % 7];
  }

  String get shortWeekdayName {
    const weekdays = ['日', '一', '二', '三', '四', '五', '六'];
    return weekdays[weekday % 7];
  }
}

class AppDateUtils {
  AppDateUtils._();

  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm');
  static final DateFormat _timeFormat = DateFormat('HH:mm');
  static final DateFormat _monthDayFormat = DateFormat('M月d日');
  static final DateFormat _monthFormat = DateFormat('yyyy年M月');
  static final DateFormat _fullDateFormat = DateFormat('yyyy年M月d日');

  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    return _dateTimeFormat.format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return _timeFormat.format(dateTime);
  }

  static String formatMonthDay(DateTime date) {
    return _monthDayFormat.format(date);
  }

  static String formatMonth(DateTime date) {
    return _monthFormat.format(date);
  }

  static String formatFullDate(DateTime date) {
    return _fullDateFormat.format(date);
  }

  static String formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    if (date.isSameDay(now)) {
      return '今天';
    } else if (date.isSameDay(now.subtract(const Duration(days: 1)))) {
      return '昨天';
    } else if (date.isSameDay(now.add(const Duration(days: 1)))) {
      return '明天';
    } else {
      return formatMonthDay(date);
    }
  }

  static String formatWeekRange(DateTime weekStart) {
    final weekEnd = weekStart.add(const Duration(days: 6));
    return '${formatMonthDay(weekStart)} - ${formatMonthDay(weekEnd)}';
  }

  static DateTime parseDate(String dateStr) {
    return _dateFormat.parse(dateStr);
  }

  static List<DateTime> getDaysInRange(DateTime start, DateTime end) {
    final days = <DateTime>[];
    var current = start.dateOnly;
    final endDate = end.dateOnly;
    while (!current.isAfter(endDate)) {
      days.add(current);
      current = current.add(const Duration(days: 1));
    }
    return days;
  }

  static int daysBetween(DateTime start, DateTime end) {
    return end.dateOnly.difference(start.dateOnly).inDays;
  }

  static DateTime today() {
    return DateTime.now().dateOnly;
  }

  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  static int getAge(DateTime birthday) {
    final today = DateTime.now();
    var age = today.year - birthday.year;
    if (today.month < birthday.month ||
        (today.month == birthday.month && today.day < birthday.day)) {
      age--;
    }
    return age;
  }
}
