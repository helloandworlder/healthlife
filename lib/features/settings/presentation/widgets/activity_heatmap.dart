import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ActivityHeatmap extends StatelessWidget {
  final Map<DateTime, int> activityData;
  final int monthsToShow;

  const ActivityHeatmap({
    super.key,
    required this.activityData,
    this.monthsToShow = 6,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month - monthsToShow + 1, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWeekdayLabels(theme),
        const SizedBox(height: 4),
        SizedBox(
          height: 7 * 14.0,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildMonthColumns(startDate, now, theme),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _buildLegend(theme),
      ],
    );
  }

  Widget _buildWeekdayLabels(ThemeData theme) {
    const weekdays = ['日', '一', '二', '三', '四', '五', '六'];
    return Row(
      children: [
        const SizedBox(width: 4),
        ...weekdays.map((d) => SizedBox(
              width: 14,
              height: 12,
              child: Text(
                d,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 8,
                  color: theme.colorScheme.outline,
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }

  List<Widget> _buildMonthColumns(DateTime start, DateTime end, ThemeData theme) {
    final columns = <Widget>[];
    var current = start;

    while (current.isBefore(end) || current.month == end.month && current.year == end.year) {
      final monthStart = DateTime(current.year, current.month, 1);
      final monthEnd = DateTime(current.year, current.month + 1, 0);
      final daysInMonth = monthEnd.day;

      columns.add(
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(7, (weekday) {
                return Row(
                  children: _buildDayRow(monthStart, daysInMonth, weekday, end),
                );
              }),
            ],
          ),
        ),
      );

      current = DateTime(current.year, current.month + 1, 1);
    }

    return columns;
  }

  List<Widget> _buildDayRow(DateTime monthStart, int daysInMonth, int weekday, DateTime now) {
    final cells = <Widget>[];
    final weeksInMonth = ((daysInMonth + monthStart.weekday) / 7).ceil();

    for (var week = 0; week < weeksInMonth; week++) {
      final dayOfMonth = week * 7 + weekday - monthStart.weekday + 1;
      if (dayOfMonth < 1 || dayOfMonth > daysInMonth) {
        cells.add(const SizedBox(width: 12, height: 12));
        continue;
      }

      final date = DateTime(monthStart.year, monthStart.month, dayOfMonth);
      if (date.isAfter(now)) {
        cells.add(const SizedBox(width: 12, height: 12));
        continue;
      }

      final dateKey = DateTime(date.year, date.month, date.day);
      final level = activityData[dateKey] ?? 0;

      cells.add(
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: _getLevelColor(level),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      );
    }

    return cells;
  }

  Color _getLevelColor(int level) {
    switch (level) {
      case 0:
        return AppColors.activityNone;
      case 1:
        return AppColors.activityLight;
      case 2:
        return AppColors.activityModerate;
      case 3:
        return AppColors.activityHigh;
      default:
        return AppColors.activityHigh;
    }
  }

  Widget _buildLegend(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '少',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
            fontSize: 10,
          ),
        ),
        const SizedBox(width: 4),
        ...List.generate(4, (i) => Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 1),
              decoration: BoxDecoration(
                color: _getLevelColor(i),
                borderRadius: BorderRadius.circular(2),
              ),
            )),
        const SizedBox(width: 4),
        Text(
          '多',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.outline,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
