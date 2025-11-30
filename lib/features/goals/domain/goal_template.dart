import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/constants/health_types.dart';

part 'goal_template.freezed.dart';

@freezed
sealed class GoalTemplate with _$GoalTemplate {
  const factory GoalTemplate({
    required String name,
    required String icon,
    required GoalPeriod period,
    required int target,
    required String category,
  }) = _GoalTemplate;
}

class GoalTemplates {
  static const List<GoalTemplate> recommended = [
    GoalTemplate(
      name: '坚持吃早餐',
      icon: '🍳',
      period: GoalPeriod.daily,
      target: 1,
      category: 'recommend',
    ),
    GoalTemplate(
      name: '喝八杯水',
      icon: '💧',
      period: GoalPeriod.daily,
      target: 8,
      category: 'recommend',
    ),
    GoalTemplate(
      name: '每周运动3次',
      icon: '🏃',
      period: GoalPeriod.weekly,
      target: 3,
      category: 'recommend',
    ),
    GoalTemplate(
      name: '每天走8000步',
      icon: '👟',
      period: GoalPeriod.daily,
      target: 1,
      category: 'recommend',
    ),
    GoalTemplate(
      name: '每天吃水果',
      icon: '🍎',
      period: GoalPeriod.daily,
      target: 1,
      category: 'recommend',
    ),
  ];

  static const List<GoalTemplate> sleep = [
    GoalTemplate(
      name: '睡前不玩手机',
      icon: '📵',
      period: GoalPeriod.daily,
      target: 1,
      category: 'sleep',
    ),
    GoalTemplate(
      name: '睡够8小时',
      icon: '😴',
      period: GoalPeriod.daily,
      target: 1,
      category: 'sleep',
    ),
    GoalTemplate(
      name: '11点前入睡',
      icon: '🌙',
      period: GoalPeriod.daily,
      target: 1,
      category: 'sleep',
    ),
    GoalTemplate(
      name: '午休20分钟',
      icon: '💤',
      period: GoalPeriod.daily,
      target: 1,
      category: 'sleep',
    ),
  ];

  static const List<GoalTemplate> habits = [
    GoalTemplate(
      name: '每天冥想10分钟',
      icon: '🧘',
      period: GoalPeriod.daily,
      target: 1,
      category: 'habits',
    ),
    GoalTemplate(
      name: '每天阅读30分钟',
      icon: '📚',
      period: GoalPeriod.daily,
      target: 1,
      category: 'habits',
    ),
    GoalTemplate(
      name: '每天记录饮食',
      icon: '📝',
      period: GoalPeriod.daily,
      target: 1,
      category: 'habits',
    ),
    GoalTemplate(
      name: '每周称重3次',
      icon: '⚖️',
      period: GoalPeriod.weekly,
      target: 3,
      category: 'habits',
    ),
    GoalTemplate(
      name: '每天拉伸5分钟',
      icon: '🤸',
      period: GoalPeriod.daily,
      target: 1,
      category: 'habits',
    ),
  ];

  static List<GoalTemplate> getByCategory(String category) {
    switch (category) {
      case 'recommend':
        return recommended;
      case 'sleep':
        return sleep;
      case 'habits':
        return habits;
      default:
        return recommended;
    }
  }

  static List<GoalTemplate> get all => [...recommended, ...sleep, ...habits];

  static const List<String> categories = ['recommend', 'sleep', 'habits'];

  static String getCategoryName(String category) {
    switch (category) {
      case 'recommend':
        return '推荐';
      case 'sleep':
        return '改善睡眠';
      case 'habits':
        return '生活习惯';
      default:
        return '推荐';
    }
  }
}

class EmojiIcons {
  static const List<String> available = [
    '🎯', '💪', '🏃', '🚶', '🧘', '🏋️', '🚴', '🏊',
    '💧', '🍎', '🥗', '🥦', '🍳', '🥛', '☕', '🍵',
    '😴', '🌙', '⏰', '📵', '💤', '🛏️', '🌅', '🌇',
    '📚', '📝', '✍️', '🎨', '🎵', '🎮', '🧠', '💡',
    '❤️', '🧡', '💛', '💚', '💙', '💜', '⭐', '✨',
    '🔥', '⚡', '💎', '🏆', '🎖️', '🥇', '👏', '💯',
  ];
}
