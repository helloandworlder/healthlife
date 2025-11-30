import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_review_data.freezed.dart';

@freezed
sealed class WeeklyReviewData with _$WeeklyReviewData {
  const factory WeeklyReviewData({
    required DateTime weekStart,
    required DateTime weekEnd,
    required double avgSleepHours,
    int? avgHrv,
    required int totalSteps,
    required int totalCaloriesBurned,
    required int exerciseMinutes,
    required int waterDays,
    required int goalCompletionRate,
    required String title,
    required List<DailyReviewItem> dailyItems,
  }) = _WeeklyReviewData;

  const WeeklyReviewData._();

  String get weekRangeText {
    final startMonth = weekStart.month;
    final endMonth = weekEnd.month;
    if (startMonth == endMonth) {
      return '${startMonth}月${weekStart.day}日 - ${weekEnd.day}日';
    }
    return '${startMonth}月${weekStart.day}日 - ${endMonth}月${weekEnd.day}日';
  }

  String get avgSleepText => avgSleepHours.toStringAsFixed(1);

  String get stepsText {
    if (totalSteps >= 10000) {
      return '${(totalSteps / 10000).toStringAsFixed(1)}万';
    }
    return totalSteps.toString();
  }

  String get caloriesText {
    if (totalCaloriesBurned >= 10000) {
      return '${(totalCaloriesBurned / 10000).toStringAsFixed(1)}万';
    }
    return totalCaloriesBurned.toString();
  }
}

@freezed
sealed class DailyReviewItem with _$DailyReviewItem {
  const factory DailyReviewItem({
    required DateTime date,
    required int steps,
    required int activeMinutes,
    required int caloriesBurned,
    required double sleepHours,
    int? hrv,
    required int goalsCompleted,
    required int goalsTotal,
  }) = _DailyReviewItem;
}

enum WeekTitle {
  energyFull('能量满满', '🔥'),
  exerciseMaster('运动达人', '🏃'),
  notBad('还不错', '👍'),
  needMore('有待加油', '💪'),
  notActive('压根没动', '😴');

  const WeekTitle(this.label, this.emoji);

  final String label;
  final String emoji;

  String get displayText => '$emoji $label';
}

String generateWeekTitle({
  required double avgSleepHours,
  required int totalSteps,
  required int exerciseMinutes,
  required int goalCompletionRate,
}) {
  final sleepScore = avgSleepHours >= 7 ? 1 : 0;
  final stepScore = totalSteps >= 50000 ? 1 : 0;
  final exerciseScore = exerciseMinutes >= 150 ? 1 : 0;
  final goalScore = goalCompletionRate >= 80 ? 1 : 0;

  final totalScore = sleepScore + stepScore + exerciseScore + goalScore;

  if (totalScore >= 4) return WeekTitle.energyFull.label;
  if (totalScore >= 3) return WeekTitle.exerciseMaster.label;
  if (totalScore >= 2) return WeekTitle.notBad.label;
  if (totalScore >= 1) return WeekTitle.needMore.label;
  return WeekTitle.notActive.label;
}
