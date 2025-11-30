import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../shared/db/app_database.dart';

part 'weight_notifier.g.dart';

@riverpod
class WeightNotifier extends _$WeightNotifier {
  @override
  Future<WeightState> build() async {
    final db = ref.watch(databaseProvider);
    final now = DateTime.now();

    final latestWeight = await db.weightDao.getLatestWeight();
    final todayWeight = await db.weightDao.getWeightForDate(now);

    WeightRecord? previousWeight;
    if (latestWeight != null) {
      final history = await db.weightDao.getWeightHistory(
        to: latestWeight.recordedAt.subtract(const Duration(hours: 1)),
        limit: 1,
      );
      if (history.isNotEmpty) {
        previousWeight = history.first;
      }
    }

    return WeightState(
      latestWeight: latestWeight,
      todayWeight: todayWeight,
      previousWeight: previousWeight,
    );
  }

  Future<void> addWeight(double weight) async {
    final db = ref.read(databaseProvider);
    await db.weightDao.insertWeight(weight);
    ref.invalidateSelf();
  }

  Future<void> deleteWeight(int id) async {
    final db = ref.read(databaseProvider);
    await db.weightDao.deleteWeight(id);
    ref.invalidateSelf();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

class WeightState {
  const WeightState({
    this.latestWeight,
    this.todayWeight,
    this.previousWeight,
  });

  final WeightRecord? latestWeight;
  final WeightRecord? todayWeight;
  final WeightRecord? previousWeight;

  double? get delta {
    if (latestWeight == null || previousWeight == null) return null;
    return latestWeight!.weight - previousWeight!.weight;
  }

  bool get hasRecordedToday => todayWeight != null;
}

@riverpod
class WeightHistoryNotifier extends _$WeightHistoryNotifier {
  @override
  Future<WeightHistoryState> build({int days = 30}) async {
    final db = ref.watch(databaseProvider);
    final now = DateTime.now();
    final from = now.subtract(Duration(days: days));

    final history = await db.weightDao.getWeightHistory(from: from, to: now);
    final stats = await db.weightDao.getWeightStats(from: from, to: now);

    return WeightHistoryState(
      records: history,
      minWeight: stats?.$1,
      maxWeight: stats?.$2,
      avgWeight: stats?.$3,
      days: days,
    );
  }

  Future<void> changePeriod(int days) async {
    ref.invalidateSelf();
  }
}

class WeightHistoryState {
  const WeightHistoryState({
    required this.records,
    required this.days,
    this.minWeight,
    this.maxWeight,
    this.avgWeight,
  });

  final List<WeightRecord> records;
  final int days;
  final double? minWeight;
  final double? maxWeight;
  final double? avgWeight;

  double? get totalChange {
    if (records.length < 2) return null;
    return records.first.weight - records.last.weight;
  }
}
