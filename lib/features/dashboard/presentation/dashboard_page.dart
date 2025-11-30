import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/route_names.dart';
import '../../../shared/widgets/loading_state.dart';
import '../../../shared/widgets/error_state.dart';
import '../../meals/application/meal_notifier.dart';
import '../../meals/presentation/add_meal_sheet.dart';
import '../../weight/presentation/add_weight_sheet.dart';
import '../application/dashboard_notifier.dart';
import 'widgets/calorie_card.dart';
import 'widgets/create_plan_sheet.dart';
import 'widgets/plan_overview_card.dart';
import 'widgets/weight_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardNotifierProvider);
    final mealAsync = ref.watch(mealNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('今天'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_outlined),
            onPressed: () {
              context.push(RoutePaths.chat);
            },
          ),
        ],
      ),
      body: dashboardAsync.when(
        loading: () => const LoadingState(),
        error: (error, stack) => ErrorState(
          message: '加载失败',
          onRetry: () => ref.invalidate(dashboardNotifierProvider),
        ),
        data: (state) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(dashboardNotifierProvider);
            ref.invalidate(mealNotifierProvider);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                PlanOverviewCard(
                  planProgress: state.planProgress,
                  onCreatePlan: () => _showCreatePlanSheet(context, ref, state),
                  onEndPlan: () => _confirmEndPlan(context, ref),
                ),
                mealAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (e, s) => const SizedBox.shrink(),
                  data: (mealState) => CalorieCard(
                    calorieBudget: state.todaySummary.calorieBudget,
                    mealCalories: mealState.caloriesByType,
                    onMealTap: (mealType) => _showAddMealSheet(context, ref, mealType),
                  ),
                ),
                WeightCard(
                  currentWeight: state.todaySummary.latestWeight,
                  weightDelta: state.todaySummary.weightDelta,
                  onAddWeight: () => _showAddWeightSheet(context, ref, state.todaySummary.latestWeight),
                  onTap: () => context.push(RoutePaths.weightHistory),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCreatePlanSheet(BuildContext context, WidgetRef ref, DashboardState state) {
    final notifier = ref.read(dashboardNotifierProvider.notifier);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) => CreatePlanSheet(
        initialWeight: state.todaySummary.latestWeight,
        onCreatePlan: ({
          required double initialWeight,
          required double targetWeight,
          required int durationDays,
          required int dailyCalorieDeficit,
        }) async {
          await notifier.createPlan(
            initialWeight: initialWeight,
            targetWeight: targetWeight,
            durationDays: durationDays,
            dailyCalorieDeficit: dailyCalorieDeficit,
          );
        },
      ),
    );
  }

  void _confirmEndPlan(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('结束计划'),
        content: const Text('确定要结束当前的减重计划吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(dashboardNotifierProvider.notifier).endCurrentPlan();
              Navigator.of(context).pop();
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  void _showAddMealSheet(BuildContext context, WidgetRef ref, String mealType) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddMealSheet(
        mealType: mealType,
        onAddMeal: ({
          required String mealType,
          required String foodName,
          required int calories,
          String? note,
        }) {
          ref.read(mealNotifierProvider.notifier).addMeal(
            mealType: mealType,
            foodName: foodName,
            calories: calories,
            note: note,
          );
          ref.invalidate(dashboardNotifierProvider);
        },
      ),
    );
  }

  void _showAddWeightSheet(BuildContext context, WidgetRef ref, double? currentWeight) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddWeightSheet(
        initialWeight: currentWeight,
        onAddWeight: (weight) {
          ref.read(dashboardNotifierProvider.notifier).logWeight(weight);
        },
      ),
    );
  }
}
