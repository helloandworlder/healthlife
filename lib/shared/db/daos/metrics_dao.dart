import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/daily_metrics.dart';

part 'metrics_dao.g.dart';

@DriftAccessor(tables: [DailyMetrics])
class MetricsDao extends DatabaseAccessor<AppDatabase> with _$MetricsDaoMixin {
  MetricsDao(super.db);

  Future<DailyMetric?> getMetricsForDate(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(dailyMetrics)..where((t) => t.date.equals(dateOnly))).getSingleOrNull();
  }

  Future<List<DailyMetric>> getMetricsInRange(DateTime from, DateTime to) async {
    final fromDate = DateTime(from.year, from.month, from.day);
    final toDate = DateTime(to.year, to.month, to.day).add(const Duration(days: 1));
    return (select(dailyMetrics)
          ..where((t) => t.date.isBiggerOrEqualValue(fromDate) & t.date.isSmallerThanValue(toDate))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  Future<int> upsertMetrics(DailyMetricsCompanion companion) async {
    if (!companion.date.present) {
      throw ArgumentError('date is required');
    }
    final date = companion.date.value;
    final dateOnly = DateTime(
      date.year,
      date.month,
      date.day,
    );
    final existing = await getMetricsForDate(dateOnly);

    if (existing != null) {
      await (update(dailyMetrics)..where((t) => t.id.equals(existing.id))).write(
        DailyMetricsCompanion(
          steps: companion.steps,
          activeMinutes: companion.activeMinutes,
          caloriesBurned: companion.caloriesBurned,
          sleepHours: companion.sleepHours,
          avgHeartRate: companion.avgHeartRate,
          hrv: companion.hrv,
          updatedAt: Value(DateTime.now()),
        ),
      );
      return existing.id;
    }

    return into(dailyMetrics).insert(DailyMetricsCompanion.insert(
      date: dateOnly,
      steps: companion.steps.present ? companion.steps : const Value(0),
      activeMinutes: companion.activeMinutes.present ? companion.activeMinutes : const Value(0),
      caloriesBurned: companion.caloriesBurned.present ? companion.caloriesBurned : const Value(0),
      sleepHours: companion.sleepHours.present ? companion.sleepHours : const Value(0),
      avgHeartRate: companion.avgHeartRate,
      hrv: companion.hrv,
    ));
  }

  Future<int> upsertMetricsData({
    required DateTime date,
    int? steps,
    int? activeMinutes,
    int? caloriesBurned,
    double? sleepHours,
    int? avgHeartRate,
    int? hrv,
  }) async {
    return upsertMetrics(DailyMetricsCompanion(
      date: Value(date),
      steps: steps != null ? Value(steps) : const Value.absent(),
      activeMinutes: activeMinutes != null ? Value(activeMinutes) : const Value.absent(),
      caloriesBurned: caloriesBurned != null ? Value(caloriesBurned) : const Value.absent(),
      sleepHours: sleepHours != null ? Value(sleepHours) : const Value.absent(),
      avgHeartRate: avgHeartRate != null ? Value(avgHeartRate) : const Value.absent(),
      hrv: hrv != null ? Value(hrv) : const Value.absent(),
    ));
  }

  Future<int> getTotalStepsInRange(DateTime from, DateTime to) async {
    final metrics = await getMetricsInRange(from, to);
    return metrics.fold<int>(0, (sum, m) => sum + m.steps);
  }

  Future<int> getTotalActiveMinutesInRange(DateTime from, DateTime to) async {
    final metrics = await getMetricsInRange(from, to);
    return metrics.fold<int>(0, (sum, m) => sum + m.activeMinutes);
  }

  Future<int> getTotalCaloriesBurnedInRange(DateTime from, DateTime to) async {
    final metrics = await getMetricsInRange(from, to);
    return metrics.fold<int>(0, (sum, m) => sum + m.caloriesBurned);
  }

  Future<double> getAverageSleepHoursInRange(DateTime from, DateTime to) async {
    final metrics = await getMetricsInRange(from, to);
    if (metrics.isEmpty) return 0;
    return metrics.fold<double>(0.0, (sum, m) => sum + m.sleepHours) / metrics.length;
  }

  Future<int?> getAverageHrvInRange(DateTime from, DateTime to) async {
    final metrics = await getMetricsInRange(from, to);
    final hrvValues = metrics.where((m) => m.hrv != null).map((m) => m.hrv!).toList();
    if (hrvValues.isEmpty) return null;
    return (hrvValues.fold<int>(0, (sum, hrv) => sum + hrv) / hrvValues.length).round();
  }
}
