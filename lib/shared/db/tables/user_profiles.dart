import 'package:drift/drift.dart';

@DataClassName('UserProfile')
class UserProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get gender => text().nullable()();
  RealColumn get height => real().nullable()();
  RealColumn get weight => real().nullable()();
  DateTimeColumn get birthday => dateTime().nullable()();
  TextColumn get activityLevel => text().withDefault(const Constant('sedentary'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
