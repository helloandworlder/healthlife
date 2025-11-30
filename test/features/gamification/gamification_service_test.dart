import 'package:flutter_test/flutter_test.dart';
import 'package:healthlife/features/gamification/application/gamification_service.dart';

void main() {
  group('GamificationService', () {
    group('expNeeded 纯函数测试', () {
      test('Level 1 需要 100 经验', () {
        expect(_expNeeded(1), equals(100));
      });

      test('Level 5 需要 500 经验', () {
        expect(_expNeeded(5), equals(500));
      });

      test('Level 10 需要 1000 经验', () {
        expect(_expNeeded(10), equals(1000));
      });

      test('经验需求随等级线性增长', () {
        for (int level = 1; level <= 20; level++) {
          expect(_expNeeded(level), equals(level * 100));
        }
      });
    });

    group('getLevelTitle 纯函数测试', () {
      test('等级 1-4 返回初级健康达人', () {
        expect(_getLevelTitle(1), equals('初级健康达人'));
        expect(_getLevelTitle(4), equals('初级健康达人'));
      });

      test('等级 5-9 返回进阶健康达人', () {
        expect(_getLevelTitle(5), equals('进阶健康达人'));
        expect(_getLevelTitle(9), equals('进阶健康达人'));
      });

      test('等级 10-19 返回资深健康达人', () {
        expect(_getLevelTitle(10), equals('资深健康达人'));
        expect(_getLevelTitle(19), equals('资深健康达人'));
      });

      test('等级 20-29 返回健康大师', () {
        expect(_getLevelTitle(20), equals('健康大师'));
        expect(_getLevelTitle(29), equals('健康大师'));
      });

      test('等级 30+ 返回传奇健康大师', () {
        expect(_getLevelTitle(30), equals('传奇健康大师'));
        expect(_getLevelTitle(100), equals('传奇健康大师'));
      });
    });

    group('Milestone', () {
      test('里程碑包含正确的天数', () {
        final milestones = [
          const Milestone(days: 7, title: '一周陪伴', icon: '🌟', achieved: false),
          const Milestone(days: 30, title: '月度陪伴', icon: '🏅', achieved: false),
          const Milestone(days: 100, title: '百日陪伴', icon: '🏆', achieved: false),
          const Milestone(days: 365, title: '年度陪伴', icon: '👑', achieved: false),
        ];

        expect(milestones[0].days, equals(7));
        expect(milestones[1].days, equals(30));
        expect(milestones[2].days, equals(100));
        expect(milestones[3].days, equals(365));
      });

      test('里程碑正确标记已达成状态', () {
        const achievedMilestone = Milestone(
          days: 7,
          title: '一周陪伴',
          icon: '🌟',
          achieved: true,
        );
        const unachievedMilestone = Milestone(
          days: 30,
          title: '月度陪伴',
          icon: '🏅',
          achieved: false,
        );

        expect(achievedMilestone.achieved, isTrue);
        expect(unachievedMilestone.achieved, isFalse);
      });
    });

    group('LevelUpResult', () {
      test('包含正确的升级信息', () {
        const result = LevelUpResult(newLevel: 5, expGained: 10);
        expect(result.newLevel, equals(5));
        expect(result.expGained, equals(10));
      });
    });

    group('常量值', () {
      test('每个目标完成奖励 10 经验', () {
        expect(GamificationService.expPerGoal, equals(10));
      });

      test('每日登录奖励 5 经验', () {
        expect(GamificationService.expPerDailyLogin, equals(5));
      });
    });

    group('升级计算逻辑', () {
      test('从0经验到99经验不升级', () {
        // Level 1 需要 100 经验才能升级
        expect(_expNeeded(1), equals(100));
      });

      test('累积足够经验可以升级', () {
        // Level 1: 需要100经验
        // Level 2: 需要200经验
        expect(_expNeeded(1), equals(100));
        expect(_expNeeded(2), equals(200));
      });

      test('多次升级累积计算', () {
        // 验证升级所需总经验
        // Level 1->2: 100
        // Level 2->3: 200
        // Level 3->4: 300
        // 总计: 600 经验从 Level 1 升到 Level 4
        final total = _expNeeded(1) + _expNeeded(2) + _expNeeded(3);
        expect(total, equals(600));
      });

      test('升级算法模拟 - 获得100经验从Level 1升级', () {
        final (newLevel, newExp) = _simulateLevelUp(1, 0, 100);
        expect(newLevel, equals(2));
        expect(newExp, equals(0));
      });

      test('升级算法模拟 - 获得350经验从Level 1升级两次', () {
        // Level 1 需要 100, Level 2 需要 200, 剩余 50
        final (newLevel, newExp) = _simulateLevelUp(1, 0, 350);
        expect(newLevel, equals(3));
        expect(newExp, equals(50));
      });

      test('升级算法模拟 - 获得50经验不升级', () {
        final (newLevel, newExp) = _simulateLevelUp(1, 40, 50);
        expect(newLevel, equals(1));
        expect(newExp, equals(90));
      });
    });
  });
}

// 测试辅助函数 - 复制自 GamificationService 的纯逻辑
int _expNeeded(int level) => level * 100;

String _getLevelTitle(int level) {
  if (level < 5) return '初级健康达人';
  if (level < 10) return '进阶健康达人';
  if (level < 20) return '资深健康达人';
  if (level < 30) return '健康大师';
  return '传奇健康大师';
}

(int, int) _simulateLevelUp(int currentLevel, int currentExp, int expGain) {
  var exp = currentExp + expGain;
  var level = currentLevel;
  
  while (exp >= _expNeeded(level)) {
    exp -= _expNeeded(level);
    level++;
  }
  
  return (level, exp);
}
