import 'package:flutter/material.dart';

import '../../../../shared/widgets/section_card.dart';
import '../../domain/today_summary.dart';
import 'calorie_ring.dart';
import 'meal_entry_row.dart';

class CalorieCard extends StatelessWidget {
  const CalorieCard({
    super.key,
    required this.calorieBudget,
    required this.mealCalories,
    required this.onMealTap,
  });

  final CalorieBudget calorieBudget;
  final Map<String, int> mealCalories;
  final void Function(String mealType) onMealTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionCard(
      title: '今日热量',
      child: Column(
        children: [
          CalorieRing(
            remaining: calorieBudget.remaining,
            total: calorieBudget.burned,
            intake: calorieBudget.intake,
            isOverBudget: calorieBudget.isOverBudget,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalorieItem(
                context,
                label: '消耗',
                value: calorieBudget.burned,
                icon: Icons.local_fire_department,
                color: Colors.orange,
              ),
              _buildCalorieItem(
                context,
                label: '饮食',
                value: calorieBudget.intake,
                icon: Icons.restaurant,
                color: theme.colorScheme.primary,
              ),
              _buildCalorieItem(
                context,
                label: '缺口',
                value: calorieBudget.deficit,
                icon: Icons.trending_down,
                color: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          MealEntryRow(
            mealCalories: mealCalories,
            onMealTap: onMealTap,
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieItem(
    BuildContext context, {
    required String label,
    required int value,
    required IconData icon,
    required Color color,
  }) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          '$value',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.outline,
          ),
        ),
      ],
    );
  }
}
