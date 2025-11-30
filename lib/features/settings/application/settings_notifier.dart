import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../app/providers.dart';
import '../../../core/constants/db_constants.dart';

part 'settings_notifier.g.dart';

@riverpod
Future<Map<DateTime, int>> activityHeatmapData(ActivityHeatmapDataRef ref) async {
  final db = ref.watch(databaseProvider);
  final now = DateTime.now();
  final sixMonthsAgo = DateTime(now.year, now.month - 6, 1);
  
  final metrics = await db.metricsDao.getMetricsInRange(sixMonthsAgo, now);
  final data = <DateTime, int>{};
  
  for (final m in metrics) {
    final score = (m.steps / 10000) + (m.activeMinutes / 60);
    int level;
    if (score < 0.3) {
      level = 0;
    } else if (score < 0.6) {
      level = 1;
    } else if (score < 1.0) {
      level = 2;
    } else {
      level = 3;
    }
    data[DateTime(m.date.year, m.date.month, m.date.day)] = level;
  }
  
  return data;
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<SettingsState> build() async {
    final settings = await ref.watch(appSettingsProvider.future);
    
    return SettingsState(
      weightUnit: settings[DbConstants.keyWeightUnit] ?? DbConstants.unitKg,
      heightUnit: settings[DbConstants.keyHeightUnit] ?? DbConstants.unitCm,
      language: settings[DbConstants.keyLanguage] ?? DbConstants.langZh,
      themeMode: _parseThemeMode(settings[DbConstants.keyThemeMode]),
      notificationsEnabled: settings[DbConstants.keyNotificationsEnabled] == 'true',
      aiEndpoint: settings[DbConstants.keyAiEndpoint] ?? '',
      aiApiKey: settings[DbConstants.keyAiApiKey] ?? '',
      aiModel: settings[DbConstants.keyAiModel] ?? DbConstants.defaultAiModel,
    );
  }

  ThemeMode _parseThemeMode(String? value) {
    switch (value) {
      case DbConstants.themeLight:
        return ThemeMode.light;
      case DbConstants.themeDark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return DbConstants.themeLight;
      case ThemeMode.dark:
        return DbConstants.themeDark;
      case ThemeMode.system:
        return DbConstants.themeSystem;
    }
  }

  Future<void> setWeightUnit(String unit) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyWeightUnit, unit);
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setHeightUnit(String unit) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyHeightUnit, unit);
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setLanguage(String lang) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyLanguage, lang);
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyThemeMode, _themeModeToString(mode));
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyNotificationsEnabled, enabled.toString());
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setAiEndpoint(String endpoint) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyAiEndpoint, endpoint);
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setAiApiKey(String apiKey) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyAiApiKey, apiKey);
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }

  Future<void> setAiModel(String model) async {
    final db = ref.read(databaseProvider);
    await db.settingsDao.setSetting(DbConstants.keyAiModel, model);
    ref.invalidate(appSettingsProvider);
    ref.invalidateSelf();
  }
}

class SettingsState {
  final String weightUnit;
  final String heightUnit;
  final String language;
  final ThemeMode themeMode;
  final bool notificationsEnabled;
  final String aiEndpoint;
  final String aiApiKey;
  final String aiModel;

  const SettingsState({
    required this.weightUnit,
    required this.heightUnit,
    required this.language,
    required this.themeMode,
    required this.notificationsEnabled,
    required this.aiEndpoint,
    required this.aiApiKey,
    required this.aiModel,
  });

  bool get isAiConfigured => aiApiKey.isNotEmpty;

  String get unitDisplay {
    final w = weightUnit == DbConstants.unitKg ? 'kg' : 'lb';
    final h = heightUnit == DbConstants.unitCm ? 'cm' : 'inch';
    return '$w / $h';
  }

  String get languageDisplay {
    return language == DbConstants.langZh ? '中文' : 'English';
  }
}
