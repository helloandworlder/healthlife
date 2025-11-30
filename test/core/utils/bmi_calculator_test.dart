import 'package:flutter_test/flutter_test.dart';
import 'package:healthlife/core/theme/app_colors.dart';
import 'package:healthlife/core/utils/bmi_calculator.dart';

void main() {
  group('BMICalculator', () {
    group('calculateBMI', () {
      test('标准体重 BMI 计算正确', () {
        // 70kg / (1.75m)^2 = 70 / 3.0625 = 22.86
        final bmi = BMICalculator.calculateBMI(weightKg: 70, heightCm: 175);
        expect(bmi, closeTo(22.86, 0.01));
      });

      test('偏瘦 BMI 计算正确', () {
        // 50kg / (1.75m)^2 = 50 / 3.0625 = 16.33
        final bmi = BMICalculator.calculateBMI(weightKg: 50, heightCm: 175);
        expect(bmi, closeTo(16.33, 0.01));
      });

      test('偏胖 BMI 计算正确', () {
        // 85kg / (1.75m)^2 = 85 / 3.0625 = 27.76
        final bmi = BMICalculator.calculateBMI(weightKg: 85, heightCm: 175);
        expect(bmi, closeTo(27.76, 0.01));
      });

      test('肥胖 BMI 计算正确', () {
        // 100kg / (1.75m)^2 = 100 / 3.0625 = 32.65
        final bmi = BMICalculator.calculateBMI(weightKg: 100, heightCm: 175);
        expect(bmi, closeTo(32.65, 0.01));
      });
    });

    group('getBMICategoryEnum', () {
      test('BMI < 18.5 返回 underweight', () {
        expect(BMICalculator.getBMICategoryEnum(16), equals(BMICategory.underweight));
        expect(BMICalculator.getBMICategoryEnum(18.4), equals(BMICategory.underweight));
      });

      test('18.5 <= BMI < 24 返回 normal', () {
        expect(BMICalculator.getBMICategoryEnum(18.5), equals(BMICategory.normal));
        expect(BMICalculator.getBMICategoryEnum(22), equals(BMICategory.normal));
        expect(BMICalculator.getBMICategoryEnum(23.9), equals(BMICategory.normal));
      });

      test('24 <= BMI < 28 返回 overweight', () {
        expect(BMICalculator.getBMICategoryEnum(24), equals(BMICategory.overweight));
        expect(BMICalculator.getBMICategoryEnum(26), equals(BMICategory.overweight));
        expect(BMICalculator.getBMICategoryEnum(27.9), equals(BMICategory.overweight));
      });

      test('BMI >= 28 返回 obese', () {
        expect(BMICalculator.getBMICategoryEnum(28), equals(BMICategory.obese));
        expect(BMICalculator.getBMICategoryEnum(35), equals(BMICategory.obese));
      });
    });

    group('getBMICategory', () {
      test('返回正确的分类名称', () {
        expect(BMICalculator.getBMICategory(16), equals('偏瘦'));
        expect(BMICalculator.getBMICategory(22), equals('正常'));
        expect(BMICalculator.getBMICategory(26), equals('偏胖'));
        expect(BMICalculator.getBMICategory(30), equals('肥胖'));
      });
    });

    group('getBMICategoryColor', () {
      test('返回正确的分类颜色', () {
        expect(BMICalculator.getBMICategoryColor(16), equals(AppColors.info));
        expect(BMICalculator.getBMICategoryColor(22), equals(AppColors.success));
        expect(BMICalculator.getBMICategoryColor(26), equals(AppColors.warning));
        expect(BMICalculator.getBMICategoryColor(30), equals(AppColors.error));
      });
    });

    group('getHealthyWeightRange', () {
      test('175cm 身高的健康体重范围', () {
        // min: 18.5 * 1.75^2 = 56.66, max: 24 * 1.75^2 = 73.5
        final (min, max) = BMICalculator.getHealthyWeightRange(175);
        expect(min, closeTo(56.66, 0.1));
        expect(max, closeTo(73.5, 0.1));
      });

      test('160cm 身高的健康体重范围', () {
        // min: 18.5 * 1.6^2 = 47.36, max: 24 * 1.6^2 = 61.44
        final (min, max) = BMICalculator.getHealthyWeightRange(160);
        expect(min, closeTo(47.36, 0.1));
        expect(max, closeTo(61.44, 0.1));
      });
    });

    group('getIdealWeight', () {
      test('175cm 身高的理想体重', () {
        // 22 * 1.75^2 = 67.375
        final ideal = BMICalculator.getIdealWeight(175);
        expect(ideal, closeTo(67.375, 0.01));
      });

      test('160cm 身高的理想体重', () {
        // 22 * 1.6^2 = 56.32
        final ideal = BMICalculator.getIdealWeight(160);
        expect(ideal, closeTo(56.32, 0.01));
      });
    });

    group('单位转换', () {
      test('kgToLb - 公斤转磅', () {
        // 1 kg = 2.20462 lb
        expect(BMICalculator.kgToLb(1), closeTo(2.20462, 0.0001));
        expect(BMICalculator.kgToLb(70), closeTo(154.324, 0.01));
      });

      test('lbToKg - 磅转公斤', () {
        // 1 lb = 0.4536 kg
        expect(BMICalculator.lbToKg(1), closeTo(0.4536, 0.001));
        expect(BMICalculator.lbToKg(154), closeTo(69.85, 0.1));
      });

      test('cmToInch - 厘米转英寸', () {
        // 1 cm = 0.3937 inch
        expect(BMICalculator.cmToInch(1), closeTo(0.3937, 0.001));
        expect(BMICalculator.cmToInch(175), closeTo(68.9, 0.1));
      });

      test('inchToCm - 英寸转厘米', () {
        // 1 inch = 2.54 cm
        expect(BMICalculator.inchToCm(1), equals(2.54));
        expect(BMICalculator.inchToCm(69), closeTo(175.26, 0.1));
      });

      test('单位转换可逆', () {
        const original = 70.0;
        final converted = BMICalculator.lbToKg(BMICalculator.kgToLb(original));
        expect(converted, closeTo(original, 0.01));
      });
    });

    group('BMICategory enum', () {
      test('displayName 返回正确中文', () {
        expect(BMICategory.underweight.displayName, equals('偏瘦'));
        expect(BMICategory.normal.displayName, equals('正常'));
        expect(BMICategory.overweight.displayName, equals('偏胖'));
        expect(BMICategory.obese.displayName, equals('肥胖'));
      });

      test('description 返回正确范围说明', () {
        expect(BMICategory.underweight.description, equals('BMI < 18.5'));
        expect(BMICategory.normal.description, equals('18.5 ≤ BMI < 24'));
        expect(BMICategory.overweight.description, equals('24 ≤ BMI < 28'));
        expect(BMICategory.obese.description, equals('BMI ≥ 28'));
      });

      test('advice 返回健康建议', () {
        expect(BMICategory.underweight.advice, contains('增加'));
        expect(BMICategory.normal.advice, contains('保持'));
        expect(BMICategory.overweight.advice, contains('控制'));
        expect(BMICategory.obese.advice, contains('医生'));
      });
    });
  });
}
