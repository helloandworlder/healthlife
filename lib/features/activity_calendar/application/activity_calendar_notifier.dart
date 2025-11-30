import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/activity_level.dart';
import '../domain/week_stats.dart';

part 'activity_calendar_notifier.g.dart';

@riverpod
class ActivityCalendarNotifier extends _$ActivityCalendarNotifier {
  @override
  Future<ActivityCalendarState> build() async {
    final now = DateTime.now();
    final weekStart = now.weekStart;

    final weekStats = await _loadWeekStats(weekStart);
    final monthHeatmap = await _loadMonthHeatmap(DateTime(now.year, now.month));

    return ActivityCalendarState(
      selectedWeekStart: weekStart,
      selectedMonth: DateTime(now.year, now.month),
      weekStats: weekStats,
      monthHeatmap: monthHeatmap,
    );
  }

  Future<WeekStats> _loadWeekStats(DateTime weekStart) async {
    final db = ref.read(databaseProvider);
    final weekEnd = weekStart.add(const Duration(days: 6));

    final metrics = await db.metricsDao.getMetricsInRange(weekStart, weekEnd);

    final dayActivities = <DayActivity>[];
    for (int i = 0; i < 7; i++) {
      final date = weekStart.add(Duration(days: i));
      final metric = metrics.where(
        (m) => m.date.year == date.year && m.date.month == date.month && m.date.day == date.day,
      ).firstOrNull;

      dayActivities.add(DayActivity(
        date: date,
        steps: metric?.steps ?? 0,
        activeMinutes: metric?.activeMinutes ?? 0,
        caloriesBurned: metric?.caloriesBurned ?? 0,
        sleepHours: metric?.sleepHours ?? 0,
        level: ActivityLevelExtension.fromMetrics(
          steps: metric?.steps ?? 0,
          activeMinutes: metric?.activeMinutes ?? 0,
        ),
      ));
    }

    final activeDays = dayActivities.where((d) => d.isActive).length;
    final totalMinutes = dayActivities.fold(0, (sum, d) => sum + d.activeMinutes);
    final totalCalories = dayActivities.fold(0, (sum, d) => sum + d.caloriesBurned);
    final streak = await _calculateStreak();

    return WeekStats(
      weekStart: weekStart,
      activeDays: activeDays,
      totalMinutes: totalMinutes,
      totalCalories: totalCalories,
      streak: streak,
      dayActivities: dayActivities,
    );
  }

  Future<MonthHeatmap> _loadMonthHeatmap(DateTime month) async {
    final db = ref.read(databaseProvider);
    final monthStart = month.monthStart;
    final monthEnd = DateTime(month.year, month.month + 1, 0);

    final metrics = await db.metricsDao.getMetricsInRange(monthStart, monthEnd);

    final dayLevels = <int, ActivityLevel>{};
    for (final metric in metrics) {
      dayLevels[metric.date.day] = ActivityLevelExtension.fromMetrics(
        steps: metric.steps,
        activeMinutes: metric.activeMinutes,
      );
    }

    return MonthHeatmap(month: month, dayLevels: dayLevels);
  }

  Future<int> _calculateStreak() async {
    final db = ref.read(databaseProvider);
    final now = DateTime.now();
    int streak = 0;

    for (int i = 0; i < 365; i++) {
      final date = DateTime(now.year, now.month, now.day - i);
      final metric = await db.metricsDao.getMetricsForDate(date);

      if (metric != null && metric.activeMinutes >= 30) {
        streak++;
      } else if (i > 0) {
        break;
      }
    }

    return streak;
  }

  Future<void> selectWeek(DateTime weekStart) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final weekStats = await _loadWeekStats(weekStart);
    state = AsyncData(current.copyWith(
      selectedWeekStart: weekStart,
      weekStats: weekStats,
    ));
  }

  Future<void> selectMonth(DateTime month) async {
    final current = state.valueOrNull;
    if (current == null) return;

    final monthHeatmap = await _loadMonthHeatmap(month);
    state = AsyncData(current.copyWith(
      selectedMonth: month,
      monthHeatmap: monthHeatmap,
    ));
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

class ActivityCalendarState {
  const ActivityCalendarState({
    required this.selectedWeekStart,
    required this.selectedMonth,
    required this.weekStats,
    required this.monthHeatmap,
  });

  final DateTime selectedWeekStart;
  final DateTime selectedMonth;
  final WeekStats weekStats;
  final MonthHeatmap monthHeatmap;

  ActivityCalendarState copyWith({
    DateTime? selectedWeekStart,
    DateTime? selectedMonth,
    WeekStats? weekStats,
    MonthHeatmap? monthHeatmap,
  }) {
    return ActivityCalendarState(
      selectedWeekStart: selectedWeekStart ?? this.selectedWeekStart,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      weekStats: weekStats ?? this.weekStats,
      monthHeatmap: monthHeatmap ?? this.monthHeatmap,
    );
  }
}

@riverpod
Future<DayActivity?> dayDetail(Ref ref, DateTime date) async {
  final db = ref.watch(databaseProvider);
  final metric = await db.metricsDao.getMetricsForDate(date);

  if (metric == null) return null;

  return DayActivity(
    date: date,
    steps: metric.steps,
    activeMinutes: metric.activeMinutes,
    caloriesBurned: metric.caloriesBurned,
    sleepHours: metric.sleepHours,
    level: ActivityLevelExtension.fromMetrics(
      steps: metric.steps,
      activeMinutes: metric.activeMinutes,
    ),
  );
}
