import 'package:flutter/material.dart';

import '../../../../shared/widgets/section_card.dart';
import '../../domain/plan_progress.dart';
import 'weight_gauge.dart';

class PlanOverviewCard extends StatelessWidget {
  const PlanOverviewCard({
    super.key,
    this.planProgress,
    this.onCreatePlan,
    this.onEndPlan,
  });

  final PlanProgress? planProgress;
  final VoidCallback? onCreatePlan;
  final VoidCallback? onEndPlan;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (planProgress == null) {
      return SectionCard(
        title: '减重计划',
        trailing: TextButton(
          onPressed: onCreatePlan,
          child: const Text('创建计划'),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 48,
                  color: theme.colorScheme.outline,
                ),
                const SizedBox(height: 12),
                Text(
                  '还没有减重计划',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '创建一个计划开始你的健康之旅',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final progress = planProgress!;

    return SectionCard(
      title: '减重计划',
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'end') {
            onEndPlan?.call();
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'end',
            child: Row(
              children: [
                Icon(Icons.stop_circle_outlined, size: 20),
                SizedBox(width: 8),
                Text('结束计划'),
              ],
            ),
          ),
        ],
        child: const Icon(Icons.more_vert),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressInfo(
                context,
                '第 ${progress.currentDay} 天',
                '共 ${progress.totalDays} 天',
              ),
              _buildProgressInfo(
                context,
                '已减 ${progress.weightLost.toStringAsFixed(1)} kg',
                '目标 ${progress.weightToLose.toStringAsFixed(1)} kg',
              ),
            ],
          ),
          const SizedBox(height: 16),
          WeightGauge(
            initialWeight: progress.initialWeight,
            currentWeight: progress.currentWeight,
            targetWeight: progress.targetWeight,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress.currentDay / progress.totalDays,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text(
            '还剩 ${progress.daysRemaining} 天',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressInfo(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
