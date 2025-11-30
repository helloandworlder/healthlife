class RouteNames {
  RouteNames._();

  // Onboarding
  static const String onboarding = 'onboarding';

  // Main Tabs
  static const String dashboard = 'dashboard';
  static const String activity = 'activity';
  static const String goals = 'goals';
  static const String settings = 'settings';

  // Dashboard Sub-routes
  static const String createPlan = 'createPlan';
  static const String weightHistory = 'weightHistory';
  static const String addMeal = 'addMeal';

  // Activity Sub-routes
  static const String dayDetail = 'dayDetail';

  // Goals Sub-routes
  static const String createGoal = 'createGoal';
  static const String editGoal = 'editGoal';
  static const String goalReview = 'goalReview';

  // Settings Sub-routes
  static const String profile = 'profile';
  static const String healthSource = 'healthSource';

  // Standalone Pages
  static const String petDetail = 'petDetail';
  static const String weeklyReview = 'weeklyReview';
  static const String chat = 'chat';
}

class RoutePaths {
  RoutePaths._();

  // Root paths
  static const String onboarding = '/onboarding';
  static const String dashboard = '/';
  static const String activity = '/activity';
  static const String goals = '/goals';
  static const String settings = '/settings';

  // Dashboard sub-paths
  static const String createPlan = 'plan/create';
  static const String weightHistory = 'weight/history';
  static const String addMeal = 'meals/:mealType';

  // Activity sub-paths
  static const String dayDetail = 'day/:date';

  // Goals sub-paths
  static const String createGoal = 'create';
  static const String editGoal = ':id/edit';
  static const String goalReview = 'review';

  // Settings sub-paths
  static const String profile = 'profile';
  static const String healthSource = 'health-source';

  // Standalone paths
  static const String petDetail = '/pet';
  static const String weeklyReview = '/weekly-review';
  static const String chat = '/chat';
}
