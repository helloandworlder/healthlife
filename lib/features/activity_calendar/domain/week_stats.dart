import 'package:freezed_annotation/freezed_annotation.dart';

import 'activity_level.dart';

part 'week_stats.freezed.dart';

@freezed
sealed class WeekStats with _$WeekStats {
  const factory WeekStats({
    required DateTime weekStart,
    required int activeDays,
    required int totalMinutes,
    required int totalCalories,
    required int streak,
    required List<DayActivity> dayActivities,
  }) = _WeekStats;

  const WeekStats._();

  int get totalSteps => dayActivities.fold(0, (sum, d) => sum + d.steps);
}

@freezed
sealed class DayActivity with _$DayActivity {
  const factory DayActivity({
    required DateTime date,
    required int steps,
    required int activeMinutes,
    required int caloriesBurned,
    required double sleepHours,
    required ActivityLevel level,
  }) = _DayActivity;

  const DayActivity._();

  bool get isActive => activeMinutes >= 30;
}

@freezed
sealed class MonthHeatmap with _$MonthHeatmap {
  const factory MonthHeatmap({
    required DateTime month,
    required Map<int, ActivityLevel> dayLevels,
  }) = _MonthHeatmap;
}
