import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app/providers.dart';
import '../../core/constants/health_types.dart';
import '../../features/health_source/domain/health_sample.dart';
import '../db/app_database.dart';
import '../repositories/health_source_repository.dart';

part 'health_sync_service.g.dart';

@riverpod
HealthSyncService healthSyncService(Ref ref) {
  final db = ref.watch(databaseProvider);
  final healthRepo = ref.watch(healthSourceRepositoryProvider);
  return HealthSyncService(db, healthRepo);
}

class HealthSyncService {
  HealthSyncService(this._db, this._healthRepo);

  final AppDatabase _db;
  final HealthSourceRepository _healthRepo;

  Future<HealthSyncResult> syncAll() async {
    final results = <HealthMetricType, int>{};
    String? error;
    int dailyMetricsSynced = 0;

    try {
      // Sync last 7 days of data
      final now = DateTime.now();
      final from = DateTime(now.year, now.month, now.day - 7);
      final to = now;

      // Sync daily metrics for each day
      for (int i = 0; i <= 7; i++) {
        final date = DateTime(now.year, now.month, now.day - i);
        final success = await _syncDailyData(date);
        if (success) dailyMetricsSynced++;
      }

      // Record actual synced counts
      results[HealthMetricType.steps] = dailyMetricsSynced;
      results[HealthMetricType.caloriesBurned] = dailyMetricsSynced;
      results[HealthMetricType.sleepHours] = dailyMetricsSynced;
      results[HealthMetricType.activeMinutes] = dailyMetricsSynced;
      results[HealthMetricType.heartRate] = dailyMetricsSynced;
      results[HealthMetricType.hrv] = dailyMetricsSynced;

      // Sync weight separately
      final weightSynced = await _syncWeight(from, to);
      results[HealthMetricType.weight] = weightSynced;

      // Update last sync time
      for (final type in HealthMetricType.values) {
        await _updateSyncState(type, to);
      }
    } catch (e) {
      error = e.toString();
    }

    return HealthSyncResult(
      processedCounts: results,
      syncTime: DateTime.now(),
      error: error,
    );
  }

  Future<void> syncToday() async {
    final today = DateTime.now();
    final date = DateTime(today.year, today.month, today.day);
    await _syncDailyData(date);
  }

  Future<bool> _syncDailyData(DateTime date) async {
    try {
      final dailyData = await _healthRepo.getDailyData(date);

      await _db.metricsDao.upsertMetrics(
        DailyMetricsCompanion(
          date: Value(DateTime(date.year, date.month, date.day)),
          steps: Value(dailyData.steps),
          activeMinutes: Value(dailyData.activeMinutes),
          caloriesBurned: Value(dailyData.caloriesBurned),
          sleepHours: Value(dailyData.sleepHours),
          avgHeartRate: Value(dailyData.avgHeartRate),
          hrv: Value(dailyData.hrv),
        ),
      );
      return true;
    } catch (e) {
      // Log error but don't throw - continue with other days
      // TODO: Add proper logging when logging service is implemented
      return false;
    }
  }

  Future<int> _syncWeight(DateTime from, DateTime to) async {
    try {
      final samples = await _healthRepo.fetchSamples(
        type: HealthMetricType.weight,
        from: from,
        to: to,
      );

      int count = 0;
      for (final sample in samples) {
        try {
          await _db.weightDao.insertWeightIfNotExists(
            sample.value.toDouble(),
            recordedAt: sample.endTime,
            source: sample.source,
          );
          count++;
        } catch (_) {}
      }

      return count;
    } catch (e) {
      return 0;
    }
  }

  Future<DateTime?> getLastSyncTime(HealthMetricType type) async {
    final state = await _db.healthSyncDao.getSyncState(type.name);
    return state?.lastSyncedAt;
  }

  Future<void> _updateSyncState(HealthMetricType type, DateTime syncTime) async {
    await _db.healthSyncDao.updateSyncState(type.name, syncTime);
  }

  Future<bool> needsSync(HealthMetricType type) async {
    final lastSync = await getLastSyncTime(type);
    if (lastSync == null) return true;

    final now = DateTime.now();
    final hoursSinceLastSync = now.difference(lastSync).inHours;

    // Sync if more than 1 hour has passed
    return hoursSinceLastSync >= 1;
  }

  Future<Map<HealthMetricType, DateTime?>> getAllSyncStates() async {
    final result = <HealthMetricType, DateTime?>{};
    for (final type in HealthMetricType.values) {
      result[type] = await getLastSyncTime(type);
    }
    return result;
  }
}
