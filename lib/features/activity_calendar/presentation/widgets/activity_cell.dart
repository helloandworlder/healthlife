import 'package:flutter/material.dart';

import '../../domain/activity_level.dart';

class ActivityCell extends StatelessWidget {
  const ActivityCell({
    super.key,
    required this.day,
    required this.level,
    required this.isToday,
    required this.onTap,
  });

  final int day;
  final ActivityLevel level;
  final bool isToday;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: level.color,
          borderRadius: BorderRadius.circular(4),
          border: isToday
              ? Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                )
              : null,
        ),
        child: Center(
          child: Text(
            '$day',
            style: theme.textTheme.bodySmall?.copyWith(
              color: level == ActivityLevel.high || level == ActivityLevel.moderate
                  ? Colors.white
                  : theme.colorScheme.outline,
              fontWeight: isToday ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }
}
