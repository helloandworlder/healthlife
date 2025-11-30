import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/app_settings.dart';

part 'settings_dao.g.dart';

@DriftAccessor(tables: [AppSettings])
class SettingsDao extends DatabaseAccessor<AppDatabase> with _$SettingsDaoMixin {
  SettingsDao(super.db);

  Future<String?> getSetting(String key) async {
    final result = await (select(appSettings)..where((t) => t.key.equals(key))).getSingleOrNull();
    return result?.value;
  }

  Future<void> setSetting(String key, String value) async {
    final existing = await (select(appSettings)..where((t) => t.key.equals(key))).getSingleOrNull();

    if (existing != null) {
      await (update(appSettings)..where((t) => t.id.equals(existing.id))).write(
        AppSettingsCompanion(value: Value(value)),
      );
    } else {
      await into(appSettings).insert(AppSettingsCompanion.insert(
        key: key,
        value: value,
      ));
    }
  }

  Future<Map<String, String>> getAllSettings() async {
    final results = await select(appSettings).get();
    return {for (var s in results) s.key: s.value};
  }

  Future<bool> getBoolSetting(String key, {bool defaultValue = false}) async {
    final value = await getSetting(key);
    if (value == null) return defaultValue;
    return value.toLowerCase() == 'true';
  }

  Future<void> setBoolSetting(String key, bool value) async {
    await setSetting(key, value.toString());
  }

  Future<void> deleteSetting(String key) async {
    await (delete(appSettings)..where((t) => t.key.equals(key))).go();
  }
}
