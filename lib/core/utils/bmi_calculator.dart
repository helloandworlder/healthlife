import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BMICalculator {
  BMICalculator._();

  /// 计算 BMI
  /// [weightKg] 体重（公斤）
  /// [heightCm] 身高（厘米）
  static double calculateBMI({
    required double weightKg,
    required double heightCm,
  }) {
    final heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  /// 获取 BMI 分类枚举
  static BMICategory getBMICategoryEnum(double bmi) {
    if (bmi < 18.5) return BMICategory.underweight;
    if (bmi < 24) return BMICategory.normal;
    if (bmi < 28) return BMICategory.overweight;
    return BMICategory.obese;
  }

  /// 获取 BMI 分类名称
  static String getBMICategory(double bmi) {
    return getBMICategoryEnum(bmi).displayName;
  }

  /// 获取 BMI 分类颜色
  static Color getBMICategoryColor(double bmi) {
    final category = getBMICategoryEnum(bmi);
    switch (category) {
      case BMICategory.underweight:
        return AppColors.info;
      case BMICategory.normal:
        return AppColors.success;
      case BMICategory.overweight:
        return AppColors.warning;
      case BMICategory.obese:
        return AppColors.error;
    }
  }

  /// 计算健康体重范围
  static (double min, double max) getHealthyWeightRange(double heightCm) {
    final heightM = heightCm / 100;
    final minWeight = 18.5 * heightM * heightM;
    final maxWeight = 24 * heightM * heightM;
    return (minWeight, maxWeight);
  }

  /// 计算理想体重（基于 BMI 22）
  static double getIdealWeight(double heightCm) {
    final heightM = heightCm / 100;
    return 22 * heightM * heightM;
  }

  /// 公斤转磅
  static double kgToLb(double kg) => kg * 2.20462;

  /// 磅转公斤
  static double lbToKg(double lb) => lb / 2.20462;

  /// 厘米转英寸
  static double cmToInch(double cm) => cm / 2.54;

  /// 英寸转厘米
  static double inchToCm(double inch) => inch * 2.54;
}

enum BMICategory {
  underweight,
  normal,
  overweight,
  obese;

  String get displayName {
    switch (this) {
      case BMICategory.underweight:
        return '偏瘦';
      case BMICategory.normal:
        return '正常';
      case BMICategory.overweight:
        return '偏胖';
      case BMICategory.obese:
        return '肥胖';
    }
  }

  String get description {
    switch (this) {
      case BMICategory.underweight:
        return 'BMI < 18.5';
      case BMICategory.normal:
        return '18.5 ≤ BMI < 24';
      case BMICategory.overweight:
        return '24 ≤ BMI < 28';
      case BMICategory.obese:
        return 'BMI ≥ 28';
    }
  }

  String get advice {
    switch (this) {
      case BMICategory.underweight:
        return '建议适当增加营养摄入';
      case BMICategory.normal:
        return '继续保持健康的生活方式';
      case BMICategory.overweight:
        return '建议适当控制饮食，增加运动';
      case BMICategory.obese:
        return '建议咨询医生，制定减重计划';
    }
  }
}
