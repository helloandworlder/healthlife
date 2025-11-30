import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
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
  return AiChatServiceImpl(ref);
}

/// Tool 定义
class AiTool {
  final String name;
  final String description;
  final Map<String, dynamic> parameters;

  const AiTool({
    required this.name,
    required this.description,
    required this.parameters,
  });

  Map<String, dynamic> toJson() => {
    'type': 'function',
    'function': {
      'name': name,
      'description': description,
      'parameters': parameters,
    },
  };
}

/// Tool 调用结果
class ToolCall {
  final String id;
  final String name;
  final Map<String, dynamic> arguments;

  const ToolCall({
    required this.id,
    required this.name,
    required this.arguments,
  });
}

/// AI 响应结果
class AiResponse {
  final String content;
  final String? thinkingContent;
  final List<ToolCall> toolCalls;

  const AiResponse({
    required this.content,
    this.thinkingContent,
    this.toolCalls = const [],
  });
}

abstract class AiChatService {
  Future<AiResponse> sendMessage({
    required String message,
    required domain.HealthContext context,
    List<domain.ChatMessage>? history,
    List<AiTool>? tools,
  });

  Future<bool> isConfigured();
  Future<List<String>> fetchAvailableModels();
}

class AiChatServiceImpl implements AiChatService {
  final Ref _ref;

  AiChatServiceImpl(this._ref);

  @override
  Future<bool> isConfigured() async {
    final config = await _ref.read(aiConfigProvider.future);
    return config.isConfigured;
  }

  @override
  Future<AiResponse> sendMessage({
    required String message,
    required domain.HealthContext context,
    List<domain.ChatMessage>? history,
    List<AiTool>? tools,
  }) async {
    final config = await _ref.read(aiConfigProvider.future);

    if (!config.isConfigured) {
      throw AiNotConfiguredException('请先在设置中配置 AI 服务的 API Key');
    }

    final messages = _buildOpenAIMessages(context, message, history);

    try {
      final endpoint = config.endpoint.endsWith('/')
          ? '${config.endpoint}chat/completions'
          : '${config.endpoint}/chat/completions';

      final body = <String, dynamic>{
        'model': config.model,
        'messages': messages,
        'temperature': 0.7,
        'max_tokens': 1000,
      };

      if (tools != null && tools.isNotEmpty) {
        body['tools'] = tools.map((t) => t.toJson()).toList();
        body['tool_choice'] = 'auto';
      }

      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Authorization': 'Bearer ${config.apiKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final choice = data['choices']?[0];
        final messageData = choice?['message'];
        
        if (messageData == null) {
          throw AiException('AI 返回了空内容');
        }

        final content = messageData['content'] as String? ?? '';
        final toolCallsData = messageData['tool_calls'] as List?;

        final toolCalls = <ToolCall>[];
        if (toolCallsData != null) {
          for (final tc in toolCallsData) {
            final function = tc['function'];
            if (function != null) {
              toolCalls.add(ToolCall(
                id: tc['id'] ?? '',
                name: function['name'] ?? '',
                arguments: jsonDecode(function['arguments'] ?? '{}'),
              ));
            }
          }
        }

        // Parse thinking content from <think> tags
        final parsed = _parseThinkingContent(content);

        return AiResponse(
          content: parsed.content,
          thinkingContent: parsed.thinking,
          toolCalls: toolCalls,
        );
      } else {
        final errorBody = response.body;
        _handleHttpError(response.statusCode, errorBody);
      }
    } catch (e) {
      if (e is AiException) rethrow;
      throw AiException('请求失败: $e');
    }
  }

  /// 解析 <think></think> 标签
  ({String content, String? thinking}) _parseThinkingContent(String text) {
    final thinkRegex = RegExp(r'<think>([\s\S]*?)</think>', caseSensitive: false);
    final matches = thinkRegex.allMatches(text);
    
    if (matches.isEmpty) {
      return (content: text.trim(), thinking: null);
    }

    String thinking = '';
    String content = text;
    
    for (final match in matches) {
      thinking += '${match.group(1)?.trim() ?? ''}\n';
      content = content.replaceFirst(match.group(0)!, '');
    }

    return (
      content: content.trim(),
      thinking: thinking.trim().isEmpty ? null : thinking.trim(),
    );
  }

  List<Map<String, dynamic>> _buildOpenAIMessages(
    domain.HealthContext ctx,
    String userMessage,
    List<domain.ChatMessage>? history,
  ) {
    final messages = <Map<String, dynamic>>[
      {'role': 'system', 'content': _buildSystemPrompt(ctx)},
    ];

    if (history != null) {
      for (final msg in history) {
        if (msg.content.isEmpty || msg.error != null) continue;
        messages.add({
          'role': msg.role == domain.MessageRole.user ? 'user' : 'assistant',
          'content': msg.content,
        });
      }
    }

    messages.add({'role': 'user', 'content': userMessage});
    return messages;
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

你可以使用 Markdown 格式来美化回复，包括：
- **粗体** 强调重要内容
- 使用列表组织建议
- 使用 > 引用块突出提示

规则:
1. 给出积极、鼓励性的建议
2. 不提供任何医疗诊断或处方建议
3. 建议要具体、可执行
4. 语气温和、可爱，像一个关心用户的小伙伴
5. 回复简洁，不超过300字
6. 如果用户询问医疗相关问题，提醒他们咨询专业医生
7. 当用户想要创建减重计划时，使用 create_plan 工具来帮助他们
''';

  @override
  Future<List<String>> fetchAvailableModels() async {
    final config = await _ref.read(aiConfigProvider.future);

    if (!config.isConfigured) {
      throw AiNotConfiguredException('请先在设置中配置 AI 服务的 API Key');
    }

    try {
      final url = Uri.parse('${config.endpoint}/models');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${config.apiKey}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final models = <String>[];
        if (data['data'] != null && data['data'] is List) {
          for (final model in data['data']) {
            if (model['id'] != null) {
              models.add(model['id'].toString());
            }
          }
        }
        models.sort();
        return models;
      } else if (response.statusCode == 401) {
        throw AiNotConfiguredException('API Key 无效');
      } else {
        throw AiNetworkException('获取模型列表失败: ${response.statusCode}');
      }
    } catch (e) {
      if (e is AiException) rethrow;
      throw AiNetworkException('网络错误: $e');
    }
  }

  Never _handleHttpError(int statusCode, String body) {
    if (statusCode == 401) {
      throw AiNotConfiguredException('API Key 无效，请检查设置');
    }
    if (statusCode == 404) {
      throw AiNetworkException('API 地址错误，请检查 Endpoint 设置');
    }
    if (statusCode == 429) {
      throw AiNetworkException('请求频率过高，请稍后再试');
    }
    if (statusCode >= 500) {
      throw AiNetworkException('AI 服务暂时不可用，请稍后再试');
    }
    throw AiNetworkException('请求失败 ($statusCode): $body');
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
