import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/weekly_summaries.dart';

part 'weekly_summary_dao.g.dart';

@DriftAccessor(tables: [WeeklySummaries])
class WeeklySummaryDao extends DatabaseAccessor<AppDatabase> with _$WeeklySummaryDaoMixin {
  WeeklySummaryDao(super.db);

  Future<WeeklySummary?> getSummaryForWeek(DateTime weekStart) async {
    final dateOnly = DateTime(weekStart.year, weekStart.month, weekStart.day);
    return (select(weeklySummaries)..where((t) => t.weekStart.equals(dateOnly))).getSingleOrNull();
  }

  Future<List<WeeklySummary>> getRecentSummaries({int limit = 12}) async {
    return (select(weeklySummaries)
          ..orderBy([(t) => OrderingTerm.desc(t.weekStart)])
          ..limit(limit))
        .get();
  }

  Future<int> upsertSummary({
    required DateTime weekStart,
    required double avgSleepHours,
    int? avgHrv,
    required int totalSteps,
    required int totalCaloriesBurned,
    required int exerciseMinutes,
    required int waterDays,
    required int goalCompletionRate,
    required String title,
  }) async {
    final dateOnly = DateTime(weekStart.year, weekStart.month, weekStart.day);
    final existing = await getSummaryForWeek(dateOnly);

    if (existing != null) {
      await (update(weeklySummaries)..where((t) => t.id.equals(existing.id))).write(
        WeeklySummariesCompanion(
          avgSleepHours: Value(avgSleepHours),
          avgHrv: Value(avgHrv),
          totalSteps: Value(totalSteps),
          totalCaloriesBurned: Value(totalCaloriesBurned),
          exerciseMinutes: Value(exerciseMinutes),
          waterDays: Value(waterDays),
          goalCompletionRate: Value(goalCompletionRate),
          title: Value(title),
          generatedAt: Value(DateTime.now()),
        ),
      );
      return existing.id;
    }

    return into(weeklySummaries).insert(WeeklySummariesCompanion.insert(
      weekStart: dateOnly,
      avgSleepHours: avgSleepHours,
      avgHrv: Value(avgHrv),
      totalSteps: totalSteps,
      totalCaloriesBurned: totalCaloriesBurned,
      exerciseMinutes: exerciseMinutes,
      waterDays: waterDays,
      goalCompletionRate: goalCompletionRate,
      title: title,
    ));
  }

  Future<void> deleteSummary(int id) async {
    await (delete(weeklySummaries)..where((t) => t.id.equals(id))).go();
  }
}
