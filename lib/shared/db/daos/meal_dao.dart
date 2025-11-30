import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/meal_logs.dart';

part 'meal_dao.g.dart';

@DriftAccessor(tables: [MealLogs])
class MealDao extends DatabaseAccessor<AppDatabase> with _$MealDaoMixin {
  MealDao(super.db);

  Future<List<MealLog>> getMealsForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(mealLogs)
          ..where((t) => t.loggedAt.isBiggerOrEqualValue(startOfDay) & t.loggedAt.isSmallerThanValue(endOfDay))
          ..orderBy([(t) => OrderingTerm.asc(t.loggedAt)]))
        .get();
  }

  Future<Map<String, List<MealLog>>> getMealsGroupedByType(DateTime date) async {
    final meals = await getMealsForDate(date);
    final grouped = <String, List<MealLog>>{};
    for (final meal in meals) {
      grouped.putIfAbsent(meal.mealType, () => []).add(meal);
    }
    return grouped;
  }

  Future<int> getTotalCaloriesForDate(DateTime date) async {
    final meals = await getMealsForDate(date);
    return meals.fold<int>(0, (sum, meal) => sum + meal.calories);
  }

  Future<int> insertMeal({
    required String mealType,
    required String foodName,
    required int calories,
    String? note,
  }) async {
    return into(mealLogs).insert(MealLogsCompanion.insert(
      mealType: mealType,
      foodName: foodName,
      calories: calories,
      loggedAt: DateTime.now(),
      note: Value(note),
    ));
  }

  Future<void> updateMeal({
    required int id,
    String? foodName,
    int? calories,
    String? note,
  }) async {
    await (update(mealLogs)..where((t) => t.id.equals(id))).write(
      MealLogsCompanion(
        foodName: foodName != null ? Value(foodName) : const Value.absent(),
        calories: calories != null ? Value(calories) : const Value.absent(),
        note: note != null ? Value(note) : const Value.absent(),
      ),
    );
  }

  Future<void> deleteMeal(int id) async {
    await (delete(mealLogs)..where((t) => t.id.equals(id))).go();
  }

  Future<int> getCaloriesByMealType(DateTime date, String mealType) async {
    final meals = await getMealsForDate(date);
    return meals.where((m) => m.mealType == mealType).fold<int>(0, (sum, meal) => sum + meal.calories);
  }
}
