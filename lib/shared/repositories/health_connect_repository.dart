import 'package:health/health.dart';

import '../../core/constants/health_types.dart';
import 'base_health_repository.dart';

/// Android Health Connect 实现
class HealthConnectRepository extends BaseHealthRepository {
  @override
  List<HealthDataType> get readTypes => const [
        HealthDataType.STEPS,
        HealthDataType.ACTIVE_ENERGY_BURNED,
        HealthDataType.HEART_RATE,
        HealthDataType.SLEEP_ASLEEP,
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
      ];

  @override
  bool get supportsHrv => false; // Health Connect may not support HRV directly

  @override
  Future<bool> checkPlatformAvailability() async {
    try {
      final status = await health.getHealthConnectSdkStatus();
      return status == HealthConnectSdkStatus.sdkAvailable;
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
        return null; // Health Connect may not support HRV directly
      case HealthMetricType.weight:
        return HealthDataType.WEIGHT;
    }
  }
}
