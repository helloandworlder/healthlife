import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/chat_message.dart';

class QuickActionsRow extends StatelessWidget {
  final void Function(QuickAction action) onAction;

  const QuickActionsRow({super.key, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: quickActions.map((action) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _QuickActionChip(
                action: action,
                onTap: () => onAction(action),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  final QuickAction action;
  final VoidCallback onTap;

  const _QuickActionChip({
    required this.action,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getIcon(action.id),
                size: 16,
                color: AppColors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                action.label,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon(String id) {
    switch (id) {
      case 'diet_analysis':
        return Icons.restaurant_outlined;
      case 'weekly_goal':
        return Icons.flag_outlined;
      case 'sleep_advice':
        return Icons.bedtime_outlined;
      case 'exercise_plan':
        return Icons.fitness_center_outlined;
      default:
        return Icons.chat_outlined;
    }
  }
}
