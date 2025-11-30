import 'package:drift/drift.dart';

@DataClassName('WeeklySummary')
class WeeklySummaries extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get weekStart => dateTime()();
  RealColumn get avgSleepHours => real()();
  IntColumn get avgHrv => integer().nullable()();
  IntColumn get totalSteps => integer()();
  IntColumn get totalCaloriesBurned => integer()();
  IntColumn get exerciseMinutes => integer()();
  IntColumn get waterDays => integer()();
  IntColumn get goalCompletionRate => integer()();
  TextColumn get title => text()();
  DateTimeColumn get generatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [{weekStart}];
}
