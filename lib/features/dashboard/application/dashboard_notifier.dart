import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/constants/health_types.dart';
import '../../../core/utils/bmi_calculator.dart';
import '../../../core/utils/calorie_calculator.dart';
import '../../../shared/db/app_database.dart';
import '../domain/plan_progress.dart';
import '../domain/today_summary.dart';

part 'dashboard_notifier.g.dart';

@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  Future<DashboardState> build() async {
    final db = ref.watch(databaseProvider);
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final results = await Future.wait([
      db.metricsDao.getMetricsForDate(todayDate),
      db.mealDao.getTotalCaloriesForDate(todayDate),
      db.planDao.getActivePlan(),
      db.weightDao.getLatestWeight(),
      db.userProfileDao.getProfile(),
      _getPreviousWeight(db, todayDate),
    ]);

    final metrics = results[0] as DailyMetric?;
    final todayCalories = results[1] as int;
    final plan = results[2] as Plan?;
    final latestWeight = results[3] as WeightRecord?;
    final profile = results[4] as UserProfile?;
    final previousWeight = results[5] as WeightRecord?;

    final caloriesBurned = metrics?.caloriesBurned ?? _estimateTDEE(profile);
    final deficitTarget = plan?.dailyCalorieDeficit ?? 0;

    final calorieBudget = CalorieBudget.calculate(
      burned: caloriesBurned,
      intake: todayCalories,
      deficitTarget: deficitTarget,
    );

    double? weightDelta;
    if (latestWeight != null && previousWeight != null) {
      weightDelta = latestWeight.weight - previousWeight.weight;
    }

    final todaySummary = TodaySummary(
      steps: metrics?.steps ?? 0,
      activeMinutes: metrics?.activeMinutes ?? 0,
      caloriesBurned: caloriesBurned,
      sleepHours: metrics?.sleepHours ?? 0,
      caloriesIntake: todayCalories,
      calorieBudget: calorieBudget,
      latestWeight: latestWeight?.weight,
      weightDelta: weightDelta,
    );

    PlanProgress? planProgress;
    if (plan != null && latestWeight != null) {
      final currentDay = today.difference(plan.startDate).inDays + 1;
      final bmiValue = BMICalculator.calculateBMI(weightKg: latestWeight.weight, heightCm: profile?.height ?? 170);

      planProgress = PlanProgress(
        planId: plan.id,
        initialWeight: plan.initialWeight,
        targetWeight: plan.targetWeight,
        currentWeight: latestWeight.weight,
        currentDay: currentDay.clamp(1, plan.durationDays),
        totalDays: plan.durationDays,
        startDate: plan.startDate,
        endDate: plan.endDate,
        dailyCalorieDeficit: plan.dailyCalorieDeficit,
        bmi: bmiValue,
      );
    }

    return DashboardState(
      todaySummary: todaySummary,
      planProgress: planProgress,
      plan: plan,
      profile: profile,
    );
  }

  Future<WeightRecord?> _getPreviousWeight(AppDatabase db, DateTime today) async {
    final history = await db.weightDao.getWeightHistory(
      to: today.subtract(const Duration(days: 1)),
      limit: 1,
    );
    return history.isNotEmpty ? history.first : null;
  }

  int _estimateTDEE(UserProfile? profile) {
    if (profile == null) return 2000;

    final gender = profile.gender == 'male' ? Gender.male : Gender.female;
    final weight = profile.weight ?? 70;
    final height = profile.height ?? 170;
    final age = profile.birthday != null
        ? DateTime.now().difference(profile.birthday!).inDays ~/ 365
        : 30;
    final activityLevel = UserActivityLevel.values.firstWhere(
      (l) => l.name == profile.activityLevel,
      orElse: () => UserActivityLevel.sedentary,
    );

    return CalorieCalculator.calculateTDEEFromProfile(
      gender: gender,
      weightKg: weight,
      heightCm: height,
      age: age,
      activityLevel: activityLevel,
    ).round();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  Future<void> logWeight(double weight) async {
    final db = ref.read(databaseProvider);
    await db.weightDao.insertWeight(weight);
    ref.invalidateSelf();
  }

  Future<void> createPlan({
    required double initialWeight,
    required double targetWeight,
    required int durationDays,
    required int dailyCalorieDeficit,
  }) async {
    final db = ref.read(databaseProvider);
    await db.planDao.createPlan(
      initialWeight: initialWeight,
      targetWeight: targetWeight,
      durationDays: durationDays,
      dailyCalorieDeficit: dailyCalorieDeficit,
    );
    ref.invalidateSelf();
  }

  Future<void> endCurrentPlan() async {
    final db = ref.read(databaseProvider);
    final plan = await db.planDao.getActivePlan();
    if (plan != null) {
      await db.planDao.endPlan(plan.id);
      ref.invalidateSelf();
    }
  }
}

class DashboardState {
  const DashboardState({
    required this.todaySummary,
    this.planProgress,
    this.plan,
    this.profile,
  });

  final TodaySummary todaySummary;
  final PlanProgress? planProgress;
  final Plan? plan;
  final UserProfile? profile;

  bool get hasPlan => plan != null;
}
