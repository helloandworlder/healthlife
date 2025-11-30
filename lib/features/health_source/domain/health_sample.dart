import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/constants/health_types.dart';

part 'health_sample.freezed.dart';

@freezed
sealed class HealthSample with _$HealthSample {
  const factory HealthSample({
    required HealthMetricType type,
    required num value,
    required DateTime startTime,
    required DateTime endTime,
    required String source,
  }) = _HealthSample;

  const HealthSample._();

  Duration get duration => endTime.difference(startTime);
}

@freezed
sealed class HealthSyncResult with _$HealthSyncResult {
  const factory HealthSyncResult({
    required Map<HealthMetricType, int> processedCounts,
    required DateTime syncTime,
    String? error,
  }) = _HealthSyncResult;

  const HealthSyncResult._();

  bool get hasError => error != null;

  int get totalProcessed =>
      processedCounts.values.fold(0, (sum, count) => sum + count);
}

@freezed
sealed class DailyHealthData with _$DailyHealthData {
  const factory DailyHealthData({
    required DateTime date,
    @Default(0) int steps,
    @Default(0) int activeMinutes,
    @Default(0) int caloriesBurned,
    @Default(0.0) double sleepHours,
    int? avgHeartRate,
    int? hrv,
  }) = _DailyHealthData;
}
