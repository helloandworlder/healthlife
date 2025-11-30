import 'package:drift/drift.dart';

@DataClassName('WeightRecord')
class WeightRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get weight => real()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get source => text().withDefault(const Constant('manual'))();
}
