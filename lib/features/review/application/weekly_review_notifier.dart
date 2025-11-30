import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/weekly_review_data.dart';

part 'weekly_review_notifier.g.dart';

@riverpod
class WeeklyReviewNotifier extends _$WeeklyReviewNotifier {
  @override
  Future<WeeklyReviewData> build({DateTime? weekStart}) async {
    final targetWeekStart = weekStart ?? DateTime.now().weekStart;
    return _generateWeeklyReview(targetWeekStart);
  }

  Future<WeeklyReviewData> _generateWeeklyReview(DateTime weekStart) async {
    final db = ref.read(databaseProvider);
    final weekEnd = weekStart.add(const Duration(days: 6));

    final metrics = await db.metricsDao.getMetricsInRange(weekStart, weekEnd);
    final goals = await db.goalDao.getAllGoals();

    final dailyItems = <DailyReviewItem>[];
    int totalGoalsCompleted = 0;
    int totalGoalsDays = 0;

    for (var i = 0; i < 7; i++) {
      final date = weekStart.add(Duration(days: i));
      final dayMetrics = metrics.where((m) => m.date.isSameDay(date)).firstOrNull;

      final dayLogs = await db.goalDao.getLogsForDate(date);
      int goalsCompleted = 0;
      for (final goal in goals) {
        final log = dayLogs.where((l) => l.goalId == goal.id).firstOrNull;
        if (log != null && log.progress >= goal.target) {
          goalsCompleted++;
        }
      }

      if (goals.isNotEmpty) {
        totalGoalsCompleted += goalsCompleted;
        totalGoalsDays += goals.length;
      }

      dailyItems.add(DailyReviewItem(
        date: date,
        steps: dayMetrics?.steps ?? 0,
        activeMinutes: dayMetrics?.activeMinutes ?? 0,
        caloriesBurned: dayMetrics?.caloriesBurned ?? 0,
        sleepHours: dayMetrics?.sleepHours ?? 0,
        hrv: dayMetrics?.hrv,
        goalsCompleted: goalsCompleted,
        goalsTotal: goals.length,
      ));
    }

    final avgSleepHours = await db.metricsDao.getAverageSleepHoursInRange(weekStart, weekEnd);
    final avgHrv = await db.metricsDao.getAverageHrvInRange(weekStart, weekEnd);
    final totalSteps = await db.metricsDao.getTotalStepsInRange(weekStart, weekEnd);
    final totalCalories = await db.metricsDao.getTotalCaloriesBurnedInRange(weekStart, weekEnd);
    final exerciseMinutes = await db.metricsDao.getTotalActiveMinutesInRange(weekStart, weekEnd);

    int waterDays = 0;
    final waterGoal = goals.where((g) => g.name.contains('水') || g.name.contains('Water')).firstOrNull;
    if (waterGoal != null) {
      for (var i = 0; i < 7; i++) {
        final date = weekStart.add(Duration(days: i));
        final log = await db.goalDao.getLogForDate(waterGoal.id, date);
        if (log != null && log.progress >= waterGoal.target) {
          waterDays++;
        }
      }
    }

    final goalCompletionRate = totalGoalsDays > 0 ? (totalGoalsCompleted * 100 ~/ totalGoalsDays) : 0;

    final title = generateWeekTitle(
      avgSleepHours: avgSleepHours,
      totalSteps: totalSteps,
      exerciseMinutes: exerciseMinutes,
      goalCompletionRate: goalCompletionRate,
    );

    await db.weeklySummaryDao.upsertSummary(
      weekStart: weekStart,
      avgSleepHours: avgSleepHours,
      avgHrv: avgHrv,
      totalSteps: totalSteps,
      totalCaloriesBurned: totalCalories,
      exerciseMinutes: exerciseMinutes,
      waterDays: waterDays,
      goalCompletionRate: goalCompletionRate,
      title: title,
    );

    return WeeklyReviewData(
      weekStart: weekStart,
      weekEnd: weekEnd,
      avgSleepHours: avgSleepHours,
      avgHrv: avgHrv,
      totalSteps: totalSteps,
      totalCaloriesBurned: totalCalories,
      exerciseMinutes: exerciseMinutes,
      waterDays: waterDays,
      goalCompletionRate: goalCompletionRate,
      title: title,
      dailyItems: dailyItems,
    );
  }

  Future<void> navigateToPreviousWeek() async {
    final currentData = state.valueOrNull;
    if (currentData == null) return;

    final previousWeekStart = currentData.weekStart.subtract(const Duration(days: 7));
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _generateWeeklyReview(previousWeekStart));
  }

  Future<void> navigateToNextWeek() async {
    final currentData = state.valueOrNull;
    if (currentData == null) return;

    final nextWeekStart = currentData.weekStart.add(const Duration(days: 7));
    if (nextWeekStart.isAfter(DateTime.now())) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _generateWeeklyReview(nextWeekStart));
  }

  bool get canGoNext {
    final currentData = state.valueOrNull;
    if (currentData == null) return false;
    return currentData.weekEnd.isBefore(DateTime.now().weekStart);
  }
}
