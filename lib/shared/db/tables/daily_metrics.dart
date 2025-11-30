import 'package:drift/drift.dart';

@DataClassName('DailyMetric')
@TableIndex(name: 'idx_daily_metrics_date', columns: {#date})
class DailyMetrics extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get steps => integer().withDefault(const Constant(0))();
  IntColumn get activeMinutes => integer().withDefault(const Constant(0))();
  IntColumn get caloriesBurned => integer().withDefault(const Constant(0))();
  RealColumn get sleepHours => real().withDefault(const Constant(0))();
  IntColumn get avgHeartRate => integer().nullable()();
  IntColumn get hrv => integer().nullable()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [{date}];
}
