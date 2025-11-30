import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/utils/bmi_calculator.dart';

class WeightGauge extends StatelessWidget {
  const WeightGauge({
    super.key,
    required this.initialWeight,
    required this.currentWeight,
    required this.targetWeight,
    this.size = 200,
  });

  final double initialWeight;
  final double currentWeight;
  final double targetWeight;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = _calculateProgress();
    final bmi = BMICalculator.calculateBMI(weightKg: currentWeight, heightCm: 170);
    final bmiCategory = BMICalculator.getBMICategory(bmi);
    final bmiColor = BMICalculator.getBMICategoryColor(bmi);

    return SizedBox(
      width: size,
      height: size * 0.7,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size * 0.7),
            painter: _GaugePainter(
              progress: progress,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              progressColor: theme.colorScheme.primary,
            ),
          ),
          Positioned(
            bottom: size * 0.15,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currentWeight.toStringAsFixed(1),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  '公斤',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: bmiColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'BMI ${bmi.toStringAsFixed(1)} $bmiCategory',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: bmiColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: size * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  initialWeight.toStringAsFixed(1),
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '初始',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: size * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  targetWeight.toStringAsFixed(1),
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '目标',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _calculateProgress() {
    if (initialWeight <= targetWeight) return 1.0;
    final totalToLose = initialWeight - targetWeight;
    final lost = initialWeight - currentWeight;
    return (lost / totalToLose).clamp(0.0, 1.0);
  }
}

class _GaugePainter extends CustomPainter {
  _GaugePainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
  });

  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width * 0.4;
    const startAngle = math.pi * 0.8;
    const sweepAngle = math.pi * 1.4;
    const strokeWidth = 12.0;

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      bgPaint,
    );

    if (progress > 0) {
      final progressPaint = Paint()
        ..color = progressColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle * progress,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_GaugePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor;
  }
}
