import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/date_utils.dart';
import '../application/goals_notifier.dart';

class GoalReviewPage extends ConsumerStatefulWidget {
  const GoalReviewPage({super.key});

  @override
  ConsumerState<GoalReviewPage> createState() => _GoalReviewPageState();
}

class _GoalReviewPageState extends ConsumerState<GoalReviewPage> {
  late DateTime _selectedDate;
  late PageController _pageController;
  static const int _initialPage = 365;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().dateOnly;
    _pageController = PageController(
      initialPage: _initialPage,
      viewportFraction: 0.15,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  DateTime _getDateForPage(int page) {
    final offset = page - _initialPage;
    return DateTime.now().dateOnly.add(Duration(days: offset));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('目标回顾'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          _buildDateSelector(theme),
          const Divider(height: 1),
          Expanded(child: _buildGoalList(theme)),
        ],
      ),
    );
  }

  Widget _buildDateSelector(ThemeData theme) {
    return Container(
      height: 80,
      color: theme.colorScheme.surface,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() => _selectedDate = _getDateForPage(page));
        },
        itemBuilder: (context, page) {
          final date = _getDateForPage(page);
          final isSelected = date == _selectedDate;
          final isToday = date == DateTime.now().dateOnly;

          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? theme.colorScheme.primary : (isToday ? theme.colorScheme.primaryContainer : null),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getWeekdayShort(date.weekday),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.outline,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${date.day}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? theme.colorScheme.onPrimary : null,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getWeekdayShort(int weekday) {
    const days = ['一', '二', '三', '四', '五', '六', '日'];
    return days[weekday - 1];
  }

  Widget _buildGoalList(ThemeData theme) {
    final reviewAsync = ref.watch(goalReviewForDateProvider(_selectedDate));

    return reviewAsync.when(
      data: (items) {
        if (items.isEmpty) {
          return Center(
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
                  '这一天没有目标记录',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          );
        }

        final completed = items.where((i) => i.isCompleted).length;
        final total = items.length;

        return Column(
          children: [
            _buildSummaryHeader(theme, completed, total),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                itemBuilder: (context, index) => _buildReviewItem(theme, items[index]),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('加载失败: $e')),
    );
  }

  Widget _buildSummaryHeader(ThemeData theme, int completed, int total) {
    final rate = total > 0 ? (completed / total * 100).toInt() : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSummaryItem(theme, '${_selectedDate.month}月${_selectedDate.day}日', _getWeekdayFull(_selectedDate.weekday)),
          Container(width: 1, height: 40, color: theme.colorScheme.outline.withOpacity(0.3)),
          _buildSummaryItem(theme, '$completed / $total', '完成目标'),
          Container(width: 1, height: 40, color: theme.colorScheme.outline.withOpacity(0.3)),
          _buildSummaryItem(theme, '$rate%', '完成率'),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(ThemeData theme, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
        ),
      ],
    );
  }

  String _getWeekdayFull(int weekday) {
    const days = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return days[weekday - 1];
  }

  Widget _buildReviewItem(ThemeData theme, GoalReviewItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: item.isCompleted
                ? theme.colorScheme.primaryContainer
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(item.goalIcon, style: const TextStyle(fontSize: 24)),
          ),
        ),
        title: Text(
          item.goalName,
          style: theme.textTheme.titleMedium?.copyWith(
            decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            color: item.isCompleted ? theme.colorScheme.outline : null,
          ),
        ),
        subtitle: Text(
          '${item.progress} / ${item.target}',
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.outline),
        ),
        trailing: Icon(
          item.isCompleted ? Icons.check_circle : Icons.circle_outlined,
          color: item.isCompleted ? theme.colorScheme.primary : theme.colorScheme.outline,
        ),
      ),
    );
  }
}
