import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/user_profiles.dart';

part 'user_profile_dao.g.dart';

@DriftAccessor(tables: [UserProfiles])
class UserProfileDao extends DatabaseAccessor<AppDatabase> with _$UserProfileDaoMixin {
  UserProfileDao(super.db);

  Future<UserProfile?> getProfile() async {
    return (select(userProfiles)..limit(1)).getSingleOrNull();
  }

  Future<int> upsertProfile(UserProfilesCompanion profile) async {
    final existing = await getProfile();
    if (existing != null) {
      await (update(userProfiles)..where((t) => t.id.equals(existing.id))).write(
        profile.copyWith(updatedAt: Value(DateTime.now())),
      );
      return existing.id;
    }
    return into(userProfiles).insert(profile);
  }

  Future<void> updateWeight(double weight) async {
    final existing = await getProfile();
    if (existing != null) {
      await (update(userProfiles)..where((t) => t.id.equals(existing.id))).write(
        UserProfilesCompanion(
          weight: Value(weight),
          updatedAt: Value(DateTime.now()),
        ),
      );
    }
  }
}
