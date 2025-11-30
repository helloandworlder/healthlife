import 'package:flutter_test/flutter_test.dart';
import 'package:healthlife/core/constants/health_types.dart';
import 'package:healthlife/core/utils/calorie_calculator.dart';

void main() {
  group('CalorieCalculator', () {
    group('calculateBMR', () {
      test('男性 BMR 计算正确 - 标准体重', () {
        // Harris-Benedict 公式: 88.362 + (13.397 * 70) + (4.799 * 175) - (5.677 * 30)
        // = 88.362 + 937.79 + 839.825 - 170.31 = 1695.667
        final bmr = CalorieCalculator.calculateBMR(
          gender: Gender.male,
          weightKg: 70,
          heightCm: 175,
          age: 30,
        );
        expect(bmr, closeTo(1695.67, 0.1));
      });

      test('女性 BMR 计算正确 - 标准体重', () {
        // Harris-Benedict 公式: 447.593 + (9.247 * 55) + (3.098 * 160) - (4.330 * 25)
        // = 447.593 + 508.585 + 495.68 - 108.25 = 1343.608
        final bmr = CalorieCalculator.calculateBMR(
          gender: Gender.female,
          weightKg: 55,
          heightCm: 160,
          age: 25,
        );
        expect(bmr, closeTo(1343.61, 0.1));
      });

      test('年龄对 BMR 的影响 - 同体重年龄增加 BMR 降低', () {
        final bmr30 = CalorieCalculator.calculateBMR(
          gender: Gender.male,
          weightKg: 70,
          heightCm: 175,
          age: 30,
        );
        final bmr50 = CalorieCalculator.calculateBMR(
          gender: Gender.male,
          weightKg: 70,
          heightCm: 175,
          age: 50,
        );
        expect(bmr50, lessThan(bmr30));
        // 年龄差20岁，BMR差约 20 * 5.677 = 113.54
        expect(bmr30 - bmr50, closeTo(113.54, 0.1));
      });

      test('体重对 BMR 的影响 - 体重增加 BMR 增加', () {
        final bmr60 = CalorieCalculator.calculateBMR(
          gender: Gender.male,
          weightKg: 60,
          heightCm: 175,
          age: 30,
        );
        final bmr80 = CalorieCalculator.calculateBMR(
          gender: Gender.male,
          weightKg: 80,
          heightCm: 175,
          age: 30,
        );
        expect(bmr80, greaterThan(bmr60));
        // 体重差20kg，BMR差约 20 * 13.397 = 267.94
        expect(bmr80 - bmr60, closeTo(267.94, 0.1));
      });
    });

    group('calculateTDEE', () {
      test('久坐活动水平 TDEE 计算正确', () {
        const bmr = 1700.0;
        final tdee = CalorieCalculator.calculateTDEE(bmr, UserActivityLevel.sedentary);
        expect(tdee, closeTo(bmr * 1.2, 0.1));
      });

      test('轻度活动 TDEE 计算正确', () {
        const bmr = 1700.0;
        final tdee = CalorieCalculator.calculateTDEE(bmr, UserActivityLevel.light);
        expect(tdee, closeTo(bmr * 1.375, 0.1));
      });

      test('中度活动 TDEE 计算正确', () {
        const bmr = 1700.0;
        final tdee = CalorieCalculator.calculateTDEE(bmr, UserActivityLevel.moderate);
        expect(tdee, closeTo(bmr * 1.55, 0.1));
      });

      test('高强度活动 TDEE 计算正确', () {
        const bmr = 1700.0;
        final tdee = CalorieCalculator.calculateTDEE(bmr, UserActivityLevel.active);
        expect(tdee, closeTo(bmr * 1.725, 0.1));
      });
    });

    group('calculateTDEEFromProfile', () {
      test('完整 profile 计算 TDEE', () {
        final tdee = CalorieCalculator.calculateTDEEFromProfile(
          gender: Gender.male,
          weightKg: 70,
          heightCm: 175,
          age: 30,
          activityLevel: UserActivityLevel.moderate,
        );
        // BMR ≈ 1695.67, TDEE = BMR * 1.55 ≈ 2628.29
        expect(tdee, closeTo(2628.29, 1));
      });
    });

    group('calculateRemainingCalories', () {
      test('正常情况下剩余热量计算正确', () {
        final remaining = CalorieCalculator.calculateRemainingCalories(
          caloriesBurned: 2000,
          caloriesIntake: 1000,
          deficitTarget: 500,
        );
        // 2000 - 1000 - 500 = 500
        expect(remaining, equals(500));
      });

      test('摄入超标时剩余热量为0', () {
        final remaining = CalorieCalculator.calculateRemainingCalories(
          caloriesBurned: 2000,
          caloriesIntake: 2500,
          deficitTarget: 500,
        );
        // 2000 - 2500 - 500 = -1000, 但返回0
        expect(remaining, equals(0));
      });

      test('零缺口目标', () {
        final remaining = CalorieCalculator.calculateRemainingCalories(
          caloriesBurned: 2000,
          caloriesIntake: 1000,
          deficitTarget: 0,
        );
        expect(remaining, equals(1000));
      });
    });

    group('calculateCalorieBalance', () {
      test('热量盈余 (摄入>消耗)', () {
        final balance = CalorieCalculator.calculateCalorieBalance(
          caloriesBurned: 2000,
          caloriesIntake: 2500,
        );
        expect(balance, equals(500));
      });

      test('热量亏损 (摄入<消耗)', () {
        final balance = CalorieCalculator.calculateCalorieBalance(
          caloriesBurned: 2000,
          caloriesIntake: 1500,
        );
        expect(balance, equals(-500));
      });

      test('热量平衡', () {
        final balance = CalorieCalculator.calculateCalorieBalance(
          caloriesBurned: 2000,
          caloriesIntake: 2000,
        );
        expect(balance, equals(0));
      });
    });

    group('estimateWeeklyWeightLoss', () {
      test('每日500卡缺口预估每周减重', () {
        // 500 * 7 / 7700 ≈ 0.4545 kg
        final weightLoss = CalorieCalculator.estimateWeeklyWeightLoss(500);
        expect(weightLoss, closeTo(0.4545, 0.001));
      });

      test('每日1000卡缺口预估每周减重', () {
        // 1000 * 7 / 7700 ≈ 0.909 kg
        final weightLoss = CalorieCalculator.estimateWeeklyWeightLoss(1000);
        expect(weightLoss, closeTo(0.909, 0.001));
      });

      test('零缺口无减重', () {
        final weightLoss = CalorieCalculator.estimateWeeklyWeightLoss(0);
        expect(weightLoss, equals(0));
      });
    });

    group('estimateDaysToGoal', () {
      test('正常减重计划天数计算', () {
        // 需减5kg, 每日缺口500卡
        // 5 * 7700 / 500 = 77天
        final days = CalorieCalculator.estimateDaysToGoal(
          currentWeight: 75,
          targetWeight: 70,
          dailyDeficit: 500,
        );
        expect(days, equals(77));
      });

      test('已达标返回0', () {
        final days = CalorieCalculator.estimateDaysToGoal(
          currentWeight: 70,
          targetWeight: 75,
          dailyDeficit: 500,
        );
        expect(days, equals(0));
      });

      test('零或负缺口返回-1', () {
        final days = CalorieCalculator.estimateDaysToGoal(
          currentWeight: 75,
          targetWeight: 70,
          dailyDeficit: 0,
        );
        expect(days, equals(-1));
      });
    });

    group('suggestDailyDeficit', () {
      test('30天减5kg建议缺口', () {
        // 5 * 7700 / 30 ≈ 1283, 但限制在1000
        final deficit = CalorieCalculator.suggestDailyDeficit(
          currentWeight: 75,
          targetWeight: 70,
          durationDays: 30,
        );
        expect(deficit, equals(1000));
      });

      test('90天减5kg建议缺口', () {
        // 5 * 7700 / 90 ≈ 428
        final deficit = CalorieCalculator.suggestDailyDeficit(
          currentWeight: 75,
          targetWeight: 70,
          durationDays: 90,
        );
        expect(deficit, closeTo(428, 1));
      });

      test('超长期计划限制最小缺口', () {
        // 5 * 7700 / 365 ≈ 105, 但限制在250
        final deficit = CalorieCalculator.suggestDailyDeficit(
          currentWeight: 75,
          targetWeight: 70,
          durationDays: 365,
        );
        expect(deficit, equals(250));
      });

      test('已达标返回0', () {
        final deficit = CalorieCalculator.suggestDailyDeficit(
          currentWeight: 70,
          targetWeight: 75,
          durationDays: 30,
        );
        expect(deficit, equals(0));
      });

      test('零天数返回默认500', () {
        final deficit = CalorieCalculator.suggestDailyDeficit(
          currentWeight: 75,
          targetWeight: 70,
          durationDays: 0,
        );
        expect(deficit, equals(500));
      });
    });
  });
}
