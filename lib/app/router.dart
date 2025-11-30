import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/route_names.dart';
import '../shared/widgets/main_shell.dart';
import '../features/onboarding/presentation/onboarding_page.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import '../features/activity_calendar/presentation/activity_calendar_page.dart';
import '../features/activity_calendar/presentation/day_detail_page.dart';
import '../features/goals/presentation/goals_page.dart';
import '../features/goals/presentation/goal_review_page.dart';
import '../features/settings/presentation/settings_page.dart';
import '../features/profile/presentation/profile_page.dart';
import '../features/health_source/presentation/health_source_page.dart';
import '../features/weight/presentation/weight_history_page.dart';
import '../features/gamification/presentation/pet_detail_page.dart';
import '../features/review/presentation/weekly_review_page.dart';
import '../features/chat_ai/presentation/chat_page.dart';
import 'providers.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RoutePaths.dashboard,
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isOnboarding = state.matchedLocation == RoutePaths.onboarding;
      final onboardingCompleted = await ref.read(onboardingCompletedProvider.future);

      if (!onboardingCompleted && !isOnboarding) {
        return RoutePaths.onboarding;
      }

      if (onboardingCompleted && isOnboarding) {
        return RoutePaths.dashboard;
      }

      return null;
    },
    routes: [
      // Onboarding
      GoRoute(
        path: RoutePaths.onboarding,
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),

      // Main Shell with Bottom Navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainShell(navigationShell: navigationShell),
        branches: [
          // Tab 1: 今天
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.dashboard,
                name: RouteNames.dashboard,
                builder: (context, state) => const DashboardPage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.weightHistory,
                    name: RouteNames.weightHistory,
                    builder: (context, state) => const WeightHistoryPage(),
                  ),
                ],
              ),
            ],
          ),

          // Tab 2: 行动
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.activity,
                name: RouteNames.activity,
                builder: (context, state) => const ActivityCalendarPage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.dayDetail,
                    name: RouteNames.dayDetail,
                    builder: (context, state) {
                      final dateStr = state.pathParameters['date'] ?? '';
                      final date = DateTime.tryParse(dateStr) ?? DateTime.now();
                      return DayDetailPage(date: date);
                    },
                  ),
                ],
              ),
            ],
          ),

          // Tab 3: 目标
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.goals,
                name: RouteNames.goals,
                builder: (context, state) => const GoalsPage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.goalReview,
                    name: RouteNames.goalReview,
                    builder: (context, state) => const GoalReviewPage(),
                  ),
                ],
              ),
            ],
          ),

          // Tab 4: 设置
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.settings,
                name: RouteNames.settings,
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    path: RoutePaths.profile,
                    name: RouteNames.profile,
                    builder: (context, state) => const ProfilePage(),
                  ),
                  GoRoute(
                    path: RoutePaths.healthSource,
                    name: RouteNames.healthSource,
                    builder: (context, state) => const HealthSourcePage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // Standalone pages
      GoRoute(
        path: RoutePaths.petDetail,
        name: RouteNames.petDetail,
        builder: (context, state) => const PetDetailPage(),
      ),
      GoRoute(
        path: RoutePaths.weeklyReview,
        name: RouteNames.weeklyReview,
        builder: (context, state) => const WeeklyReviewPage(),
      ),
      GoRoute(
        path: RoutePaths.chat,
        name: RouteNames.chat,
        builder: (context, state) => const ChatPage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('页面不存在: ${state.uri}'),
      ),
    ),
  );
});
