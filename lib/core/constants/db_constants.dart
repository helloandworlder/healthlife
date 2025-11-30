class DbConstants {
  DbConstants._();

  static const String databaseName = 'healthlife.db';
  static const int schemaVersion = 2;

  // Setting Keys
  static const String keyWeightUnit = 'weight_unit';
  static const String keyHeightUnit = 'height_unit';
  static const String keyLanguage = 'language';
  static const String keyThemeMode = 'theme_mode';
  static const String keyNotificationsEnabled = 'notifications_enabled';
  static const String keyOnboardingCompleted = 'onboarding_completed';
  static const String keyHealthSource = 'health_source';
  
  // AI Settings Keys
  static const String keyAiEndpoint = 'ai_endpoint';
  static const String keyAiApiKey = 'ai_api_key';
  static const String keyAiModel = 'ai_model';
  
  // AI Default Values
  static const String defaultAiEndpoint = 'https://api.openai.com/v1';
  static const String defaultAiModel = 'gpt-4o-mini';

  // Setting Values
  static const String unitKg = 'kg';
  static const String unitLb = 'lb';
  static const String unitCm = 'cm';
  static const String unitInch = 'inch';
  static const String langZh = 'zh';
  static const String langEn = 'en';
  static const String themeLight = 'light';
  static const String themeDark = 'dark';
  static const String themeSystem = 'system';
  static const String healthSourceApple = 'apple_health';
  static const String healthSourceConnect = 'health_connect';
  static const String healthSourceNone = 'none';

  // Activity Levels
  static const String activitySedentary = 'sedentary';
  static const String activityLight = 'light';
  static const String activityModerate = 'moderate';
  static const String activityActive = 'active';

  // Meal Types
  static const String mealBreakfast = 'breakfast';
  static const String mealLunch = 'lunch';
  static const String mealDinner = 'dinner';
  static const String mealSnack = 'snack';

  // Goal Periods
  static const String periodDaily = 'daily';
  static const String periodWeekly = 'weekly';

  // Data Sources
  static const String sourceManual = 'manual';
  static const String sourceAppleHealth = 'apple_health';
  static const String sourceHealthConnect = 'health_connect';
}
