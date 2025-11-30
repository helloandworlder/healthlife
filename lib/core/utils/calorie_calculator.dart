import 'dart:math';
import '../constants/health_types.dart';

class CalorieCalculator {
  CalorieCalculator._();

  /// Harris-Benedict 公式计算 BMR（基础代谢率）
  /// [gender] 性别
  /// [weightKg] 体重（公斤）
  /// [heightCm] 身高（厘米）
  /// [age] 年龄
  static double calculateBMR({
    required Gender gender,
    required double weightKg,
    required double heightCm,
    required int age,
  }) {
    if (gender == Gender.male) {
      return 88.362 + (13.397 * weightKg) + (4.799 * heightCm) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weightKg) + (3.098 * heightCm) - (4.330 * age);
    }
  }

  /// 计算 TDEE（每日总消耗热量）
  static double calculateTDEE(double bmr, UserActivityLevel activityLevel) {
    return bmr * activityLevel.multiplier;
  }

  /// 根据用户信息直接计算 TDEE
  static double calculateTDEEFromProfile({
    required Gender gender,
    required double weightKg,
    required double heightCm,
    required int age,
    required UserActivityLevel activityLevel,
  }) {
    final bmr = calculateBMR(
      gender: gender,
      weightKg: weightKg,
      heightCm: heightCm,
      age: age,
    );
    return calculateTDEE(bmr, activityLevel);
  }

  /// 计算剩余可摄入热量
  /// [caloriesBurned] 今日消耗热量（来自健康数据或预估TDEE）
  /// [caloriesIntake] 今日已摄入热量
  /// [deficitTarget] 每日热量缺口目标
  static int calculateRemainingCalories({
    required int caloriesBurned,
    required int caloriesIntake,
    required int deficitTarget,
  }) {
    final remaining = caloriesBurned - caloriesIntake - deficitTarget;
    return max(0, remaining);
  }

  /// 计算热量盈余/亏损
  static int calculateCalorieBalance({
    required int caloriesBurned,
    required int caloriesIntake,
  }) {
    return caloriesIntake - caloriesBurned;
  }

  /// 预估每周减重量（公斤）
  /// 7700 kcal ≈ 1 kg 脂肪
  static double estimateWeeklyWeightLoss(int dailyDeficit) {
    return (dailyDeficit * 7) / 7700.0;
  }

  /// 计算达到目标体重所需天数
  static int estimateDaysToGoal({
    required double currentWeight,
    required double targetWeight,
    required int dailyDeficit,
  }) {
    if (dailyDeficit <= 0) return -1;
    final weightToLose = currentWeight - targetWeight;
    if (weightToLose <= 0) return 0;
    final caloriesNeeded = weightToLose * 7700;
    return (caloriesNeeded / dailyDeficit).ceil();
  }

  /// 计算健康的每日热量缺口建议（250-1000 kcal）
  static int suggestDailyDeficit({
    required double currentWeight,
    required double targetWeight,
    required int durationDays,
  }) {
    if (durationDays <= 0) return 500;
    final weightToLose = currentWeight - targetWeight;
    if (weightToLose <= 0) return 0;
    final dailyDeficit = (weightToLose * 7700 / durationDays).round();
    // 限制在健康范围内
    return dailyDeficit.clamp(250, 1000);
  }
}
