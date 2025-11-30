import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/constants/db_constants.dart';
import '../domain/chat_message.dart' as domain;

part 'ai_chat_service.g.dart';

/// AI 配置
class AiConfig {
  final String endpoint;
  final String apiKey;
  final String model;
  final bool isConfigured;

  const AiConfig({
    required this.endpoint,
    required this.apiKey,
    required this.model,
    required this.isConfigured,
  });

  factory AiConfig.empty() => const AiConfig(
        endpoint: '',
        apiKey: '',
        model: '',
        isConfigured: false,
      );
}

@riverpod
Future<AiConfig> aiConfig(Ref ref) async {
  final settings = await ref.watch(appSettingsProvider.future);

  final endpoint = settings[DbConstants.keyAiEndpoint] ?? '';
  final apiKey = settings[DbConstants.keyAiApiKey] ?? '';
  final model = settings[DbConstants.keyAiModel] ?? DbConstants.defaultAiModel;

  return AiConfig(
    endpoint: endpoint.isNotEmpty ? endpoint : DbConstants.defaultAiEndpoint,
    apiKey: apiKey,
    model: model,
    isConfigured: apiKey.isNotEmpty,
  );
}

@Riverpod(keepAlive: true)
AiChatService aiChatService(Ref ref) {
  return LangChainAiChatService(ref);
}

abstract class AiChatService {
  Future<String> sendMessage({
    required String message,
    required domain.HealthContext context,
    List<domain.ChatMessage>? history,
  });

  Stream<String> streamMessage({
    required String message,
    required domain.HealthContext context,
    List<domain.ChatMessage>? history,
  });

  Future<bool> isConfigured();
}

/// LangChain + OpenAI Compatible API 实现
class LangChainAiChatService implements AiChatService {
  final Ref _ref;

  LangChainAiChatService(this._ref);

  @override
  Future<bool> isConfigured() async {
    final config = await _ref.read(aiConfigProvider.future);
    return config.isConfigured;
  }

  @override
  Future<String> sendMessage({
    required String message,
    required domain.HealthContext context,
    List<domain.ChatMessage>? history,
  }) async {
    final config = await _ref.read(aiConfigProvider.future);

    if (!config.isConfigured) {
      throw AiNotConfiguredException('请先在设置中配置 AI 服务的 API Key');
    }

    final chat = ChatOpenAI(
      apiKey: config.apiKey,
      baseUrl: config.endpoint,
      defaultOptions: ChatOpenAIOptions(
        model: config.model,
        temperature: 0.7,
        maxTokens: 500,
      ),
    );

    final messages = _buildMessages(context, message, history);

    try {
      final response = await chat.invoke(PromptValue.chat(messages));
      return response.output.content;
    } catch (e) {
      _handleError(e);
    }
  }

  @override
  Stream<String> streamMessage({
    required String message,
    required domain.HealthContext context,
    List<domain.ChatMessage>? history,
  }) async* {
    final config = await _ref.read(aiConfigProvider.future);

    if (!config.isConfigured) {
      throw AiNotConfiguredException('请先在设置中配置 AI 服务的 API Key');
    }

    final chat = ChatOpenAI(
      apiKey: config.apiKey,
      baseUrl: config.endpoint,
      defaultOptions: ChatOpenAIOptions(
        model: config.model,
        temperature: 0.7,
        maxTokens: 500,
      ),
    );

    final messages = _buildMessages(context, message, history);

    try {
      final stream = chat.stream(PromptValue.chat(messages));
      await for (final chunk in stream) {
        yield chunk.output.content;
      }
    } catch (e) {
      _handleError(e);
    }
  }

  List<ChatMessage> _buildMessages(
    domain.HealthContext ctx,
    String userMessage,
    List<domain.ChatMessage>? history,
  ) {
    final systemPrompt = _buildSystemPrompt(ctx);

    return [
      ChatMessage.system(systemPrompt),
      if (history != null)
        for (final msg in history)
          msg.role == domain.MessageRole.user
              ? ChatMessage.humanText(msg.content)
              : ChatMessage.ai(msg.content),
      ChatMessage.humanText(userMessage),
    ];
  }

  String _buildSystemPrompt(domain.HealthContext ctx) => '''
你是一个可爱的健康助手 TATA，帮助用户养成健康习惯。

用户今日数据:
- 步数: ${ctx.todaySteps}
- 消耗热量: ${ctx.todayCaloriesBurned} kcal
- 摄入热量: ${ctx.todayCaloriesIntake} kcal
- 睡眠: ${ctx.sleepHours} 小时
- 目标完成: ${ctx.completedGoals}/${ctx.goals.length}
${ctx.currentWeight != null ? '- 当前体重: ${ctx.currentWeight} kg' : ''}
${ctx.targetWeight != null ? '- 目标体重: ${ctx.targetWeight} kg' : ''}

规则:
1. 给出积极、鼓励性的建议
2. 不提供任何医疗诊断或处方建议
3. 建议要具体、可执行
4. 语气温和、可爱，像一个关心用户的小伙伴
5. 回复简洁，不超过200字
6. 如果用户询问医疗相关问题，提醒他们咨询专业医生
''';

  Never _handleError(Object e) {
    final errorStr = e.toString();
    if (errorStr.contains('401') || errorStr.contains('Unauthorized')) {
      throw AiNotConfiguredException('API Key 无效，请检查设置');
    }
    if (errorStr.contains('timeout') || errorStr.contains('SocketException')) {
      throw AiNetworkException('网络连接失败，请检查网络或 Endpoint 设置');
    }
    if (errorStr.contains('404')) {
      throw AiNetworkException('API 地址错误，请检查 Endpoint 设置');
    }
    throw AiException('AI 服务异常: $e');
  }
}

/// AI 异常基类
class AiException implements Exception {
  final String message;
  AiException(this.message);

  @override
  String toString() => message;
}

/// AI 未配置异常
class AiNotConfiguredException extends AiException {
  AiNotConfiguredException(super.message);
}

/// AI 网络异常
class AiNetworkException extends AiException {
  AiNetworkException(super.message);
}
