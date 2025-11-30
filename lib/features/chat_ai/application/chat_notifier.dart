import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_utils.dart';
import '../../dashboard/application/dashboard_notifier.dart';
import '../domain/chat_message.dart';
import 'ai_chat_service.dart';

part 'chat_notifier.g.dart';

/// 创建计划 Tool 定义
final createPlanTool = AiTool(
  name: 'create_plan',
  description: '为用户创建一个减重计划。当用户表达想要减肥、制定计划、设定目标体重时使用此工具。',
  parameters: {
    'type': 'object',
    'properties': {
      'initial_weight': {
        'type': 'number',
        'description': '用户当前体重（kg）',
      },
      'target_weight': {
        'type': 'number',
        'description': '目标体重（kg）',
      },
      'duration_days': {
        'type': 'integer',
        'description': '计划持续天数，建议 30、60 或 90 天',
        'enum': [30, 60, 90],
      },
      'daily_calorie_deficit': {
        'type': 'integer',
        'description': '每日热量缺口（kcal），建议 300-800',
      },
    },
    'required': ['initial_weight', 'target_weight', 'duration_days'],
  },
);

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  ChatState build() => ChatState.initial();

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    // Handle /models command
    if (content.trim().toLowerCase() == '/models') {
      await _handleModelsCommand(content);
      return;
    }

    state = state.addMessage(ChatMessage.user(content));
    state = state.copyWith(isLoading: true);
    state = state.addMessage(ChatMessage.loading());

    try {
      HealthContext context;
      try {
        context = await _buildHealthContext();
      } catch (e) {
        context = const HealthContext(
          todaySteps: 0,
          todayCaloriesBurned: 0,
          todayCaloriesIntake: 0,
          sleepHours: 0,
          goals: [],
        );
      }

      final chatService = ref.read(aiChatServiceProvider);
      final historyMessages = state.messages
          .where((m) => !m.isLoading)
          .toList();
      final history = historyMessages.length > 1
          ? historyMessages.sublist(0, historyMessages.length - 1)
          : <ChatMessage>[];

      final response = await chatService.sendMessage(
        message: content,
        context: context,
        history: history.isEmpty ? null : history,
        tools: [createPlanTool],
      );

      state = state.removeLoadingMessage();

      // Handle tool calls
      if (response.toolCalls.isNotEmpty) {
        await _handleToolCalls(response.toolCalls, response.content, response.thinkingContent);
      } else {
        state = state.addMessage(ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          role: MessageRole.assistant,
          content: response.content,
          timestamp: DateTime.now(),
          thinkingContent: response.thinkingContent,
        ));
      }
    } catch (e, stackTrace) {
      state = state.removeLoadingMessage();
      state = state.copyWith(error: e.toString());

      String errorMessage;
      if (e is AiNotConfiguredException) {
        errorMessage = e.message;
      } else if (e is AiNetworkException) {
        errorMessage = e.message;
      } else if (e is AiException) {
        errorMessage = e.message;
      } else {
        final stackLine = stackTrace.toString().split('\n').take(2).join('\n');
        errorMessage = '发送失败: $e\n\n调试信息:\n$stackLine';
      }

      state = state.addMessage(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: errorMessage,
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _handleModelsCommand(String content) async {
    state = state.addMessage(ChatMessage.user(content));
    state = state.copyWith(isLoading: true);
    state = state.addMessage(ChatMessage.loading());

    try {
      final chatService = ref.read(aiChatServiceProvider);
      final models = await chatService.fetchAvailableModels();

      state = state.removeLoadingMessage();

      if (models.isEmpty) {
        state = state.addMessage(ChatMessage.assistant('未能获取到可用模型列表，请检查 API 配置。'));
      } else {
        final modelList = models.map((m) => '- `$m`').join('\n');
        state = state.addMessage(ChatMessage.assistant('**可用模型列表：**\n\n$modelList'));
      }
    } catch (e) {
      state = state.removeLoadingMessage();
      state = state.addMessage(ChatMessage.assistant('获取模型列表失败: ${e.toString()}'));
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _handleToolCalls(List<ToolCall> toolCalls, String content, String? thinkingContent) async {
    for (final toolCall in toolCalls) {
      if (toolCall.name == 'create_plan') {
        await _handleCreatePlanTool(toolCall, content, thinkingContent);
      }
    }
  }

  Future<void> _handleCreatePlanTool(ToolCall toolCall, String content, String? thinkingContent) async {
    final args = toolCall.arguments;
    final initialWeight = (args['initial_weight'] as num?)?.toDouble();
    final targetWeight = (args['target_weight'] as num?)?.toDouble();
    final durationDays = args['duration_days'] as int? ?? 30;
    final dailyCalorieDeficit = args['daily_calorie_deficit'] as int? ?? 500;

    if (initialWeight == null || targetWeight == null) {
      state = state.addMessage(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: '抱歉，我需要知道你的当前体重和目标体重才能创建计划。请告诉我这些信息。',
        timestamp: DateTime.now(),
        thinkingContent: thinkingContent,
      ));
      return;
    }

    if (initialWeight <= targetWeight) {
      state = state.addMessage(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: '目标体重需要小于当前体重哦！请重新告诉我你的目标。',
        timestamp: DateTime.now(),
        thinkingContent: thinkingContent,
      ));
      return;
    }

    try {
      final dashboardNotifier = ref.read(dashboardNotifierProvider.notifier);
      await dashboardNotifier.createPlan(
        initialWeight: initialWeight,
        targetWeight: targetWeight,
        durationDays: durationDays,
        dailyCalorieDeficit: dailyCalorieDeficit,
      );

      final weightDiff = initialWeight - targetWeight;
      final responseContent = content.isNotEmpty 
          ? content 
          : '''**计划创建成功！** 🎉

我已经为你创建了减重计划：

| 项目 | 数值 |
|------|------|
| 当前体重 | ${initialWeight.toStringAsFixed(1)} kg |
| 目标体重 | ${targetWeight.toStringAsFixed(1)} kg |
| 计划减重 | ${weightDiff.toStringAsFixed(1)} kg |
| 计划时长 | $durationDays 天 |
| 每日热量缺口 | $dailyCalorieDeficit kcal |

> 💡 回到"今天"页面可以查看你的计划进度！

加油，我会一直陪伴你的！''';

      state = state.addMessage(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: responseContent,
        timestamp: DateTime.now(),
        thinkingContent: thinkingContent,
        toolResult: ToolResult(
          toolName: 'create_plan',
          success: true,
          message: '计划创建成功',
        ),
      ));
    } catch (e) {
      state = state.addMessage(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: '抱歉，创建计划时出错了：$e',
        timestamp: DateTime.now(),
        thinkingContent: thinkingContent,
        error: e.toString(),
      ));
    }
  }

  void useQuickAction(QuickAction action) {
    sendMessage(action.prompt);
  }

  void clearChat() {
    state = ChatState.initial();
  }

  Future<HealthContext> _buildHealthContext() async {
    final db = ref.read(databaseProvider);
    final today = DateTime.now().dateOnly;

    final metrics = await db.metricsDao.getMetricsForDate(today);
    final meals = await db.mealDao.getMealsForDate(today);
    final goals = await db.goalDao.getAllGoals();
    final goalLogs = await db.goalDao.getLogsForDate(today);
    final profile = await db.userProfileDao.getProfile();
    final plan = await db.planDao.getActivePlan();

    final goalProgressList = goals.map((g) {
      final log = goalLogs.where((l) => l.goalId == g.id).firstOrNull;
      return GoalProgress(
        name: g.name,
        progress: log?.progress ?? 0,
        target: g.target,
        isCompleted: (log?.progress ?? 0) >= g.target,
      );
    }).toList();

    return HealthContext(
      todaySteps: metrics?.steps ?? 0,
      todayCaloriesBurned: metrics?.caloriesBurned ?? 0,
      todayCaloriesIntake: meals.fold(0, (sum, m) => sum + m.calories),
      sleepHours: metrics?.sleepHours ?? 0,
      goals: goalProgressList,
      currentWeight: profile?.weight,
      targetWeight: plan?.targetWeight,
    );
  }
}
