import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/repositories/health_source_repository.dart';
import '../../application/onboarding_notifier.dart';

class HealthSourceConnectPage extends ConsumerStatefulWidget {
  const HealthSourceConnectPage({super.key});

  @override
  ConsumerState<HealthSourceConnectPage> createState() =>
      _HealthSourceConnectPageState();
}

class _HealthSourceConnectPageState
    extends ConsumerState<HealthSourceConnectPage> {
  bool _isConnecting = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingNotifierProvider);

    final sourceName = Platform.isIOS ? 'Apple Health' : 'Health Connect';
    final sourceIcon = Platform.isIOS ? Icons.favorite : Icons.health_and_safety;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            '连接健康数据源',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '连接 $sourceName 以自动同步你的运动和健康数据',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(height: 40),

          // Main connection card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: state.healthSourceConnected
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: state.healthSourceConnected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline.withValues(alpha: 0.3),
                width: state.healthSourceConnected ? 2 : 1,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: state.healthSourceConnected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    state.healthSourceConnected
                        ? Icons.check
                        : sourceIcon,
                    size: 40,
                    color: state.healthSourceConnected
                        ? Colors.white
                        : theme.colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  sourceName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  state.healthSourceConnected
                      ? '已连接'
                      : '未连接',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: state.healthSourceConnected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 24),
                if (!state.healthSourceConnected) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _isConnecting ? null : () => _connectHealthSource(context),
                      icon: _isConnecting
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: theme.colorScheme.onPrimary,
                              ),
                            )
                          : const Icon(Icons.link),
                      label: Text(_isConnecting ? '连接中...' : '连接 $sourceName'),
                    ),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '数据同步已开启',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          if (_errorMessage != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: theme.colorScheme.error,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 32),

          // Benefits section
          Text(
            '连接后可以获得',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildBenefitItem(
            context,
            icon: Icons.directions_walk,
            title: '步数追踪',
            description: '自动记录每日步数',
          ),
          _buildBenefitItem(
            context,
            icon: Icons.local_fire_department,
            title: '卡路里消耗',
            description: '准确计算每日热量消耗',
          ),
          _buildBenefitItem(
            context,
            icon: Icons.bedtime,
            title: '睡眠数据',
            description: '了解你的睡眠质量',
          ),
          _buildBenefitItem(
            context,
            icon: Icons.favorite,
            title: '心率监测',
            description: '追踪心率变化趋势',
          ),

          const SizedBox(height: 24),

          // Skip option hint
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.outline,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '你也可以跳过此步骤，之后在设置中连接',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 20,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _connectHealthSource(BuildContext context) async {
    setState(() {
      _isConnecting = true;
      _errorMessage = null;
    });

    try {
      final healthRepo = ref.read(healthSourceRepositoryProvider);
      final notifier = ref.read(onboardingNotifierProvider.notifier);

      // Check availability
      final available = await healthRepo.isAvailable();
      if (!available) {
        setState(() {
          _errorMessage = Platform.isIOS
              ? 'Apple Health 不可用。注意：iOS 模拟器不支持 HealthKit，请使用真机测试'
              : 'Health Connect 未安装，请先从 Play 商店安装';
          _isConnecting = false;
        });
        return;
      }

      // Request permissions
      final granted = await healthRepo.requestPermissions();
      if (granted) {
        notifier.setHealthSourceConnected(
          true,
          sourceType: Platform.isIOS ? 'apple_health' : 'health_connect',
        );
      } else {
        setState(() {
          _errorMessage = '权限未授予，无法访问健康数据';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = '连接失败: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isConnecting = false;
      });
    }
  }
}
