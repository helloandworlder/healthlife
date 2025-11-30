import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/weekly_review_data.dart';

class StatGrid extends StatelessWidget {
  final WeeklyReviewData data;

  const StatGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: [
        _StatCard(
          icon: Icons.bedtime_outlined,
          label: '平均睡眠',
          value: data.avgSleepText,
          unit: '小时',
          color: AppColors.sleep,
        ),
        _StatCard(
          icon: Icons.favorite_outline,
          label: '平均HRV',
          value: data.avgHrv?.toString() ?? '-',
          unit: 'ms',
          color: AppColors.heart,
        ),
        _StatCard(
          icon: Icons.directions_walk_outlined,
          label: '总步数',
          value: data.stepsText,
          unit: '步',
          color: AppColors.steps,
        ),
        _StatCard(
          icon: Icons.water_drop_outlined,
          label: '饮水天数',
          value: data.waterDays.toString(),
          unit: '天',
          color: AppColors.water,
        ),
        _StatCard(
          icon: Icons.local_fire_department_outlined,
          label: '总消耗',
          value: data.caloriesText,
          unit: '千卡',
          color: AppColors.calories,
        ),
        _StatCard(
          icon: Icons.fitness_center_outlined,
          label: '锻炼时长',
          value: data.exerciseMinutes.toString(),
          unit: '分钟',
          color: AppColors.exercise,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: color),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    unit,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
