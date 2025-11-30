import 'package:drift/drift.dart';

@DataClassName('Plan')
class Plans extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get initialWeight => real()();
  RealColumn get targetWeight => real()();
  IntColumn get durationDays => integer()();
  IntColumn get dailyCalorieDeficit => integer().withDefault(const Constant(500))();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
