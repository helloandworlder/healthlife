import 'package:flutter/material.dart';

class MealEntryRow extends StatelessWidget {
  const MealEntryRow({
    super.key,
    required this.mealCalories,
    required this.onMealTap,
  });

  final Map<String, int> mealCalories;
  final void Function(String mealType) onMealTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _MealButton(
          label: '早餐',
          emoji: '🌅',
          calories: mealCalories['breakfast'] ?? 0,
          onTap: () => onMealTap('breakfast'),
        ),
        _MealButton(
          label: '午餐',
          emoji: '☀️',
          calories: mealCalories['lunch'] ?? 0,
          onTap: () => onMealTap('lunch'),
        ),
        _MealButton(
          label: '晚餐',
          emoji: '🌙',
          calories: mealCalories['dinner'] ?? 0,
          onTap: () => onMealTap('dinner'),
        ),
        _MealButton(
          label: '加餐',
          emoji: '🍎',
          calories: mealCalories['snack'] ?? 0,
          onTap: () => onMealTap('snack'),
        ),
      ],
    );
  }
}

class _MealButton extends StatelessWidget {
  const _MealButton({
    required this.label,
    required this.emoji,
    required this.calories,
    required this.onTap,
  });

  final String label;
  final String emoji;
  final int calories;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall,
            ),
            Text(
              calories > 0 ? '$calories' : '+',
              style: theme.textTheme.labelSmall?.copyWith(
                color: calories > 0
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline,
                fontWeight: calories > 0 ? FontWeight.bold : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
