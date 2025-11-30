import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/health_sync_states.dart';

part 'health_sync_dao.g.dart';

@DriftAccessor(tables: [HealthSyncStates])
class HealthSyncDao extends DatabaseAccessor<AppDatabase> with _$HealthSyncDaoMixin {
  HealthSyncDao(super.db);

  Future<HealthSyncState?> getSyncState(String metricType) async {
    return (select(healthSyncStates)..where((t) => t.metricType.equals(metricType))).getSingleOrNull();
  }

  Future<DateTime?> getLastSyncTime(String metricType) async {
    final result = await getSyncState(metricType);
    return result?.lastSyncedAt;
  }

  Future<void> updateSyncState(String metricType, DateTime time) async {
    await updateLastSyncTime(metricType, time);
  }

  Future<void> updateLastSyncTime(String metricType, DateTime time) async {
    final existing = await (select(healthSyncStates)..where((t) => t.metricType.equals(metricType))).getSingleOrNull();

    if (existing != null) {
      await (update(healthSyncStates)..where((t) => t.id.equals(existing.id))).write(
        HealthSyncStatesCompanion(lastSyncedAt: Value(time)),
      );
    } else {
      await into(healthSyncStates).insert(HealthSyncStatesCompanion.insert(
        metricType: metricType,
        lastSyncedAt: time,
      ));
    }
  }

  Future<Map<String, DateTime>> getAllSyncTimes() async {
    final results = await select(healthSyncStates).get();
    return {for (var s in results) s.metricType: s.lastSyncedAt};
  }

  Future<void> clearSyncTime(String metricType) async {
    await (delete(healthSyncStates)..where((t) => t.metricType.equals(metricType))).go();
  }

  Future<void> clearAllSyncTimes() async {
    await delete(healthSyncStates).go();
  }
}
