import 'package:health/health.dart';

import '../../core/constants/health_types.dart';
import 'base_health_repository.dart';

/// iOS HealthKit 实现
class AppleHealthRepository extends BaseHealthRepository {
  @override
  List<HealthDataType> get readTypes => const [
        HealthDataType.STEPS,
        HealthDataType.ACTIVE_ENERGY_BURNED,
        HealthDataType.HEART_RATE,
        HealthDataType.HEART_RATE_VARIABILITY_SDNN,
        HealthDataType.SLEEP_ASLEEP,
        HealthDataType.SLEEP_IN_BED,
        HealthDataType.WEIGHT,
        HealthDataType.WORKOUT,
      ];

  @override
  List<HealthDataType> get writeTypes => const [
        HealthDataType.WEIGHT,
      ];

  @override
  List<HealthDataType> get sleepTypes => const [
        HealthDataType.SLEEP_ASLEEP,
        HealthDataType.SLEEP_IN_BED,
      ];

  @override
  bool get supportsHrv => true;

  @override
  Future<bool> checkPlatformAvailability() async {
    try {
      // If hasPermissions returns non-null, HealthKit is available
      final result = await health.hasPermissions([HealthDataType.STEPS]);
      return result != null;
    } catch (e) {
      return false;
    }
  }

  @override
  HealthDataType? mapToHealthDataType(HealthMetricType type) {
    switch (type) {
      case HealthMetricType.steps:
        return HealthDataType.STEPS;
      case HealthMetricType.activeMinutes:
        return HealthDataType.WORKOUT;
      case HealthMetricType.caloriesBurned:
        return HealthDataType.ACTIVE_ENERGY_BURNED;
      case HealthMetricType.sleepHours:
        return HealthDataType.SLEEP_ASLEEP;
      case HealthMetricType.heartRate:
        return HealthDataType.HEART_RATE;
      case HealthMetricType.hrv:
        return HealthDataType.HEART_RATE_VARIABILITY_SDNN;
      case HealthMetricType.weight:
        return HealthDataType.WEIGHT;
    }
  }
}
