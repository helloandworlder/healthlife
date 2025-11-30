import 'package:flutter/material.dart';

import '../../../../core/utils/date_utils.dart';
import '../../domain/activity_level.dart';
import '../../domain/week_stats.dart';
import 'activity_cell.dart';

class MonthView extends StatelessWidget {
  const MonthView({
    super.key,
    required this.month,
    required this.heatmap,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onDayTap,
  });

  final DateTime month;
  final MonthHeatmap heatmap;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
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
                  onPressed: onPreviousMonth,
                ),
                Text(
                  AppDateUtils.formatMonth(month),
                  style: theme.textTheme.titleMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: onNextMonth,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['日', '一', '二', '三', '四', '五', '六']
                  .map((d) => SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            d,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildMonthGrid(context),
          ),
          const SizedBox(height: 16),
          _buildLegend(context),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildMonthGrid(BuildContext context) {
    final firstDayOfMonth = month.monthStart;
    final daysInMonth = month.daysInMonth;
    final startWeekday = firstDayOfMonth.weekday % 7;

    final cells = <Widget>[];

    for (var i = 0; i < startWeekday; i++) {
      cells.add(const SizedBox(width: 40, height: 40));
    }

    for (var day = 1; day <= daysInMonth; day++) {
      final date = DateTime(month.year, month.month, day);
      final isToday = date.isToday();
      final level = heatmap.dayLevels[day] ?? ActivityLevel.none;

      cells.add(
        ActivityCell(
          day: day,
          level: level,
          isToday: isToday,
          onTap: () => onDayTap(date),
        ),
      );
    }

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: cells,
    );
  }

  Widget _buildLegend(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ActivityLevel.values.map((level) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: level.color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  level.label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
