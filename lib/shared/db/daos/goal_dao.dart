import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/goals.dart';
import '../tables/goal_logs.dart';

part 'goal_dao.g.dart';

@DriftAccessor(tables: [Goals, GoalLogs])
class GoalDao extends DatabaseAccessor<AppDatabase> with _$GoalDaoMixin {
  GoalDao(super.db);

  // Goals CRUD
  Future<List<Goal>> getAllGoals() async {
    return (select(goals)
          ..where((t) => t.enabled.equals(true))
          ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
        .get();
  }

  Future<Goal?> getGoalById(int id) async {
    return (select(goals)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> createGoal({
    required String name,
    required String icon,
    required String period,
    required int target,
    String? reminderTime,
  }) async {
    final maxOrder =
        await (selectOnly(goals)..addColumns([goals.sortOrder.max()])).map((row) => row.read(goals.sortOrder.max())).getSingleOrNull();

    return into(goals).insert(GoalsCompanion.insert(
      name: name,
      icon: Value(icon),
      period: period,
      target: target,
      reminderTime: Value(reminderTime),
      sortOrder: Value((maxOrder ?? 0) + 1),
    ));
  }

  Future<void> updateGoal({
    required int id,
    String? name,
    String? icon,
    String? period,
    int? target,
    String? reminderTime,
  }) async {
    await (update(goals)..where((t) => t.id.equals(id))).write(
      GoalsCompanion(
        name: name != null ? Value(name) : const Value.absent(),
        icon: icon != null ? Value(icon) : const Value.absent(),
        period: period != null ? Value(period) : const Value.absent(),
        target: target != null ? Value(target) : const Value.absent(),
        reminderTime: Value(reminderTime),
      ),
    );
  }

  Future<void> deleteGoal(int id) async {
    await (delete(goals)..where((t) => t.id.equals(id))).go();
  }

  Future<void> disableGoal(int id) async {
    await (update(goals)..where((t) => t.id.equals(id))).write(const GoalsCompanion(enabled: Value(false)));
  }

  Future<void> reorderGoals(List<int> goalIds) async {
    await transaction(() async {
      for (var i = 0; i < goalIds.length; i++) {
        await (update(goals)..where((t) => t.id.equals(goalIds[i]))).write(GoalsCompanion(sortOrder: Value(i)));
      }
    });
  }

  // Goal Logs
  Future<GoalLog?> getLogForDate(int goalId, DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(goalLogs)..where((t) => t.goalId.equals(goalId) & t.date.equals(dateOnly))).getSingleOrNull();
  }

  Future<List<GoalLog>> getLogsForDate(DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return (select(goalLogs)..where((t) => t.date.equals(dateOnly))).get();
  }

  Future<List<GoalLog>> getLogsInRange(int goalId, DateTime from, DateTime to) async {
    final fromDate = DateTime(from.year, from.month, from.day);
    final toDate = DateTime(to.year, to.month, to.day).add(const Duration(days: 1));
    return (select(goalLogs)
          ..where((t) => t.goalId.equals(goalId) & t.date.isBiggerOrEqualValue(fromDate) & t.date.isSmallerThanValue(toDate))
          ..orderBy([(t) => OrderingTerm.asc(t.date)]))
        .get();
  }

  Future<int> getOrCreateLog(int goalId, DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final existing = await getLogForDate(goalId, dateOnly);
    if (existing != null) return existing.id;

    return into(goalLogs).insert(GoalLogsCompanion.insert(
      goalId: goalId,
      date: dateOnly,
    ));
  }

  Future<int> incrementProgress(int goalId, DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final log = await getLogForDate(goalId, dateOnly);

    if (log != null) {
      await (update(goalLogs)..where((t) => t.id.equals(log.id))).write(
        GoalLogsCompanion(
          progress: Value(log.progress + 1),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return log.progress + 1;
    }

    await into(goalLogs).insert(GoalLogsCompanion.insert(
      goalId: goalId,
      date: dateOnly,
      progress: const Value(1),
    ));
    return 1;
  }

  Future<int> decrementProgress(int goalId, DateTime date) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final log = await getLogForDate(goalId, dateOnly);

    if (log != null && log.progress > 0) {
      await (update(goalLogs)..where((t) => t.id.equals(log.id))).write(
        GoalLogsCompanion(
          progress: Value(log.progress - 1),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return log.progress - 1;
    }
    return 0;
  }

  Future<int> setProgress(int goalId, DateTime date, int progress) async {
    final dateOnly = DateTime(date.year, date.month, date.day);
    final log = await getLogForDate(goalId, dateOnly);

    if (log != null) {
      await (update(goalLogs)..where((t) => t.id.equals(log.id))).write(
        GoalLogsCompanion(
          progress: Value(progress),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return progress;
    }

    await into(goalLogs).insert(GoalLogsCompanion.insert(
      goalId: goalId,
      date: dateOnly,
      progress: Value(progress),
    ));
    return progress;
  }
}
