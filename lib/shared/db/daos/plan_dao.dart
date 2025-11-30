import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/plans.dart';

part 'plan_dao.g.dart';

@DriftAccessor(tables: [Plans])
class PlanDao extends DatabaseAccessor<AppDatabase> with _$PlanDaoMixin {
  PlanDao(super.db);

  Future<Plan?> getActivePlan() async {
    return (select(plans)
          ..where((t) => t.isActive.equals(true))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<Plan>> getAllPlans() async {
    return (select(plans)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
  }

  Future<int> createPlan({
    required double initialWeight,
    required double targetWeight,
    required int durationDays,
    required int dailyCalorieDeficit,
  }) async {
    // 先将所有计划设为非活动
    await (update(plans)).write(const PlansCompanion(isActive: Value(false)));

    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    final endDate = startDate.add(Duration(days: durationDays));

    return into(plans).insert(PlansCompanion.insert(
      initialWeight: initialWeight,
      targetWeight: targetWeight,
      durationDays: durationDays,
      dailyCalorieDeficit: Value(dailyCalorieDeficit),
      startDate: startDate,
      endDate: endDate,
    ));
  }

  Future<void> endPlan(int planId) async {
    await (update(plans)..where((t) => t.id.equals(planId)))
        .write(const PlansCompanion(isActive: Value(false)));
  }

  Future<int> getPlanDayNumber(Plan plan) async {
    final today = DateTime.now();
    final startDate = plan.startDate;
    return today.difference(startDate).inDays + 1;
  }
}
