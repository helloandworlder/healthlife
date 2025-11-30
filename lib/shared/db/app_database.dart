import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../core/constants/db_constants.dart';
import 'tables/user_profiles.dart';
import 'tables/plans.dart';
import 'tables/weight_records.dart';
import 'tables/meal_logs.dart';
import 'tables/daily_metrics.dart';
import 'tables/goals.dart';
import 'tables/goal_logs.dart';
import 'tables/pet_states.dart';
import 'tables/weekly_summaries.dart';
import 'tables/health_sync_states.dart';
import 'tables/app_settings.dart';
import 'daos/user_profile_dao.dart';
import 'daos/plan_dao.dart';
import 'daos/weight_dao.dart';
import 'daos/meal_dao.dart';
import 'daos/metrics_dao.dart';
import 'daos/goal_dao.dart';
import 'daos/pet_dao.dart';
import 'daos/weekly_summary_dao.dart';
import 'daos/settings_dao.dart';
import 'daos/health_sync_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    UserProfiles,
    Plans,
    WeightRecords,
    MealLogs,
    DailyMetrics,
    Goals,
    GoalLogs,
    PetStates,
    WeeklySummaries,
    HealthSyncStates,
    AppSettings,
  ],
  daos: [
    UserProfileDao,
    PlanDao,
    WeightDao,
    MealDao,
    MetricsDao,
    GoalDao,
    PetDao,
    WeeklySummaryDao,
    SettingsDao,
    HealthSyncDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => DbConstants.schemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          // 初始化默认设置
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyOnboardingCompleted,
            value: 'false',
          ));
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyWeightUnit,
            value: DbConstants.unitKg,
          ));
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyHeightUnit,
            value: DbConstants.unitCm,
          ));
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyLanguage,
            value: DbConstants.langZh,
          ));
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyThemeMode,
            value: DbConstants.themeSystem,
          ));
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyNotificationsEnabled,
            value: 'true',
          ));
          await into(appSettings).insert(AppSettingsCompanion.insert(
            key: DbConstants.keyHealthSource,
            value: DbConstants.healthSourceNone,
          ));
        },
        onUpgrade: (m, from, to) async {
          // 未来版本迁移
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, DbConstants.databaseName));
    return NativeDatabase.createInBackground(file);
  });
}
