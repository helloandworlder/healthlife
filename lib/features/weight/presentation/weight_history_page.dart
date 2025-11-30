import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/weight_notifier.dart';
import 'widgets/weight_chart.dart';

class WeightHistoryPage extends ConsumerStatefulWidget {
  const WeightHistoryPage({super.key});

  @override
  ConsumerState<WeightHistoryPage> createState() => _WeightHistoryPageState();
}

class _WeightHistoryPageState extends ConsumerState<WeightHistoryPage> {
  int _selectedDays = 30;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final historyAsync = ref.watch(weightHistoryNotifierProvider(days: _selectedDays));

    return Scaffold(
      appBar: AppBar(
        title: const Text('体重历史'),
      ),
      body: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('加载失败: $error')),
        data: (state) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildPeriodSelector(theme),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: WeightChart(
                  records: state.records,
                  minWeight: state.minWeight,
                  maxWeight: state.maxWeight,
                ),
              ),
              const SizedBox(height: 24),
              _buildStatsRow(context, state),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '记录列表',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _buildRecordList(context, state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(ThemeData theme) {
    return Row(
      children: [
        _PeriodChip(
          label: '7天',
          isSelected: _selectedDays == 7,
          onTap: () => setState(() => _selectedDays = 7),
        ),
        const SizedBox(width: 8),
        _PeriodChip(
          label: '30天',
          isSelected: _selectedDays == 30,
          onTap: () => setState(() => _selectedDays = 30),
        ),
        const SizedBox(width: 8),
        _PeriodChip(
          label: '90天',
          isSelected: _selectedDays == 90,
          onTap: () => setState(() => _selectedDays = 90),
        ),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context, WeightHistoryState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              label: '最低',
              value: state.minWeight?.toStringAsFixed(1) ?? '--',
              unit: 'kg',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              label: '最高',
              value: state.maxWeight?.toStringAsFixed(1) ?? '--',
              unit: 'kg',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              label: '平均',
              value: state.avgWeight?.toStringAsFixed(1) ?? '--',
              unit: 'kg',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _StatCard(
              label: '变化',
              value: state.totalChange != null
                  ? '${state.totalChange! >= 0 ? '+' : ''}${state.totalChange!.toStringAsFixed(1)}'
                  : '--',
              unit: 'kg',
              valueColor: state.totalChange != null
                  ? (state.totalChange! < 0 ? Colors.green : Colors.red)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordList(BuildContext context, WeightHistoryState state) {
    final theme = Theme.of(context);
    if (state.records.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Text(
            '暂无体重记录',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.records.length,
      itemBuilder: (context, index) {
        final record = state.records[index];
        final date = record.recordedAt;

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              '${date.day}',
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            '${record.weight.toStringAsFixed(1)} kg',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${date.year}年${date.month}月${date.day}日 '
            '${date.hour.toString().padLeft(2, '0')}:'
            '${date.minute.toString().padLeft(2, '0')}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          trailing: Text(
            record.source == 'manual' ? '手动' : '同步',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        );
      },
    );
  }
}

class _PeriodChip extends StatelessWidget {
  const _PeriodChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.unit,
    this.valueColor,
  });

  final String label;
  final String value;
  final String unit;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: valueColor,
              ),
            ),
            Text(
              unit,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
