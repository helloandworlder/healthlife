import 'package:flutter_test/flutter_test.dart';
import 'package:healthlife/core/utils/date_utils.dart';

void main() {
  group('DateTimeExtension', () {
    group('dateOnly', () {
      test('移除时间部分只保留日期', () {
        final dateTime = DateTime(2024, 3, 15, 14, 30, 45);
        final dateOnly = dateTime.dateOnly;
        expect(dateOnly.year, equals(2024));
        expect(dateOnly.month, equals(3));
        expect(dateOnly.day, equals(15));
        expect(dateOnly.hour, equals(0));
        expect(dateOnly.minute, equals(0));
        expect(dateOnly.second, equals(0));
      });
    });

    group('isSameDay', () {
      test('同一天返回 true', () {
        final date1 = DateTime(2024, 3, 15, 10, 0);
        final date2 = DateTime(2024, 3, 15, 22, 30);
        expect(date1.isSameDay(date2), isTrue);
      });

      test('不同天返回 false', () {
        final date1 = DateTime(2024, 3, 15);
        final date2 = DateTime(2024, 3, 16);
        expect(date1.isSameDay(date2), isFalse);
      });

      test('不同月返回 false', () {
        final date1 = DateTime(2024, 3, 15);
        final date2 = DateTime(2024, 4, 15);
        expect(date1.isSameDay(date2), isFalse);
      });
    });

    group('weekStart', () {
      test('周一获取周日作为周起始', () {
        // 2024-03-18 是周一
        final monday = DateTime(2024, 3, 18);
        final weekStart = monday.weekStart;
        expect(weekStart.weekday, equals(DateTime.sunday));
        expect(weekStart.day, equals(17));
      });

      test('周日获取当天作为周起始', () {
        // 2024-03-17 是周日
        final sunday = DateTime(2024, 3, 17);
        final weekStart = sunday.weekStart;
        expect(weekStart.day, equals(17));
      });

      test('周六获取上周日作为周起始', () {
        // 2024-03-16 是周六
        final saturday = DateTime(2024, 3, 16);
        final weekStart = saturday.weekStart;
        expect(weekStart.day, equals(10));
      });
    });

    group('weekEnd', () {
      test('周起始加6天为周末', () {
        final sunday = DateTime(2024, 3, 17);
        final weekEnd = sunday.weekEnd;
        expect(weekEnd.day, equals(23)); // 周六
      });
    });

    group('monthStart/monthEnd', () {
      test('月初为1日', () {
        final date = DateTime(2024, 3, 15);
        expect(date.monthStart.day, equals(1));
      });

      test('3月月末为31日', () {
        final date = DateTime(2024, 3, 15);
        expect(date.monthEnd.day, equals(31));
      });

      test('2月闰年月末为29日', () {
        final date = DateTime(2024, 2, 15); // 2024是闰年
        expect(date.monthEnd.day, equals(29));
      });

      test('2月非闰年月末为28日', () {
        final date = DateTime(2023, 2, 15);
        expect(date.monthEnd.day, equals(28));
      });
    });

    group('daysInMonth', () {
      test('各月份天数正确', () {
        expect(DateTime(2024, 1, 1).daysInMonth, equals(31));
        expect(DateTime(2024, 2, 1).daysInMonth, equals(29)); // 闰年
        expect(DateTime(2023, 2, 1).daysInMonth, equals(28)); // 非闰年
        expect(DateTime(2024, 4, 1).daysInMonth, equals(30));
      });
    });

    group('weekdayName', () {
      test('返回正确的中文星期名', () {
        expect(DateTime(2024, 3, 17).weekdayName, equals('周日'));
        expect(DateTime(2024, 3, 18).weekdayName, equals('周一'));
        expect(DateTime(2024, 3, 23).weekdayName, equals('周六'));
      });
    });

    group('shortWeekdayName', () {
      test('返回短格式星期名', () {
        expect(DateTime(2024, 3, 17).shortWeekdayName, equals('日'));
        expect(DateTime(2024, 3, 18).shortWeekdayName, equals('一'));
      });
    });
  });

  group('AppDateUtils', () {
    group('formatDate', () {
      test('格式化为 yyyy-MM-dd', () {
        final date = DateTime(2024, 3, 15);
        expect(AppDateUtils.formatDate(date), equals('2024-03-15'));
      });
    });

    group('formatDateTime', () {
      test('格式化为 yyyy-MM-dd HH:mm', () {
        final dateTime = DateTime(2024, 3, 15, 14, 30);
        expect(AppDateUtils.formatDateTime(dateTime), equals('2024-03-15 14:30'));
      });
    });

    group('formatTime', () {
      test('格式化为 HH:mm', () {
        final dateTime = DateTime(2024, 3, 15, 14, 30);
        expect(AppDateUtils.formatTime(dateTime), equals('14:30'));
      });
    });

    group('formatMonthDay', () {
      test('格式化为中文月日', () {
        final date = DateTime(2024, 3, 15);
        expect(AppDateUtils.formatMonthDay(date), equals('3月15日'));
      });
    });

    group('formatMonth', () {
      test('格式化为年月', () {
        final date = DateTime(2024, 3, 15);
        expect(AppDateUtils.formatMonth(date), equals('2024年3月'));
      });
    });

    group('formatFullDate', () {
      test('格式化为完整年月日', () {
        final date = DateTime(2024, 3, 15);
        expect(AppDateUtils.formatFullDate(date), equals('2024年3月15日'));
      });
    });

    group('formatRelativeDate', () {
      test('今天返回"今天"', () {
        final today = DateTime.now().dateOnly;
        expect(AppDateUtils.formatRelativeDate(today), equals('今天'));
      });

      test('昨天返回"昨天"', () {
        final yesterday = DateTime.now().subtract(const Duration(days: 1)).dateOnly;
        expect(AppDateUtils.formatRelativeDate(yesterday), equals('昨天'));
      });

      test('明天返回"明天"', () {
        final tomorrow = DateTime.now().add(const Duration(days: 1)).dateOnly;
        expect(AppDateUtils.formatRelativeDate(tomorrow), equals('明天'));
      });
    });

    group('parseDate', () {
      test('解析 yyyy-MM-dd 格式', () {
        final date = AppDateUtils.parseDate('2024-03-15');
        expect(date.year, equals(2024));
        expect(date.month, equals(3));
        expect(date.day, equals(15));
      });
    });

    group('getDaysInRange', () {
      test('返回范围内所有日期', () {
        final start = DateTime(2024, 3, 1);
        final end = DateTime(2024, 3, 5);
        final days = AppDateUtils.getDaysInRange(start, end);
        expect(days.length, equals(5));
        expect(days.first.day, equals(1));
        expect(days.last.day, equals(5));
      });

      test('单天范围返回1个日期', () {
        final date = DateTime(2024, 3, 15);
        final days = AppDateUtils.getDaysInRange(date, date);
        expect(days.length, equals(1));
      });
    });

    group('daysBetween', () {
      test('计算天数差', () {
        final start = DateTime(2024, 3, 1);
        final end = DateTime(2024, 3, 15);
        expect(AppDateUtils.daysBetween(start, end), equals(14));
      });

      test('同一天返回0', () {
        final date = DateTime(2024, 3, 15);
        expect(AppDateUtils.daysBetween(date, date), equals(0));
      });

      test('忽略时间差异只计算日期', () {
        final start = DateTime(2024, 3, 1, 23, 59);
        final end = DateTime(2024, 3, 2, 0, 1);
        expect(AppDateUtils.daysBetween(start, end), equals(1));
      });
    });

    group('today', () {
      test('返回今天零点', () {
        final today = AppDateUtils.today();
        final now = DateTime.now();
        expect(today.year, equals(now.year));
        expect(today.month, equals(now.month));
        expect(today.day, equals(now.day));
        expect(today.hour, equals(0));
      });
    });

    group('startOfDay/endOfDay', () {
      test('startOfDay 返回零点', () {
        final date = DateTime(2024, 3, 15, 14, 30, 45);
        final start = AppDateUtils.startOfDay(date);
        expect(start.hour, equals(0));
        expect(start.minute, equals(0));
        expect(start.second, equals(0));
      });

      test('endOfDay 返回 23:59:59.999', () {
        final date = DateTime(2024, 3, 15, 14, 30, 45);
        final end = AppDateUtils.endOfDay(date);
        expect(end.hour, equals(23));
        expect(end.minute, equals(59));
        expect(end.second, equals(59));
        expect(end.millisecond, equals(999));
      });
    });

    group('getAge', () {
      test('计算年龄 - 生日已过', () {
        final now = DateTime.now();
        final birthday = DateTime(now.year - 30, 1, 1);
        expect(AppDateUtils.getAge(birthday), equals(30));
      });

      test('计算年龄 - 生日未到', () {
        final now = DateTime.now();
        final birthday = DateTime(now.year - 30, 12, 31);
        final expectedAge = now.month < 12 || (now.month == 12 && now.day < 31) ? 29 : 30;
        expect(AppDateUtils.getAge(birthday), equals(expectedAge));
      });
    });
  });
}
