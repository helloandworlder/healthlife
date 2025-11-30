import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

enum MessageRole { user, assistant, system }

/// Tool 执行结果
class ToolResult {
  final String toolName;
  final bool success;
  final String? message;

  const ToolResult({
    required this.toolName,
    required this.success,
    this.message,
  });
}

@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required MessageRole role,
    required String content,
    required DateTime timestamp,
    @Default(false) bool isLoading,
    String? error,
    String? thinkingContent,
    ToolResult? toolResult,
  }) = _ChatMessage;

  const ChatMessage._();

  factory ChatMessage.user(String content) => ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.user,
        content: content,
        timestamp: DateTime.now(),
      );

  factory ChatMessage.assistant(String content) => ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: content,
        timestamp: DateTime.now(),
      );

  factory ChatMessage.loading() => ChatMessage(
        id: 'loading_${DateTime.now().millisecondsSinceEpoch}',
        role: MessageRole.assistant,
        content: '',
        timestamp: DateTime.now(),
        isLoading: true,
      );

  bool get isUser => role == MessageRole.user;
  bool get isAssistant => role == MessageRole.assistant;
  bool get hasThinking => thinkingContent != null && thinkingContent!.isNotEmpty;
  bool get hasToolResult => toolResult != null;
}

@freezed
sealed class HealthContext with _$HealthContext {
  const factory HealthContext({
    required int todaySteps,
    required int todayCaloriesBurned,
    required int todayCaloriesIntake,
    required double sleepHours,
    required List<GoalProgress> goals,
    double? currentWeight,
    double? targetWeight,
  }) = _HealthContext;

  const HealthContext._();

  int get completedGoals => goals.where((g) => g.isCompleted).length;

  Map<String, dynamic> toPromptData() => {
        'steps': todaySteps,
        'caloriesBurned': todayCaloriesBurned,
        'caloriesIntake': todayCaloriesIntake,
        'sleepHours': sleepHours,
        'goalsCompleted': completedGoals,
        'goalsTotal': goals.length,
        'currentWeight': currentWeight,
        'targetWeight': targetWeight,
      };
}

@freezed
sealed class GoalProgress with _$GoalProgress {
  const factory GoalProgress({
    required String name,
    required int progress,
    required int target,
    required bool isCompleted,
  }) = _GoalProgress;
}

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isLoading,
    String? error,
    HealthContext? healthContext,
  }) = _ChatState;

  const ChatState._();

  factory ChatState.initial() => const ChatState();

  ChatState addMessage(ChatMessage message) {
    return copyWith(
      messages: [...messages, message],
      error: null,
    );
  }

  ChatState updateLastMessage(ChatMessage message) {
    if (messages.isEmpty) return addMessage(message);
    return copyWith(
      messages: [...messages.sublist(0, messages.length - 1), message],
    );
  }

  ChatState removeLoadingMessage() {
    return copyWith(
      messages: messages.where((m) => !m.isLoading).toList(),
    );
  }
}

class QuickAction {
  final String id;
  final String label;
  final String prompt;

  const QuickAction({
    required this.id,
    required this.label,
    required this.prompt,
  });
}

const quickActions = [
  QuickAction(
    id: 'create_plan',
    label: '创建减重计划',
    prompt: '我想创建一个减重计划，我现在70kg，想减到65kg，请帮我制定一个30天的计划',
  ),
  QuickAction(
    id: 'diet_analysis',
    label: '今日饮食分析',
    prompt: '请分析一下我今天的饮食情况，给我一些建议',
  ),
  QuickAction(
    id: 'sleep_advice',
    label: '睡眠建议',
    prompt: '根据我的睡眠情况，给我一些改善睡眠的建议',
  ),
  QuickAction(
    id: 'exercise_plan',
    label: '运动计划',
    prompt: '请给我制定一个简单的运动计划',
  ),
];
