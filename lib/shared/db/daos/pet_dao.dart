import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/pet_states.dart';

part 'pet_dao.g.dart';

@DriftAccessor(tables: [PetStates])
class PetDao extends DatabaseAccessor<AppDatabase> with _$PetDaoMixin {
  PetDao(super.db);

  Future<PetState> getOrCreateState() async {
    final existing = await (select(petStates)..limit(1)).getSingleOrNull();
    if (existing != null) return existing;

    final id = await into(petStates).insert(const PetStatesCompanion());
    return (select(petStates)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<void> updateName(String name) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(name: Value(name)),
    );
  }

  Future<void> updateExp(int exp) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(exp: Value(exp)),
    );
  }

  Future<void> updateLevel(int level) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(level: Value(level)),
    );
  }

  Future<void> updateLevelAndExp(int level, int exp) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(
        level: Value(level),
        exp: Value(exp),
      ),
    );
  }

  Future<void> updateCompanionDays(int days) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(companionDays: Value(days)),
    );
  }

  Future<void> updateLastActiveDate(DateTime date) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(lastActiveDate: Value(date)),
    );
  }

  Future<void> incrementCompanionDaysIfNewDay() async {
    final state = await getOrCreateState();
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    if (state.lastActiveDate == null) {
      await (update(petStates)..where((t) => t.id.equals(state.id))).write(
        PetStatesCompanion(
          companionDays: Value(state.companionDays + 1),
          lastActiveDate: Value(todayOnly),
        ),
      );
      return;
    }

    final lastDate = state.lastActiveDate!;
    final lastDateOnly = DateTime(lastDate.year, lastDate.month, lastDate.day);

    if (!todayOnly.isAtSameMomentAs(lastDateOnly)) {
      await (update(petStates)..where((t) => t.id.equals(state.id))).write(
        PetStatesCompanion(
          companionDays: Value(state.companionDays + 1),
          lastActiveDate: Value(todayOnly),
        ),
      );
    }
  }

  Future<void> updateSkin(String skin) async {
    final state = await getOrCreateState();
    await (update(petStates)..where((t) => t.id.equals(state.id))).write(
      PetStatesCompanion(currentSkin: Value(skin)),
    );
  }
}
