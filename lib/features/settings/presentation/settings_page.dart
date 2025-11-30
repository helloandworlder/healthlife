import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/db_constants.dart';
import '../../../core/constants/route_names.dart';
import '../../../shared/widgets/loading_state.dart';
import '../application/settings_notifier.dart';
import 'widgets/activity_heatmap.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final settingsAsync = ref.watch(settingsNotifierProvider);
    final heatmapAsync = ref.watch(activityHeatmapDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: settingsAsync.when(
        loading: () => const LoadingState(),
        error: (e, _) => Center(child: Text('加载失败: $e')),
        data: (settings) => ListView(
          children: [
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '活力指数',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  heatmapAsync.when(
                    loading: () => const SizedBox(
                      height: 100,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (_, __) => const SizedBox(height: 100),
                    data: (data) => ActivityHeatmap(activityData: data),
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildSettingItem(
              context,
              icon: Icons.person_outline,
              title: '关于你',
              onTap: () => context.push(RoutePaths.profile),
            ),
            _buildSettingItem(
              context,
              icon: Icons.sync_outlined,
              title: '数据来源',
              onTap: () => context.push(RoutePaths.healthSource),
            ),
            _buildSettingItem(
              context,
              icon: Icons.calendar_month_outlined,
              title: '每周回顾',
              onTap: () => context.push(RoutePaths.weeklyReview),
            ),
            _buildSettingItem(
              context,
              icon: Icons.chat_outlined,
              title: '健康助手',
              onTap: () => context.push(RoutePaths.chat),
            ),
            const Divider(),
            _buildSettingItem(
              context,
              icon: Icons.language_outlined,
              title: '语言',
              trailing: Text(
                settings.languageDisplay,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              onTap: () => _showLanguagePicker(context, ref, settings.language),
            ),
            _buildSettingItem(
              context,
              icon: Icons.notifications_outlined,
              title: '通知',
              trailing: Switch(
                value: settings.notificationsEnabled,
                onChanged: (value) {
                  ref.read(settingsNotifierProvider.notifier).setNotificationsEnabled(value);
                },
              ),
            ),
            _buildSettingItem(
              context,
              icon: Icons.straighten_outlined,
              title: '单位',
              trailing: Text(
                settings.unitDisplay,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              onTap: () => _showUnitPicker(context, ref, settings),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.smart_toy_outlined, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    'AI 助手配置',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  if (settings.isAiConfigured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle, size: 14, color: Colors.green),
                          SizedBox(width: 4),
                          Text('已配置', style: TextStyle(fontSize: 12, color: Colors.green)),
                        ],
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning_amber, size: 14, color: Colors.orange),
                          SizedBox(width: 4),
                          Text('未配置', style: TextStyle(fontSize: 12, color: Colors.orange)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            _buildSettingItem(
              context,
              icon: Icons.dns_outlined,
              title: 'API 端点',
              trailing: Text(
                settings.aiEndpoint.isEmpty 
                    ? DbConstants.defaultAiEndpoint 
                    : _truncateUrl(settings.aiEndpoint),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              onTap: () => _showAiEndpointDialog(context, ref, settings.aiEndpoint),
            ),
            _buildSettingItem(
              context,
              icon: Icons.key_outlined,
              title: 'API Key',
              trailing: Text(
                settings.aiApiKey.isEmpty ? '未设置' : _maskApiKey(settings.aiApiKey),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: settings.aiApiKey.isEmpty 
                      ? theme.colorScheme.error 
                      : theme.colorScheme.outline,
                ),
              ),
              onTap: () => _showAiApiKeyDialog(context, ref, settings.aiApiKey),
            ),
            _buildSettingItem(
              context,
              icon: Icons.model_training_outlined,
              title: '模型',
              trailing: Text(
                settings.aiModel,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              onTap: () => _showAiModelDialog(context, ref, settings.aiModel),
            ),
            const Divider(),
            _buildSettingItem(
              context,
              icon: Icons.update_outlined,
              title: '更新日志',
              onTap: () => _showVersionHistory(context),
            ),
            _buildSettingItem(
              context,
              icon: Icons.help_outline,
              title: '常见问题',
              onTap: () => _showFAQ(context),
            ),
            _buildSettingItem(
              context,
              icon: Icons.feedback_outlined,
              title: '问题反馈',
              onTap: () => _showFeedback(context),
            ),
            _buildSettingItem(
              context,
              icon: Icons.privacy_tip_outlined,
              title: '隐私协议',
              onTap: () => _showPrivacyPolicy(context),
            ),
            _buildSettingItem(
              context,
              icon: Icons.description_outlined,
              title: '用户协议',
              onTap: () => _showTermsOfService(context),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'HealthLife v1.0.0',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    bool enabled = true,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: enabled ? theme.colorScheme.onSurface : theme.colorScheme.outline,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: enabled ? theme.colorScheme.onSurface : theme.colorScheme.outline,
        ),
      ),
      trailing: trailing ??
          (onTap != null
              ? Icon(Icons.chevron_right, color: theme.colorScheme.outline)
              : null),
      onTap: enabled ? onTap : null,
    );
  }

  void _showLanguagePicker(BuildContext context, WidgetRef ref, String current) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('中文'),
              trailing: current == DbConstants.langZh ? const Icon(Icons.check) : null,
              onTap: () {
                ref.read(settingsNotifierProvider.notifier).setLanguage(DbConstants.langZh);
                Navigator.pop(ctx);
              },
            ),
            ListTile(
              title: const Text('English'),
              trailing: current == DbConstants.langEn ? const Icon(Icons.check) : null,
              onTap: () {
                ref.read(settingsNotifierProvider.notifier).setLanguage(DbConstants.langEn);
                Navigator.pop(ctx);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUnitPicker(BuildContext context, WidgetRef ref, SettingsState settings) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('体重单位', style: Theme.of(ctx).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _UnitOption(
                      label: 'kg',
                      selected: settings.weightUnit == DbConstants.unitKg,
                      onTap: () => ref.read(settingsNotifierProvider.notifier)
                          .setWeightUnit(DbConstants.unitKg),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _UnitOption(
                      label: 'lb',
                      selected: settings.weightUnit == DbConstants.unitLb,
                      onTap: () => ref.read(settingsNotifierProvider.notifier)
                          .setWeightUnit(DbConstants.unitLb),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('身高单位', style: Theme.of(ctx).textTheme.titleMedium),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _UnitOption(
                      label: 'cm',
                      selected: settings.heightUnit == DbConstants.unitCm,
                      onTap: () => ref.read(settingsNotifierProvider.notifier)
                          .setHeightUnit(DbConstants.unitCm),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _UnitOption(
                      label: 'inch',
                      selected: settings.heightUnit == DbConstants.unitInch,
                      onTap: () => ref.read(settingsNotifierProvider.notifier)
                          .setHeightUnit(DbConstants.unitInch),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showVersionHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('更新日志'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('v1.0.0 (2025-11-30)', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('• 首次发布\n• 健康数据同步\n• 目标管理与打卡\n• 宠物养成系统\n• AI健康助手\n• 每周回顾与分享'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showFAQ(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('常见问题'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Q: 如何连接健康数据?', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('A: 前往设置 > 数据来源，点击连接按钮即可。\n'),
              Text('Q: 数据会上传到服务器吗?', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('A: 不会，所有数据仅存储在您的设备本地。\n'),
              Text('Q: 如何重置宠物?', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('A: 目前不支持重置，宠物会一直陪伴您。'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showFeedback(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('问题反馈'),
        content: const Text('如有问题或建议，请发送邮件至:\n\nsupport@healthlife.app'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('隐私协议'),
        content: const SingleChildScrollView(
          child: Text(
            'HealthLife 尊重并保护您的隐私。\n\n'
            '1. 数据收集\n我们收集的数据仅用于提供健康追踪服务，包括体重、步数、睡眠等健康指标。\n\n'
            '2. 数据存储\n所有数据均存储在您的设备本地，不会上传至服务器。\n\n'
            '3. 数据使用\n我们不会将您的数据用于任何商业目的或与第三方共享。\n\n'
            '4. 数据删除\n您可以随时通过卸载应用来删除所有数据。',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showTermsOfService(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('用户协议'),
        content: const SingleChildScrollView(
          child: Text(
            '欢迎使用 HealthLife！\n\n'
            '1. 服务说明\n本应用提供健康数据记录和追踪功能，帮助您养成健康习惯。\n\n'
            '2. 免责声明\n本应用提供的所有内容仅供参考，不构成医疗建议。如有健康问题，请咨询专业医生。\n\n'
            '3. 使用规范\n请勿将本应用用于任何非法目的。\n\n'
            '4. 知识产权\n本应用的所有内容（包括但不限于文字、图片、代码）均受知识产权保护。',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  String _truncateUrl(String url) {
    if (url.length <= 30) return url;
    return '${url.substring(0, 27)}...';
  }

  String _maskApiKey(String apiKey) {
    if (apiKey.length <= 8) return '****';
    return '${apiKey.substring(0, 4)}...${apiKey.substring(apiKey.length - 4)}';
  }

  void _showAiEndpointDialog(BuildContext context, WidgetRef ref, String current) {
    final controller = TextEditingController(
      text: current.isEmpty ? DbConstants.defaultAiEndpoint : current,
    );
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('API 端点'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '设置 OpenAI Compatible API 端点地址',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'https://api.openai.com/v1',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 8),
            const Text(
              '支持 OpenAI、Azure、Ollama、LM Studio 等兼容接口',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              ref.read(settingsNotifierProvider.notifier).setAiEndpoint(controller.text.trim());
              Navigator.pop(ctx);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }

  void _showAiApiKeyDialog(BuildContext context, WidgetRef ref, String current) {
    final controller = TextEditingController(text: current);
    var obscure = true;
    
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('API Key'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '输入你的 API Key（本地存储，不会上传）',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: 'sk-...',
                  border: const OutlineInputBorder(),
                  isDense: true,
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '你的 API Key 仅存储在设备本地，不会发送到任何服务器',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                ref.read(settingsNotifierProvider.notifier).setAiApiKey(controller.text.trim());
                Navigator.pop(ctx);
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAiModelDialog(BuildContext context, WidgetRef ref, String current) {
    final controller = TextEditingController(text: current);
    final models = ['gpt-4o-mini', 'gpt-4o', 'gpt-4-turbo', 'gpt-3.5-turbo', 'claude-3-haiku', 'deepseek-chat'];
    
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('模型'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '选择或输入模型名称',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'gpt-4o-mini',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: models.map((model) => ActionChip(
                label: Text(model, style: const TextStyle(fontSize: 12)),
                onPressed: () => controller.text = model,
              )).toList(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              ref.read(settingsNotifierProvider.notifier).setAiModel(controller.text.trim());
              Navigator.pop(ctx);
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}

class _UnitOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _UnitOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? theme.colorScheme.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
