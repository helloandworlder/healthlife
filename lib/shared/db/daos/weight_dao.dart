import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/weight_records.dart';

part 'weight_dao.g.dart';

@DriftAccessor(tables: [WeightRecords])
class WeightDao extends DatabaseAccessor<AppDatabase> with _$WeightDaoMixin {
  WeightDao(super.db);

  Future<WeightRecord?> getLatestWeight() async {
    return (select(weightRecords)
          ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<WeightRecord?> getWeightForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(weightRecords)
          ..where((t) => t.recordedAt.isBiggerOrEqualValue(startOfDay) & t.recordedAt.isSmallerThanValue(endOfDay))
          ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<WeightRecord>> getWeightHistory({
    DateTime? from,
    DateTime? to,
    int? limit,
  }) async {
    var query = select(weightRecords)..orderBy([(t) => OrderingTerm.desc(t.recordedAt)]);

    if (from != null) {
      query = query..where((t) => t.recordedAt.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query = query..where((t) => t.recordedAt.isSmallerOrEqualValue(to));
    }
    if (limit != null) {
      query = query..limit(limit);
    }

    return query.get();
  }

  Future<int> insertWeight(double weight, {String source = 'manual'}) async {
    return into(weightRecords).insert(WeightRecordsCompanion.insert(
      weight: weight,
      recordedAt: DateTime.now(),
      source: Value(source),
    ));
  }

  Future<int> insertWeightIfNotExists(
    double weight, {
    required DateTime recordedAt,
    String source = 'manual',
  }) async {
    // Check if a weight record exists for this time and source
    final startOfHour = DateTime(
      recordedAt.year,
      recordedAt.month,
      recordedAt.day,
      recordedAt.hour,
    );
    final endOfHour = startOfHour.add(const Duration(hours: 1));

    final existing = await (select(weightRecords)
          ..where((t) =>
              t.recordedAt.isBiggerOrEqualValue(startOfHour) &
              t.recordedAt.isSmallerThanValue(endOfHour) &
              t.source.equals(source)))
        .getSingleOrNull();

    if (existing != null) {
      // Update if different weight
      if ((existing.weight - weight).abs() > 0.01) {
        await (update(weightRecords)..where((t) => t.id.equals(existing.id)))
            .write(WeightRecordsCompanion(weight: Value(weight)));
      }
      return existing.id;
    }

    return into(weightRecords).insert(WeightRecordsCompanion.insert(
      weight: weight,
      recordedAt: recordedAt,
      source: Value(source),
    ));
  }

  Future<void> deleteWeight(int id) async {
    await (delete(weightRecords)..where((t) => t.id.equals(id))).go();
  }

  Future<(double min, double max, double avg)?> getWeightStats({
    required DateTime from,
    required DateTime to,
  }) async {
    final records = await getWeightHistory(from: from, to: to);
    if (records.isEmpty) return null;

    final weights = records.map((r) => r.weight).toList();
    final min = weights.reduce((a, b) => a < b ? a : b);
    final max = weights.reduce((a, b) => a > b ? a : b);
    final avg = weights.reduce((a, b) => a + b) / weights.length;

    return (min, max, avg);
  }
}
