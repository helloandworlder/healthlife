import 'package:flutter/material.dart';

import '../../../../shared/widgets/section_card.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
    this.currentWeight,
    this.weightDelta,
    required this.onAddWeight,
    required this.onTap,
  });

  final double? currentWeight;
  final double? weightDelta;
  final VoidCallback onAddWeight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionCard(
      title: '体重',
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: onAddWeight,
      ),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    currentWeight?.toStringAsFixed(1) ?? '--',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '公斤',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
              if (weightDelta != null) ...[
                const SizedBox(height: 4),
                _buildDelta(context),
              ],
            ],
          ),
          Icon(
            Icons.chevron_right,
            color: theme.colorScheme.outline,
          ),
        ],
      ),
    );
  }

  Widget _buildDelta(BuildContext context) {
    final theme = Theme.of(context);
    final delta = weightDelta!;
    final isPositive = delta > 0;
    final isNegative = delta < 0;

    Color color;
    IconData icon;
    if (isPositive) {
      color = Colors.red;
      icon = Icons.arrow_upward;
    } else if (isNegative) {
      color = Colors.green;
      icon = Icons.arrow_downward;
    } else {
      color = theme.colorScheme.outline;
      icon = Icons.remove;
    }

    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 2),
        Text(
          '${delta.abs().toStringAsFixed(1)} kg',
          style: theme.textTheme.bodySmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          ' 较上次',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
