import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/weekly_review_data.dart';

class WeekTitleHeader extends StatelessWidget {
  final String title;

  const WeekTitleHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final weekTitle = _getWeekTitle(title);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.1),
            AppColors.secondary.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            weekTitle.emoji,
            style: const TextStyle(fontSize: 64),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            _getSubtitle(title),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
      ),
    );
  }

  WeekTitle _getWeekTitle(String title) {
    return WeekTitle.values.firstWhere(
      (t) => t.label == title,
      orElse: () => WeekTitle.notBad,
    );
  }

  String _getSubtitle(String title) {
    switch (title) {
      case '能量满满':
        return '这周状态超棒！继续保持~';
      case '运动达人':
        return '运动习惯很好，注意休息';
      case '还不错':
        return '稳步前进中，再接再厉';
      case '有待加油':
        return '新的一周，新的开始！';
      case '压根没动':
        return '休息也是必要的，下周加油';
      default:
        return '健康生活，从点滴开始';
    }
  }
}
