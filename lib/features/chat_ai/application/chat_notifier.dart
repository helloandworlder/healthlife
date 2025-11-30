import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/utils/date_utils.dart';
import '../domain/chat_message.dart';
import 'ai_chat_service.dart';

part 'chat_notifier.g.dart';

@riverpod
class ChatNotifier extends _$ChatNotifier {
  @override
  ChatState build() => ChatState.initial();

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    state = state.addMessage(ChatMessage.user(content));
    state = state.copyWith(isLoading: true);
    state = state.addMessage(ChatMessage.loading());

    try {
      final context = await _buildHealthContext();
      state = state.copyWith(healthContext: context);

      final chatService = ref.read(aiChatServiceProvider);
      final response = await chatService.sendMessage(
        message: content,
        context: context,
        history: state.messages.where((m) => !m.isLoading).toList(),
      );

      state = state.removeLoadingMessage();
      state = state.addMessage(ChatMessage.assistant(response));
    } catch (e) {
      state = state.removeLoadingMessage();
      state = state.copyWith(error: e.toString());
      state = state.addMessage(ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        role: MessageRole.assistant,
        content: '抱歉，出现了一些问题，请稍后再试。',
        timestamp: DateTime.now(),
        error: e.toString(),
      ));
    } finally {
      state = state.copyWith(isLoading: false);
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
