import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_summary.freezed.dart';

@freezed
sealed class TodaySummary with _$TodaySummary {
  const factory TodaySummary({
    required int steps,
    required int activeMinutes,
    required int caloriesBurned,
    required double sleepHours,
    required int caloriesIntake,
    required CalorieBudget calorieBudget,
    double? latestWeight,
    double? weightDelta,
  }) = _TodaySummary;
}

@freezed
sealed class CalorieBudget with _$CalorieBudget {
  const factory CalorieBudget({
    required int burned,
    required int intake,
    required int deficit,
    required int remaining,
    required bool isOverBudget,
  }) = _CalorieBudget;

  factory CalorieBudget.calculate({
    required int burned,
    required int intake,
    required int deficitTarget,
  }) {
    final remaining = burned - intake - deficitTarget;
    return CalorieBudget(
      burned: burned,
      intake: intake,
      deficit: deficitTarget,
      remaining: remaining > 0 ? remaining : 0,
      isOverBudget: remaining < 0,
    );
  }
}
