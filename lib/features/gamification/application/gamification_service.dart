import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../app/providers.dart';
import '../../../shared/db/app_database.dart';

part 'gamification_service.g.dart';

class LevelUpResult {
  final int newLevel;
  final int expGained;

  const LevelUpResult({required this.newLevel, required this.expGained});
}

@riverpod
GamificationService gamificationService(GamificationServiceRef ref) {
  final db = ref.watch(databaseProvider);
  return GamificationService(db);
}

class GamificationService {
  final AppDatabase _db;

  static const int expPerGoal = 10;
  static const int expPerDailyLogin = 5;

  GamificationService(this._db);

  int expNeeded(int level) => level * 100;

  Future<LevelUpResult?> awardExp(int exp) async {
    final state = await _db.petDao.getOrCreateState();
    var newExp = state.exp + exp;
    var level = state.level;
    LevelUpResult? levelUp;

    while (newExp >= expNeeded(level)) {
      newExp -= expNeeded(level);
      level++;
      levelUp = LevelUpResult(newLevel: level, expGained: exp);
    }

    await _db.petDao.updateLevelAndExp(level, newExp);
    return levelUp;
  }

  Future<void> checkDailyLogin() async {
    await _db.petDao.incrementCompanionDaysIfNewDay();
    await awardExp(expPerDailyLogin);
  }

  Future<int> getExpForNextLevel(PetState state) async {
    return expNeeded(state.level) - state.exp;
  }

  String getLevelTitle(int level) {
    if (level < 5) return '初级健康达人';
    if (level < 10) return '进阶健康达人';
    if (level < 20) return '资深健康达人';
    if (level < 30) return '健康大师';
    return '传奇健康大师';
  }

  String getPetMood(PetState state) {
    final expProgress = state.exp / expNeeded(state.level);
    if (expProgress >= 0.8) return '非常开心';
    if (expProgress >= 0.5) return '开心';
    if (expProgress >= 0.2) return '一般';
    return '需要陪伴';
  }

  List<Milestone> getMilestones(PetState state) {
    final milestones = <Milestone>[
      Milestone(days: 7, title: '一周陪伴', icon: '🌟', achieved: state.companionDays >= 7),
      Milestone(days: 30, title: '月度陪伴', icon: '🏅', achieved: state.companionDays >= 30),
      Milestone(days: 100, title: '百日陪伴', icon: '🏆', achieved: state.companionDays >= 100),
      Milestone(days: 365, title: '年度陪伴', icon: '👑', achieved: state.companionDays >= 365),
    ];
    return milestones;
  }
}

class Milestone {
  final int days;
  final String title;
  final String icon;
  final bool achieved;

  const Milestone({
    required this.days,
    required this.title,
    required this.icon,
    required this.achieved,
  });
}
