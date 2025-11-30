import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../shared/db/app_database.dart';
import '../../../core/constants/health_types.dart';

part 'goal_with_progress.freezed.dart';

@freezed
sealed class GoalWithProgress with _$GoalWithProgress {
  const factory GoalWithProgress({
    required Goal goal,
    required int progress,
    required bool isCompleted,
  }) = _GoalWithProgress;

  const GoalWithProgress._();

  GoalPeriod get period => goal.period == 'daily' ? GoalPeriod.daily : GoalPeriod.weekly;
  
  String get progressText {
    if (period == GoalPeriod.daily) {
      return '今日 $progress/${goal.target} 次';
    } else {
      return '本周 $progress/${goal.target} 天';
    }
  }

  double get progressPercent {
    if (goal.target <= 0) return 0;
    return (progress / goal.target).clamp(0.0, 1.0);
  }
}

@freezed
sealed class GoalsState with _$GoalsState {
  const factory GoalsState({
    @Default([]) List<GoalWithProgress> goals,
    @Default(false) bool isLoading,
    String? error,
  }) = _GoalsState;

  const GoalsState._();

  int get completedCount => goals.where((g) => g.isCompleted).length;
  int get totalCount => goals.length;
  double get completionRate => totalCount > 0 ? completedCount / totalCount : 0;
}

enum ToggleResult {
  incremented,
  completed,
  decremented,
}
