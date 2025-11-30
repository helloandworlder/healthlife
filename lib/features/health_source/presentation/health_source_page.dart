import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/providers.dart';
import '../../../core/constants/db_constants.dart';
import '../../../core/constants/health_types.dart';
import '../../../shared/repositories/health_source_repository.dart';
import '../../../shared/services/health_sync_service.dart';

class HealthSourcePage extends ConsumerStatefulWidget {
  const HealthSourcePage({super.key});

  @override
  ConsumerState<HealthSourcePage> createState() => _HealthSourcePageState();
}

class _HealthSourcePageState extends ConsumerState<HealthSourcePage> {
  bool _isConnected = false;
  bool _isConnecting = false;
  bool _isSyncing = false;
  String? _errorMessage;
  Map<HealthMetricType, DateTime?> _syncStates = {};

  @override
  void initState() {
    super.initState();
    _loadConnectionStatus();
    _loadSyncStates();
  }

  Future<void> _loadConnectionStatus() async {
    final db = ref.read(databaseProvider);
    final source = await db.settingsDao.getSetting(DbConstants.keyHealthSource);
    if (mounted) {
      setState(() {
        _isConnected = source != null && source != 'none';
      });
    }
  }

  Future<void> _loadSyncStates() async {
    try {
      final syncService = ref.read(healthSyncServiceProvider);
      final states = await syncService.getAllSyncStates();
      if (mounted) {
        setState(() {
          _syncStates = states;
        });
      }
    } catch (e) {
      // Ignore errors
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sourceName = Platform.isIOS ? 'Apple Health' : 'Health Connect';

    return Scaffold(
      appBar: AppBar(
        title: const Text('数据来源'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Connection status card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _isConnected
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isConnected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.outline.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: _isConnected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isConnected
                            ? Icons.check
                            : (Platform.isIOS ? Icons.favorite : Icons.health_and_safety),
                        size: 28,
                        color: _isConnected
                            ? Colors.white
                            : theme.colorScheme.outline,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sourceName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _isConnected ? '已连接' : '未连接',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: _isConnected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: _isConnected
                      ? OutlinedButton.icon(
                          onPressed: _isConnecting ? null : _disconnectHealthSource,
                          icon: const Icon(Icons.link_off),
                          label: const Text('断开连接'),
                        )
                      : ElevatedButton.icon(
                          onPressed: _isConnecting ? null : _connectHealthSource,
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
                  Icon(Icons.error_outline, color: theme.colorScheme.error, size: 20),
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

          if (_isConnected) ...[
            const SizedBox(height: 24),

            // Sync button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSyncing ? null : _syncData,
                icon: _isSyncing
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: theme.colorScheme.onPrimary,
                        ),
                      )
                    : const Icon(Icons.sync),
                label: Text(_isSyncing ? '同步中...' : '立即同步'),
              ),
            ),

            const SizedBox(height: 24),

            // Sync status
            Text(
              '同步状态',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ...HealthMetricType.values.map((type) {
              return _buildSyncStatusItem(theme, type);
            }),
          ],

          const SizedBox(height: 24),

          // Info section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: theme.colorScheme.outline,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '关于数据同步',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '连接后，HealthLife 会自动从 $sourceName 同步以下数据：\n'
                  '• 每日步数\n'
                  '• 活动消耗热量\n'
                  '• 运动时长\n'
                  '• 睡眠数据\n'
                  '• 心率和 HRV\n'
                  '• 体重记录\n\n'
                  '所有数据仅存储在您的设备上，不会上传到服务器。',
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

  Widget _buildSyncStatusItem(ThemeData theme, HealthMetricType type) {
    final lastSync = _syncStates[type];
    final typeNames = {
      HealthMetricType.steps: '步数',
      HealthMetricType.activeMinutes: '运动时长',
      HealthMetricType.caloriesBurned: '消耗热量',
      HealthMetricType.sleepHours: '睡眠',
      HealthMetricType.heartRate: '心率',
      HealthMetricType.hrv: 'HRV',
      HealthMetricType.weight: '体重',
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            lastSync != null ? Icons.check_circle : Icons.circle_outlined,
            size: 18,
            color: lastSync != null
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              typeNames[type] ?? type.name,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Text(
            lastSync != null
                ? DateFormat('MM-dd HH:mm').format(lastSync)
                : '未同步',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _connectHealthSource() async {
    setState(() {
      _isConnecting = true;
      _errorMessage = null;
    });

    try {
      final healthRepo = ref.read(healthSourceRepositoryProvider);

      final available = await healthRepo.isAvailable();
      if (!available) {
        setState(() {
          _errorMessage = Platform.isIOS
              ? 'Apple Health 不可用'
              : 'Health Connect 未安装';
          _isConnecting = false;
        });
        return;
      }

      final granted = await healthRepo.requestPermissions();
      if (granted) {
        final db = ref.read(databaseProvider);
        await db.settingsDao.setSetting(
          DbConstants.keyHealthSource,
          Platform.isIOS ? 'apple_health' : 'health_connect',
        );
        setState(() {
          _isConnected = true;
        });

        // Trigger initial sync
        await _syncData();
      } else {
        setState(() {
          _errorMessage = '权限未授予';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = '连接失败: ${e.toString()}';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isConnecting = false;
        });
      }
    }
  }

  Future<void> _disconnectHealthSource() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('断开连接'),
        content: const Text('断开后将停止自动同步健康数据。已同步的数据不会被删除。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('确认断开'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final db = ref.read(databaseProvider);
      await db.settingsDao.setSetting(DbConstants.keyHealthSource, 'none');
      await db.healthSyncDao.clearAllSyncTimes();

      if (mounted) {
        setState(() {
          _isConnected = false;
          _syncStates = {};
        });
      }
    }
  }

  Future<void> _syncData() async {
    setState(() {
      _isSyncing = true;
      _errorMessage = null;
    });

    try {
      final syncService = ref.read(healthSyncServiceProvider);
      final result = await syncService.syncAll();

      if (result.hasError) {
        setState(() {
          _errorMessage = result.error;
        });
      }

      await _loadSyncStates();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('同步完成，共处理 ${result.totalProcessed} 条数据'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = '同步失败: ${e.toString()}';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSyncing = false;
        });
      }
    }
  }
}
