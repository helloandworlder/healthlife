import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/health_types.dart';
import '../../features/health_source/domain/health_sample.dart';
import 'apple_health_repository.dart';
import 'health_connect_repository.dart';

part 'health_source_repository.g.dart';

abstract class HealthSourceRepository {
  Future<bool> isAvailable();

  Future<bool> requestPermissions();

  Future<Map<HealthMetricType, bool>> checkPermissions();

  Future<List<HealthSample>> fetchSamples({
    required HealthMetricType type,
    required DateTime from,
    required DateTime to,
  });

  Future<int> getTotalSteps(DateTime date);

  Future<DailyHealthData> getDailyData(DateTime date);

  Future<double?> getLatestWeight();
}

@Riverpod(keepAlive: true)
HealthSourceRepository healthSourceRepository(Ref ref) {
  if (Platform.isIOS) {
    return AppleHealthRepository();
  } else if (Platform.isAndroid) {
    return HealthConnectRepository();
  }
  throw UnsupportedError('Unsupported platform for health data');
}
