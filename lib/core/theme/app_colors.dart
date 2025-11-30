import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryLight = Color(0xFF81C784);
  static const Color primaryDark = Color(0xFF388E3C);

  // Secondary Colors
  static const Color secondary = Color(0xFF03A9F4);
  static const Color secondaryLight = Color(0xFF4FC3F7);
  static const Color secondaryDark = Color(0xFF0288D1);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text Colors
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Activity Level Colors (热力图)
  static const Color activityNone = Color(0xFFE0E0E0);
  static const Color activityLight = Color(0xFFC8E6C9);
  static const Color activityModerate = Color(0xFF81C784);
  static const Color activityHigh = Color(0xFF388E3C);

  // Meal Type Colors
  static const Color breakfast = Color(0xFFFFB74D);
  static const Color lunch = Color(0xFF4DB6AC);
  static const Color dinner = Color(0xFF7986CB);
  static const Color snack = Color(0xFFBA68C8);

  // Chart Colors
  static const Color chartBlue = Color(0xFF42A5F5);
  static const Color chartGreen = Color(0xFF66BB6A);
  static const Color chartOrange = Color(0xFFFFCA28);
  static const Color chartRed = Color(0xFFEF5350);

  // Adaptive Colors (Light mode defaults)
  static const Color textPrimary = textPrimaryLight;
  static const Color textSecondary = textSecondaryLight;
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color cardBackground = Color(0xFFF8F9FA);

  // Health Stats Colors
  static const Color sleep = Color(0xFF7C4DFF);
  static const Color heart = Color(0xFFE91E63);
  static const Color steps = Color(0xFF4CAF50);
  static const Color water = Color(0xFF03A9F4);
  static const Color calories = Color(0xFFFF5722);
  static const Color exercise = Color(0xFFFF9800);
}
