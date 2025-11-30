import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/constants/db_constants.dart';
import '../shared/db/app_database.dart';

part 'providers.g.dart';

/// 数据库实例 Provider
@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
}

/// 是否完成 Onboarding
@riverpod
Future<bool> onboardingCompleted(Ref ref) async {
  final db = ref.watch(databaseProvider);
  final value = await db.settingsDao.getSetting(DbConstants.keyOnboardingCompleted);
  return value == 'true';
}

/// 当前用户档案
@riverpod
Future<UserProfile?> currentProfile(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return db.userProfileDao.getProfile();
}

/// 当前激活计划
@riverpod
Future<Plan?> activePlan(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return db.planDao.getActivePlan();
}

/// 宠物状态
@riverpod
Future<PetState> petState(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return db.petDao.getOrCreateState();
}

/// 应用设置
@riverpod
Future<Map<String, String>> appSettings(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return db.settingsDao.getAllSettings();
}

/// 体重单位
@riverpod
Future<String> weightUnit(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return await db.settingsDao.getSetting(DbConstants.keyWeightUnit) ?? DbConstants.unitKg;
}

/// 身高单位
@riverpod
Future<String> heightUnit(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return await db.settingsDao.getSetting(DbConstants.keyHeightUnit) ?? DbConstants.unitCm;
}

/// 主题模式
@riverpod
Future<String> themeMode(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return await db.settingsDao.getSetting(DbConstants.keyThemeMode) ?? DbConstants.themeSystem;
}

/// 语言设置
@riverpod
Future<String> language(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return await db.settingsDao.getSetting(DbConstants.keyLanguage) ?? DbConstants.langZh;
}

/// 通知开关
@riverpod
Future<bool> notificationsEnabled(Ref ref) async {
  final db = ref.watch(databaseProvider);
  return await db.settingsDao.getBoolSetting(DbConstants.keyNotificationsEnabled, defaultValue: true);
}
