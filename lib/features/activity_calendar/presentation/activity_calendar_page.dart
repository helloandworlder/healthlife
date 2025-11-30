import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/loading_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../application/activity_calendar_notifier.dart';
import 'widgets/week_view.dart';
import 'widgets/month_view.dart';

class ActivityCalendarPage extends ConsumerStatefulWidget {
  const ActivityCalendarPage({super.key});

  @override
  ConsumerState<ActivityCalendarPage> createState() => _ActivityCalendarPageState();
}

class _ActivityCalendarPageState extends ConsumerState<ActivityCalendarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calendarAsync = ref.watch(activityCalendarNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('行动'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '周'),
            Tab(text: '月'),
          ],
        ),
      ),
      body: calendarAsync.when(
        loading: () => const LoadingState(),
        error: (error, stack) => ErrorState(
          message: '加载失败',
          onRetry: () => ref.invalidate(activityCalendarNotifierProvider),
        ),
        data: (state) => TabBarView(
          controller: _tabController,
          children: [
            WeekView(
              weekStats: state.weekStats,
              selectedWeekStart: state.selectedWeekStart,
              onPreviousWeek: () {
                ref.read(activityCalendarNotifierProvider.notifier).selectWeek(
                  state.selectedWeekStart.subtract(const Duration(days: 7)),
                );
              },
              onNextWeek: () {
                ref.read(activityCalendarNotifierProvider.notifier).selectWeek(
                  state.selectedWeekStart.add(const Duration(days: 7)),
                );
              },
              onDayTap: (date) => _navigateToDayDetail(context, date),
            ),
            MonthView(
              month: state.selectedMonth,
              heatmap: state.monthHeatmap,
              onPreviousMonth: () {
                ref.read(activityCalendarNotifierProvider.notifier).selectMonth(
                  DateTime(state.selectedMonth.year, state.selectedMonth.month - 1),
                );
              },
              onNextMonth: () {
                ref.read(activityCalendarNotifierProvider.notifier).selectMonth(
                  DateTime(state.selectedMonth.year, state.selectedMonth.month + 1),
                );
              },
              onDayTap: (date) => _navigateToDayDetail(context, date),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDayDetail(BuildContext context, DateTime date) {
    final dateStr = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    context.push('/activity/day/$dateStr');
  }
}
