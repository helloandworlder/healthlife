import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../app/providers.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/goal_with_progress.dart';
import '../../gamification/application/gamification_service.dart';

part 'goals_notifier.g.dart';

@riverpod
class GoalsNotifier extends _$GoalsNotifier {
  @override
  Future<GoalsState> build() async {
    return _loadGoals();
  }

  Future<GoalsState> _loadGoals() async {
    final db = ref.read(databaseProvider);
    final today = DateTime.now().dateOnly;

    final goals = await db.goalDao.getAllGoals();
    final logs = await db.goalDao.getLogsForDate(today);

    final goalsWithProgress = goals.map((goal) {
      final log = logs.where((l) => l.goalId == goal.id).firstOrNull;
      final progress = log?.progress ?? 0;
      return GoalWithProgress(
        goal: goal,
        progress: progress,
        isCompleted: progress >= goal.target,
      );
    }).toList();

    return GoalsState(goals: goalsWithProgress);
  }

  Future<ToggleResult> toggleGoalCompletion(int goalId) async {
    final db = ref.read(databaseProvider);
    final today = DateTime.now().dateOnly;
    final gamification = ref.read(gamificationServiceProvider);

    final currentState = state.valueOrNull;
    if (currentState == null) return ToggleResult.incremented;

    final goalWithProgress = currentState.goals.firstWhere((g) => g.goal.id == goalId);
    final goal = goalWithProgress.goal;

    if (goalWithProgress.progress < goal.target) {
      final newProgress = await db.goalDao.incrementProgress(goalId, today);
      
      if (newProgress >= goal.target) {
        // Only award exp if not already awarded today
        final alreadyAwarded = await db.goalDao.isExpAwarded(goalId, today);
        if (!alreadyAwarded) {
          await gamification.awardExp(GamificationService.expPerGoal);
          await db.goalDao.markExpAwarded(goalId, today);
          ref.invalidate(petStateProvider);
          ref.invalidateSelf();
          return ToggleResult.completedWithExp;
        }
        ref.invalidateSelf();
        return ToggleResult.completedNoExp;
      }
      
      ref.invalidateSelf();
      return ToggleResult.incremented;
    } else {
      await db.goalDao.decrementProgress(goalId, today);
      ref.invalidateSelf();
      return ToggleResult.decremented;
    }
  }

  Future<void> createGoal({
    required String name,
    required String icon,
    required String period,
    required int target,
    String? reminderTime,
  }) async {
    final db = ref.read(databaseProvider);
    await db.goalDao.createGoal(
      name: name,
      icon: icon,
      period: period,
      target: target,
      reminderTime: reminderTime,
    );
    ref.invalidateSelf();
  }

  Future<void> updateGoal({
    required int id,
    String? name,
    String? icon,
    String? period,
    int? target,
    String? reminderTime,
  }) async {
    final db = ref.read(databaseProvider);
    await db.goalDao.updateGoal(
      id: id,
      name: name,
      icon: icon,
      period: period,
      target: target,
      reminderTime: reminderTime,
    );
    ref.invalidateSelf();
  }

  Future<void> deleteGoal(int id) async {
    final db = ref.read(databaseProvider);
    await db.goalDao.deleteGoal(id);
    ref.invalidateSelf();
  }

  Future<void> disableGoal(int id) async {
    final db = ref.read(databaseProvider);
    await db.goalDao.disableGoal(id);
    ref.invalidateSelf();
  }

  void refresh() {
    ref.invalidateSelf();
  }
}

@riverpod
Future<List<GoalReviewItem>> goalReviewForDate(GoalReviewForDateRef ref, DateTime date) async {
  final db = ref.watch(databaseProvider);
  final dateOnly = date.dateOnly;

  final goals = await db.goalDao.getAllGoals();
  final logs = await db.goalDao.getLogsForDate(dateOnly);

  return goals.map((goal) {
    final log = logs.where((l) => l.goalId == goal.id).firstOrNull;
    final progress = log?.progress ?? 0;
    return GoalReviewItem(
      goalId: goal.id,
      goalName: goal.name,
      goalIcon: goal.icon,
      target: goal.target,
      progress: progress,
      isCompleted: progress >= goal.target,
    );
  }).toList();
}

class GoalReviewItem {
  final int goalId;
  final String goalName;
  final String goalIcon;
  final int target;
  final int progress;
  final bool isCompleted;

  const GoalReviewItem({
    required this.goalId,
    required this.goalName,
    required this.goalIcon,
    required this.target,
    required this.progress,
    required this.isCompleted,
  });
}
