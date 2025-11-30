import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_progress.freezed.dart';

@freezed
sealed class PlanProgress with _$PlanProgress {
  const factory PlanProgress({
    required int planId,
    required double initialWeight,
    required double targetWeight,
    required double currentWeight,
    required int currentDay,
    required int totalDays,
    required DateTime startDate,
    required DateTime endDate,
    required int dailyCalorieDeficit,
    required double bmi,
  }) = _PlanProgress;

  const PlanProgress._();

  double get weightLost => initialWeight - currentWeight;

  double get weightToLose => initialWeight - targetWeight;

  double get progressPercent {
    if (weightToLose <= 0) return 1.0;
    final progress = weightLost / weightToLose;
    return progress.clamp(0.0, 1.0);
  }

  int get daysRemaining => totalDays - currentDay;

  bool get isCompleted => currentDay >= totalDays || currentWeight <= targetWeight;
}
