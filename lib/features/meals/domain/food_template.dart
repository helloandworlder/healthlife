import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_template.freezed.dart';

@freezed
sealed class FoodTemplate with _$FoodTemplate {
  const factory FoodTemplate({
    required String name,
    required int calories,
    String? emoji,
  }) = _FoodTemplate;
}

class FoodTemplates {
  FoodTemplates._();

  static const Map<String, List<FoodTemplate>> templates = {
    'breakfast': [
      FoodTemplate(name: '包子 (1个)', calories: 220, emoji: '🥟'),
      FoodTemplate(name: '鸡蛋 (1个)', calories: 78, emoji: '🥚'),
      FoodTemplate(name: '牛奶 (250ml)', calories: 135, emoji: '🥛'),
      FoodTemplate(name: '燕麦粥', calories: 150, emoji: '🥣'),
      FoodTemplate(name: '豆浆 (300ml)', calories: 90, emoji: '🫘'),
      FoodTemplate(name: '油条 (1根)', calories: 230, emoji: '🥖'),
      FoodTemplate(name: '馒头 (1个)', calories: 180, emoji: '🍞'),
      FoodTemplate(name: '煎饼果子', calories: 350, emoji: '🥞'),
    ],
    'lunch': [
      FoodTemplate(name: '米饭 (1碗)', calories: 230, emoji: '🍚'),
      FoodTemplate(name: '面条 (1碗)', calories: 280, emoji: '🍜'),
      FoodTemplate(name: '炒菜 (1份)', calories: 150, emoji: '🥗'),
      FoodTemplate(name: '红烧肉', calories: 350, emoji: '🍖'),
      FoodTemplate(name: '宫保鸡丁', calories: 250, emoji: '🍗'),
      FoodTemplate(name: '清蒸鱼', calories: 180, emoji: '🐟'),
      FoodTemplate(name: '盖浇饭', calories: 450, emoji: '🍱'),
      FoodTemplate(name: '饺子 (10个)', calories: 320, emoji: '🥟'),
    ],
    'dinner': [
      FoodTemplate(name: '米饭 (1碗)', calories: 230, emoji: '🍚'),
      FoodTemplate(name: '蔬菜沙拉', calories: 80, emoji: '🥗'),
      FoodTemplate(name: '烤鸡胸肉', calories: 165, emoji: '🍗'),
      FoodTemplate(name: '清炒时蔬', calories: 100, emoji: '🥬'),
      FoodTemplate(name: '番茄蛋汤', calories: 60, emoji: '🍅'),
      FoodTemplate(name: '粥 (1碗)', calories: 120, emoji: '🥣'),
      FoodTemplate(name: '三明治', calories: 280, emoji: '🥪'),
      FoodTemplate(name: '火锅 (人均)', calories: 800, emoji: '🍲'),
    ],
    'snack': [
      FoodTemplate(name: '苹果 (1个)', calories: 95, emoji: '🍎'),
      FoodTemplate(name: '香蕉 (1根)', calories: 105, emoji: '🍌'),
      FoodTemplate(name: '酸奶 (200g)', calories: 130, emoji: '🥛'),
      FoodTemplate(name: '坚果 (30g)', calories: 180, emoji: '🥜'),
      FoodTemplate(name: '饼干 (3片)', calories: 120, emoji: '🍪'),
      FoodTemplate(name: '奶茶 (中杯)', calories: 350, emoji: '🧋'),
      FoodTemplate(name: '咖啡 (拿铁)', calories: 150, emoji: '☕'),
      FoodTemplate(name: '薯片 (小包)', calories: 150, emoji: '🥔'),
    ],
  };

  static List<FoodTemplate> getTemplates(String mealType) {
    return templates[mealType] ?? templates['snack']!;
  }
}
