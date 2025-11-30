import 'package:health/health.dart';

import '../../core/constants/health_types.dart';
import '../../core/utils/date_utils.dart' as app_date;
import '../../features/health_source/domain/health_sample.dart';
import '../services/logger_service.dart';
import 'health_source_repository.dart';

/// 健康数据仓库基类，提取 iOS/Android 平台的公共实现
abstract class BaseHealthRepository implements HealthSourceRepository {
  final Health health = Health();
  bool _isInitialized = false;

  /// 子类必须定义的读取数据类型
  List<HealthDataType> get readTypes;

  /// 子类必须定义的写入数据类型
  List<HealthDataType> get writeTypes;

  /// 子类必须实现的平台可用性检查
  Future<bool> checkPlatformAvailability();

  /// 子类必须实现的类型映射
  HealthDataType? mapToHealthDataType(HealthMetricType type);

  /// 子类可选覆盖的睡眠数据类型
  List<HealthDataType> get sleepTypes => [HealthDataType.SLEEP_ASLEEP];

  /// 子类可选覆盖的 HRV 支持
  bool get supportsHrv => false;

  Future<void> ensureInitialized() async {
    if (!_isInitialized) {
      await health.configure();
      _isInitialized = true;
    }
  }

  @override
  Future<bool> isAvailable() async {
    await ensureInitialized();
    return checkPlatformAvailability();
  }

  @override
  Future<bool> requestPermissions() async {
    await ensureInitialized();

    final permissions = readTypes.map((t) => HealthDataAccess.READ).toList();
    permissions.addAll(writeTypes.map((t) => HealthDataAccess.WRITE));

    final types = [...readTypes, ...writeTypes];

    return await health.requestAuthorization(types, permissions: permissions);
  }

  @override
  Future<Map<HealthMetricType, bool>> checkPermissions() async {
    await ensureInitialized();

    final result = <HealthMetricType, bool>{};

    for (final type in HealthMetricType.values) {
      final healthType = mapToHealthDataType(type);
      if (healthType != null) {
        final hasPermission = await health.hasPermissions(
          [healthType],
          permissions: [HealthDataAccess.READ],
        );
        result[type] = hasPermission ?? false;
      } else {
        result[type] = false;
      }
    }

    return result;
  }

  @override
  Future<List<HealthSample>> fetchSamples({
    required HealthMetricType type,
    required DateTime from,
    required DateTime to,
  }) async {
    await ensureInitialized();

    final healthType = mapToHealthDataType(type);
    if (healthType == null) return [];

    try {
      final healthData = await health.getHealthDataFromTypes(
        types: [healthType],
        startTime: from,
        endTime: to,
      );

      return healthData.map((data) {
        num value;
        if (data.value is NumericHealthValue) {
          value = (data.value as NumericHealthValue).numericValue;
        } else {
          value = 0;
        }

        return HealthSample(
          type: type,
          value: value,
          startTime: data.dateFrom,
          endTime: data.dateTo,
          source: data.sourceName,
        );
      }).toList();
    } catch (e, stack) {
      logger.warning('Failed to fetch health samples', tag: 'HealthRepo', error: e, stackTrace: stack);
      return [];
    }
  }

  @override
  Future<int> getTotalSteps(DateTime date) async {
    await ensureInitialized();

    final startOfDay = app_date.AppDateUtils.startOfDay(date);
    final endOfDay = app_date.AppDateUtils.endOfDay(date);

    try {
      final steps = await health.getTotalStepsInInterval(startOfDay, endOfDay);
      return steps ?? 0;
    } catch (e, stack) {
      logger.warning('Failed to fetch steps', tag: 'HealthRepo', error: e, stackTrace: stack);
      return 0;
    }
  }

  @override
  Future<DailyHealthData> getDailyData(DateTime date) async {
    await ensureInitialized();

    final startOfDay = app_date.AppDateUtils.startOfDay(date);
    final endOfDay = app_date.AppDateUtils.endOfDay(date);

    final steps = await getTotalSteps(date);

    // Fetch active energy
    final caloriesBurned = await _fetchCaloriesBurned(startOfDay, endOfDay);

    // Fetch workout minutes
    final activeMinutes = await _fetchActiveMinutes(startOfDay, endOfDay);

    // Fetch sleep data
    final sleepHours = await _fetchSleepHours(startOfDay, endOfDay);

    // Fetch heart rate
    final avgHeartRate = await _fetchAverageHeartRate(startOfDay, endOfDay);

    // Fetch HRV (if supported)
    final hrv = supportsHrv ? await _fetchAverageHrv(startOfDay, endOfDay) : null;

    return DailyHealthData(
      date: date,
      steps: steps,
      activeMinutes: activeMinutes,
      caloriesBurned: caloriesBurned,
      sleepHours: sleepHours,
      avgHeartRate: avgHeartRate,
      hrv: hrv,
    );
  }

