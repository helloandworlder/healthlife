import 'package:flutter/material.dart';

enum ActivityLevel {
  none,
  light,
  moderate,
  high,
}

extension ActivityLevelExtension on ActivityLevel {
  Color get color {
    switch (this) {
      case ActivityLevel.none:
        return Colors.grey.shade300;
      case ActivityLevel.light:
        return Colors.green.shade200;
      case ActivityLevel.moderate:
        return Colors.green.shade400;
      case ActivityLevel.high:
        return Colors.green.shade700;
    }
  }

  String get label {
    switch (this) {
      case ActivityLevel.none:
        return '无活动';
      case ActivityLevel.light:
        return '轻度';
      case ActivityLevel.moderate:
        return '中度';
      case ActivityLevel.high:
        return '高强度';
    }
  }

  static ActivityLevel fromMetrics({
    required int steps,
    required int activeMinutes,
  }) {
    final stepsScore = steps / 10000;
    final minutesScore = activeMinutes / 60;
    final totalScore = stepsScore + minutesScore;

    if (totalScore < 0.3) return ActivityLevel.none;
    if (totalScore < 0.6) return ActivityLevel.light;
    if (totalScore < 1.0) return ActivityLevel.moderate;
    return ActivityLevel.high;
  }
}
