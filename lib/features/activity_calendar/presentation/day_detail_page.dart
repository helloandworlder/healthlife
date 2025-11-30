import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_utils.dart';
import '../../../shared/widgets/section_card.dart';
import '../application/activity_calendar_notifier.dart';
import '../domain/activity_level.dart';

class DayDetailPage extends ConsumerWidget {
  const DayDetailPage({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dayActivityAsync = ref.watch(dayDetailProvider(date));

    return Scaffold(
      appBar: AppBar(
        title: Text(AppDateUtils.formatDate(date)),
      ),
      body: dayActivityAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
        data: (activity) {
          if (activity == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_busy,
                    size: 64,
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无数据',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '这一天还没有健康数据记录',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                _buildActivityHeader(context, activity),
                _buildMetricCard(
                  context,
                  title: '步数',
                  value: '${activity.steps}',
                  unit: '步',
                  icon: Icons.directions_walk,
                  color: Colors.blue,
                  progress: activity.steps / 10000,
                  target: '10,000 步',
                ),
                _buildMetricCard(
                  context,
                  title: '运动时长',
                  value: '${activity.activeMinutes}',
                  unit: '分钟',
                  icon: Icons.fitness_center,
                  color: Colors.orange,
                  progress: activity.activeMinutes / 60,
                  target: '60 分钟',
                ),
                _buildMetricCard(
                  context,
                  title: '消耗热量',
                  value: '${activity.caloriesBurned}',
                  unit: '千卡',
                  icon: Icons.local_fire_department,
                  color: Colors.red,
                ),
                _buildMetricCard(
                  context,
                  title: '睡眠时长',
                  value: activity.sleepHours.toStringAsFixed(1),
                  unit: '小时',
                  icon: Icons.bedtime,
                  color: Colors.purple,
                  progress: activity.sleepHours / 8,
                  target: '8 小时',
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActivityHeader(BuildContext context, dynamic activity) {
    final theme = Theme.of(context);
    final level = activity.level as ActivityLevel;

    return SectionCard(
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: level.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getLevelIcon(level),
              color: level == ActivityLevel.high || level == ActivityLevel.moderate
                  ? Colors.white
                  : theme.colorScheme.outline,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  level.label,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _getLevelDescription(level),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context, {
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color color,
    double? progress,
    String? target,
  }) {
    final theme = Theme.of(context);

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
          if (progress != null && target != null) ...[
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 4),
            Text(
              '目标: $target',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getLevelIcon(ActivityLevel level) {
    switch (level) {
      case ActivityLevel.none:
        return Icons.hotel;
      case ActivityLevel.light:
        return Icons.directions_walk;
      case ActivityLevel.moderate:
        return Icons.directions_run;
      case ActivityLevel.high:
        return Icons.fitness_center;
    }
  }

  String _getLevelDescription(ActivityLevel level) {
    switch (level) {
      case ActivityLevel.none:
        return '这一天没有运动记录';
      case ActivityLevel.light:
        return '轻度活动，继续保持！';
      case ActivityLevel.moderate:
        return '中度活动，做得不错！';
      case ActivityLevel.high:
        return '高强度活动，太棒了！';
    }
  }
}
