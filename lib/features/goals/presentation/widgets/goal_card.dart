import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/goal_with_progress.dart';

class GoalCard extends StatelessWidget {
  final GoalWithProgress goalWithProgress;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const GoalCard({
    super.key,
    required this.goalWithProgress,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = goalWithProgress.isCompleted;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildIcon(theme),
              const SizedBox(width: 16),
              Expanded(child: _buildContent(theme)),
              _buildCheckButton(theme, isCompleted),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          goalWithProgress.goal.icon,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    final goal = goalWithProgress.goal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          goal.name,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            decoration: goalWithProgress.isCompleted ? TextDecoration.lineThrough : null,
            color: goalWithProgress.isCompleted ? theme.colorScheme.outline : null,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              goalWithProgress.progressText,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: goalWithProgress.progressPercent,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  minHeight: 4,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckButton(ThemeData theme, bool isCompleted) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isCompleted ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
        border: Border.all(
          color: isCompleted ? theme.colorScheme.primary : theme.colorScheme.outline.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Icon(
        isCompleted ? Icons.check : Icons.add,
        color: isCompleted ? theme.colorScheme.onPrimary : theme.colorScheme.outline,
        size: 20,
      ),
    );
  }
}
