import 'package:flutter/material.dart';

import '../../../../core/utils/date_utils.dart';
import '../../../../shared/widgets/section_card.dart';
import '../../domain/week_stats.dart';
import 'week_day_row.dart';
import 'stat_card.dart';

class WeekView extends StatelessWidget {
  const WeekView({
    super.key,
    required this.weekStats,
    required this.selectedWeekStart,
    required this.onPreviousWeek,
    required this.onNextWeek,
    required this.onDayTap,
  });

  final WeekStats weekStats;
  final DateTime selectedWeekStart;
  final VoidCallback onPreviousWeek;
  final VoidCallback onNextWeek;
  final void Function(DateTime date) onDayTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: onPreviousWeek,
                ),
                Text(
                  AppDateUtils.formatWeekRange(selectedWeekStart),
                  style: theme.textTheme.titleMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: onNextWeek,
                ),
              ],
            ),
          ),
          WeekDayRow(
            weekStart: selectedWeekStart,
            dayActivities: weekStats.dayActivities,
            onDayTap: onDayTap,
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: '本周统计',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatCard(
                  value: '${weekStats.activeDays}',
                  unit: '天',
                  label: '运动天数',
                ),
                StatCard(
                  value: '${weekStats.totalMinutes}',
                  unit: '分钟',
                  label: '总运动',
                ),
                StatCard(
                  value: '${weekStats.totalCalories}',
                  unit: '千卡',
                  label: '总消耗',
                ),
              ],
            ),
          ),
          SectionCard(
            child: Row(
              children: [
                Text(
                  weekStats.streak > 0 ? '🔥' : '💤',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weekStats.streak > 0 ? '连续达标' : '连胜中断',
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      weekStats.streak > 0
                          ? '${weekStats.streak} 天'
                          : '今天运动30分钟重新开始',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
