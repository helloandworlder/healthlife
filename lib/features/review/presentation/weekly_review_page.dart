import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../application/weekly_review_notifier.dart';
import '../domain/weekly_review_data.dart';
import 'widgets/share_card_generator.dart';
import 'widgets/stat_grid.dart';
import 'widgets/week_title_header.dart';

class WeeklyReviewPage extends ConsumerWidget {
  const WeeklyReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewAsync = ref.watch(weeklyReviewNotifierProvider());
    final notifier = ref.read(weeklyReviewNotifierProvider().notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('每周回顾'),
        actions: [
          IconButton(
            onPressed: () => _showShareSheet(context, ref),
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: reviewAsync.when(
        data: (data) => _buildContent(context, data, notifier),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.error),
              const SizedBox(height: 16),
              Text('加载失败: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(weeklyReviewNotifierProvider()),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WeeklyReviewData data,
    WeeklyReviewNotifier notifier,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildWeekNavigator(context, data, notifier),
          const SizedBox(height: 24),
          WeekTitleHeader(title: data.title),
          const SizedBox(height: 24),
          StatGrid(data: data),
          const SizedBox(height: 24),
          _buildDailyBreakdown(context, data),
        ],
      ),
    );
  }

  Widget _buildWeekNavigator(
    BuildContext context,
    WeeklyReviewData data,
    WeeklyReviewNotifier notifier,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => notifier.navigateToPreviousWeek(),
          icon: const Icon(Icons.chevron_left),
        ),
        Text(
          data.weekRangeText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        IconButton(
          onPressed: notifier.canGoNext ? () => notifier.navigateToNextWeek() : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildDailyBreakdown(BuildContext context, WeeklyReviewData data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '每日详情',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ...data.dailyItems.map((item) => _buildDayRow(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _buildDayRow(BuildContext context, DailyReviewItem item) {
    final weekDays = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    final dayName = weekDays[item.date.weekday % 7];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              dayName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDayStat(context, Icons.directions_walk, '${item.steps}'),
                _buildDayStat(context, Icons.local_fire_department, '${item.caloriesBurned}'),
                _buildDayStat(context, Icons.bedtime, '${item.sleepHours.toStringAsFixed(1)}h'),
                _buildDayStat(
                  context,
                  Icons.check_circle_outline,
                  '${item.goalsCompleted}/${item.goalsTotal}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayStat(BuildContext context, IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  void _showShareSheet(BuildContext context, WidgetRef ref) {
    final data = ref.read(weeklyReviewNotifierProvider()).valueOrNull;
    if (data == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ShareCardGenerator(data: data),
    );
  }
}