  @override
  Future<double?> getLatestWeight() async {
    await ensureInitialized();

    try {
      final now = DateTime.now();
      final thirtyDaysAgo = now.subtract(const Duration(days: 30));

      final weightData = await health.getHealthDataFromTypes(
        types: [HealthDataType.WEIGHT],
        startTime: thirtyDaysAgo,
        endTime: now,
      );

      if (weightData.isEmpty) return null;

      weightData.sort((a, b) => b.dateTo.compareTo(a.dateTo));
      final latest = weightData.first;

      if (latest.value is NumericHealthValue) {
        return (latest.value as NumericHealthValue).numericValue.toDouble();
      }

      return null;
    } catch (e, stack) {
      logger.warning('Failed to fetch latest weight', tag: 'HealthRepo', error: e, stackTrace: stack);
      return null;
    }
  }

  // Private helper methods

  Future<int> _fetchCaloriesBurned(DateTime startOfDay, DateTime endOfDay) async {
    try {
      final energyData = await health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      int total = 0;
      for (final data in energyData) {
        if (data.value is NumericHealthValue) {
          total += (data.value as NumericHealthValue).numericValue.toInt();
        }
      }
      return total;
    } catch (e, stack) {
      logger.debug('Failed to fetch calories burned', tag: 'HealthRepo', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int> _fetchActiveMinutes(DateTime startOfDay, DateTime endOfDay) async {
    try {
      final workoutData = await health.getHealthDataFromTypes(
        types: [HealthDataType.WORKOUT],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      int total = 0;
      for (final data in workoutData) {
        total += data.dateTo.difference(data.dateFrom).inMinutes;
      }
      return total;
    } catch (e, stack) {
      logger.debug('Failed to fetch active minutes', tag: 'HealthRepo', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<double> _fetchSleepHours(DateTime startOfDay, DateTime endOfDay) async {
    try {
      final sleepData = await health.getHealthDataFromTypes(
        types: sleepTypes,
        startTime: startOfDay.subtract(const Duration(hours: 12)),
        endTime: endOfDay,
      );
      double total = 0;
      for (final data in sleepData) {
        // Only count SLEEP_ASLEEP for accurate sleep time
        if (data.type == HealthDataType.SLEEP_ASLEEP) {
          total += data.dateTo.difference(data.dateFrom).inMinutes / 60.0;
        }
      }
      return total;
    } catch (e, stack) {
      logger.debug('Failed to fetch sleep hours', tag: 'HealthRepo', error: e, stackTrace: stack);
      return 0;
    }
  }

  Future<int?> _fetchAverageHeartRate(DateTime startOfDay, DateTime endOfDay) async {
    try {
      final hrData = await health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      if (hrData.isEmpty) return null;

      double total = 0;
      for (final data in hrData) {
        if (data.value is NumericHealthValue) {
          total += (data.value as NumericHealthValue).numericValue;
        }
      }
      return (total / hrData.length).round();
    } catch (e, stack) {
      logger.debug('Failed to fetch heart rate', tag: 'HealthRepo', error: e, stackTrace: stack);
      return null;
    }
  }

  Future<int?> _fetchAverageHrv(DateTime startOfDay, DateTime endOfDay) async {
    try {
      final hrvData = await health.getHealthDataFromTypes(
        types: [HealthDataType.HEART_RATE_VARIABILITY_SDNN],
        startTime: startOfDay,
        endTime: endOfDay,
      );
      if (hrvData.isEmpty) return null;

      double total = 0;
      for (final data in hrvData) {
        if (data.value is NumericHealthValue) {
          total += (data.value as NumericHealthValue).numericValue;
        }
      }
      return (total / hrvData.length).round();
    } catch (e, stack) {
      logger.debug('Failed to fetch HRV', tag: 'HealthRepo', error: e, stackTrace: stack);
      return null;
    }
  }
}
