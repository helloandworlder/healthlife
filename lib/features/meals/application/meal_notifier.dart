import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../shared/db/app_database.dart';

part 'meal_notifier.g.dart';

@riverpod
class MealNotifier extends _$MealNotifier {
  @override
  Future<MealState> build() async {
    final db = ref.watch(databaseProvider);
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final meals = await db.mealDao.getMealsForDate(todayDate);
    final grouped = await db.mealDao.getMealsGroupedByType(todayDate);
    final totalCalories = await db.mealDao.getTotalCaloriesForDate(todayDate);

    final caloriesByType = <String, int>{};
    for (final entry in grouped.entries) {
      caloriesByType[entry.key] = entry.value.fold(0, (sum, m) => sum + m.calories);
    }

    return MealState(
      meals: meals,
      mealsByType: grouped,
      totalCalories: totalCalories,
      caloriesByType: caloriesByType,
    );
  }

  Future<void> addMeal({
    required String mealType,
    required String foodName,
    required int calories,
    String? note,
  }) async {
    final db = ref.read(databaseProvider);
    await db.mealDao.insertMeal(
      mealType: mealType,
      foodName: foodName,
      calories: calories,
      note: note,
    );
    ref.invalidateSelf();
  }

  Future<void> deleteMeal(int id) async {
    final db = ref.read(databaseProvider);
    await db.mealDao.deleteMeal(id);
    ref.invalidateSelf();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

class MealState {
  const MealState({
    required this.meals,
    required this.mealsByType,
    required this.totalCalories,
    required this.caloriesByType,
  });

  final List<MealLog> meals;
  final Map<String, List<MealLog>> mealsByType;
  final int totalCalories;
  final Map<String, int> caloriesByType;

  int getCaloriesForType(String mealType) => caloriesByType[mealType] ?? 0;
}

@riverpod
Future<int> mealCaloriesForType(Ref ref, String mealType) async {
  final db = ref.watch(databaseProvider);
  final today = DateTime.now();
  return db.mealDao.getCaloriesByMealType(
    DateTime(today.year, today.month, today.day),
    mealType,
  );
}
