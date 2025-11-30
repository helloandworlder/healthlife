import 'package:drift/drift.dart';

@DataClassName('MealLog')
class MealLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get mealType => text()();
  TextColumn get foodName => text()();
  IntColumn get calories => integer()();
  DateTimeColumn get loggedAt => dateTime()();
  TextColumn get note => text().nullable()();
}
