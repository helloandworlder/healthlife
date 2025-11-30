import 'package:drift/drift.dart';

@DataClassName('HealthSyncState')
class HealthSyncStates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get metricType => text()();
  DateTimeColumn get lastSyncedAt => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [{metricType}];
}
