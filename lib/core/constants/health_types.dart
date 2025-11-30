enum HealthMetricType {
  steps,
  activeMinutes,
  caloriesBurned,
  sleepHours,
  heartRate,
  hrv,
  weight,
}

enum ActivityLevel {
  none,
  light,
  moderate,
  high,
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack;

  String get displayName {
    switch (this) {
      case MealType.breakfast:
        return '早餐';
      case MealType.lunch:
        return '午餐';
      case MealType.dinner:
        return '晚餐';
      case MealType.snack:
        return '加餐';
    }
  }

  String get icon {
    switch (this) {
      case MealType.breakfast:
        return '🌅';
      case MealType.lunch:
        return '☀️';
      case MealType.dinner:
        return '🌙';
      case MealType.snack:
        return '🍎';
    }
  }
}

enum GoalPeriod {
  daily,
  weekly;

  String get displayName {
    switch (this) {
      case GoalPeriod.daily:
        return '每日';
      case GoalPeriod.weekly:
        return '每周';
    }
  }
}

enum UserActivityLevel {
  sedentary,
  light,
  moderate,
  active;

  String get displayName {
    switch (this) {
      case UserActivityLevel.sedentary:
        return '久坐';
      case UserActivityLevel.light:
        return '轻度活动';
      case UserActivityLevel.moderate:
        return '中度活动';
      case UserActivityLevel.active:
        return '高度活动';
    }
  }

  String get description {
    switch (this) {
      case UserActivityLevel.sedentary:
        return '办公室工作，很少运动';
      case UserActivityLevel.light:
        return '每周运动1-3次';
      case UserActivityLevel.moderate:
        return '每周运动3-5次';
      case UserActivityLevel.active:
        return '每天运动或体力劳动';
    }
  }

  double get multiplier {
    switch (this) {
      case UserActivityLevel.sedentary:
        return 1.2;
      case UserActivityLevel.light:
        return 1.375;
      case UserActivityLevel.moderate:
        return 1.55;
      case UserActivityLevel.active:
        return 1.725;
    }
  }
}

enum Gender {
  male,
  female;

  String get displayName {
    switch (this) {
      case Gender.male:
        return '男';
      case Gender.female:
        return '女';
    }
  }
}
