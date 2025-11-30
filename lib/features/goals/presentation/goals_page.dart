import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/route_names.dart';
import '../../../core/constants/health_types.dart';
import '../../../app/providers.dart';
import '../application/goals_notifier.dart';
import '../domain/goal_with_progress.dart';
import 'widgets/pet_header.dart';
import 'widgets/goal_card.dart';
import 'widgets/create_goal_sheet.dart';
import '../../gamification/application/gamification_service.dart';

class GoalsPage extends ConsumerWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petStateAsync = ref.watch(petStateProvider);
    final goalsStateAsync = ref.watch(goalsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('目标'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: '目标回顾',
            onPressed: () => context.push('${RoutePaths.goals}/${RoutePaths.goalReview}'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(goalsNotifierProvider);
          ref.invalidate(petStateProvider);
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: petStateAsync.when(
                data: (petState) => PetHeader(petState: petState),
                loading: () => const SizedBox(height: 150),
                error: (e, s) => const SizedBox(height: 150),
              ),
            ),
            goalsStateAsync.when(
              data: (goalsState) => _buildGoalsList(context, ref, goalsState),
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, s) => SliverFillRemaining(
                child: Center(child: Text('加载失败: $e')),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateGoalSheet(context),
        icon: const Icon(Icons.add),
        label: const Text('添加目标'),
      ),
    );
  }

  Widget _buildGoalsList(BuildContext context, WidgetRef ref, GoalsState goalsState) {
    final theme = Theme.of(context);

    if (goalsState.goals.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flag_outlined,
                size: 64,
                color: theme.colorScheme.outline,
              ),
              const SizedBox(height: 16),
              Text(
                '还没有目标',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '点击下方按钮创建你的第一个目标',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return _buildSummaryCard(context, goalsState);
          }
          final goalIndex = index - 1;
          if (goalIndex >= goalsState.goals.length) return null;
          final goal = goalsState.goals[goalIndex];
          return GoalCard(
            goalWithProgress: goal,
            onTap: () => _handleGoalTap(context, ref, goal),
            onLongPress: () => _showGoalOptions(context, ref, goal),
          );
        },
        childCount: goalsState.goals.length + 1,
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, GoalsState goalsState) {
    final theme = Theme.of(context);
    final completed = goalsState.completedCount;
    final total = goalsState.totalCount;
    final rate = total > 0 ? (completed / total * 100).toInt() : 0;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSummaryItem(theme, '今日进度', '$completed / $total'),
          Container(
            width: 1,
            height: 40,
            color: theme.colorScheme.outline.withOpacity(0.3),
          ),
          _buildSummaryItem(theme, '完成率', '$rate%'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(ThemeData theme, String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Future<void> _handleGoalTap(BuildContext context, WidgetRef ref, GoalWithProgress goal) async {
    final result = await ref.read(goalsNotifierProvider.notifier).toggleGoalCompletion(goal.goal.id);

    if (result == ToggleResult.completed) {
      HapticFeedback.mediumImpact();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Text('🎉 '),
                Text('完成目标 +${GamificationService.expPerGoal} 经验'),
              ],
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showGoalOptions(BuildContext context, WidgetRef ref, GoalWithProgress goal) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('编辑目标'),
              onTap: () {
                Navigator.pop(context);
                _showEditGoalSheet(context, goal);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
              title: Text('删除目标', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              onTap: () async {
                Navigator.pop(context);
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('删除目标'),
                    content: Text('确定要删除"${goal.goal.name}"吗？'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
                      ),
                    ],
                  ),
                );
                if (confirmed == true) {
                  await ref.read(goalsNotifierProvider.notifier).deleteGoal(goal.goal.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateGoalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const CreateGoalSheet(),
    );
  }

  void _showEditGoalSheet(BuildContext context, GoalWithProgress goalWithProgress) {
    final goal = goalWithProgress.goal;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => GoalEditSheet(
        goalId: goal.id,
        initialName: goal.name,
        initialIcon: goal.icon,
        initialPeriod: goal.period == 'daily' ? GoalPeriod.daily : GoalPeriod.weekly,
        initialTarget: goal.target,
        initialReminderTime: goal.reminderTime,
      ),
    );
  }
}
