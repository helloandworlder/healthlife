import 'package:flutter/material.dart';

import '../../../../core/utils/date_utils.dart';
import '../../domain/activity_level.dart';
import '../../domain/week_stats.dart';

class WeekDayRow extends StatelessWidget {
  const WeekDayRow({
    super.key,
    required this.weekStart,
    required this.dayActivities,
    required this.onDayTap,
  });

  final DateTime weekStart;
  final List<DayActivity> dayActivities;
  final void Function(DateTime date) onDayTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(7, (index) {
          final day = weekStart.add(Duration(days: index));
          final activity = dayActivities.length > index
              ? dayActivities[index]
              : null;
          final isToday = day.isToday();

          return _DayCell(
            date: day,
            activity: activity,
            isToday: isToday,
            onTap: () => onDayTap(day),
          );
        }),
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.date,
    this.activity,
    required this.isToday,
    required this.onTap,
  });

  final DateTime date;
  final DayActivity? activity;
  final bool isToday;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final levelColor = activity?.level.color ?? Colors.grey.shade300;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            date.shortWeekdayName,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isToday ? theme.colorScheme.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: isToday
                  ? null
                  : Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.3),
                    ),
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isToday
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurface,
                  fontWeight: isToday ? FontWeight.bold : null,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: levelColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
