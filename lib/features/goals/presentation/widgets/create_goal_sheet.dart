import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/health_types.dart';
import '../../domain/goal_template.dart';
import '../../application/goals_notifier.dart';

class CreateGoalSheet extends ConsumerStatefulWidget {
  const CreateGoalSheet({super.key});

  @override
  ConsumerState<CreateGoalSheet> createState() => _CreateGoalSheetState();
}

class _CreateGoalSheetState extends ConsumerState<CreateGoalSheet> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _categories = ['recommend', 'sleep', 'habits'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              _buildHeader(theme),
              TabBar(
                controller: _tabController,
                tabs: _categories.map((c) => Tab(text: GoalTemplates.getCategoryName(c))).toList(),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _categories.map((c) => _buildTemplateList(c, scrollController)).toList(),
                ),
              ),
              _buildCustomButton(theme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '添加目标',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateList(String category, ScrollController scrollController) {
    final templates = GoalTemplates.getByCategory(category);
    final theme = Theme.of(context);

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: templates.length,
      itemBuilder: (context, index) {
        final template = templates[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(template.icon, style: const TextStyle(fontSize: 24)),
              ),
            ),
            title: Text(template.name),
            subtitle: Text(
              '${template.period.displayName} · 目标 ${template.target} 次',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => _addGoalFromTemplate(template),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCustomButton(ThemeData theme) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton.icon(
          onPressed: _showCustomGoalDialog,
          icon: const Icon(Icons.edit),
          label: const Text('创建自定义目标'),
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
        ),
      ),
    );
  }

  Future<void> _addGoalFromTemplate(GoalTemplate template) async {
    await ref.read(goalsNotifierProvider.notifier).createGoal(
      name: template.name,
      icon: template.icon,
      period: template.period.name,
      target: template.target,
    );
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('已添加目标: ${template.name}')),
      );
    }
  }

  void _showCustomGoalDialog() {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const GoalEditSheet(),
    );
  }
}

class GoalEditSheet extends ConsumerStatefulWidget {
  final int? goalId;
  final String? initialName;
  final String? initialIcon;
  final GoalPeriod? initialPeriod;
  final int? initialTarget;
  final String? initialReminderTime;

  const GoalEditSheet({
    super.key,
    this.goalId,
    this.initialName,
    this.initialIcon,
    this.initialPeriod,
    this.initialTarget,
    this.initialReminderTime,
  });

  @override
  ConsumerState<GoalEditSheet> createState() => _GoalEditSheetState();
}

class _GoalEditSheetState extends ConsumerState<GoalEditSheet> {
  late TextEditingController _nameController;
  late String _selectedIcon;
  late GoalPeriod _selectedPeriod;
  late int _target;
  TimeOfDay? _reminderTime;
  bool _showIconPicker = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _selectedIcon = widget.initialIcon ?? '🎯';
    _selectedPeriod = widget.initialPeriod ?? GoalPeriod.daily;
    _target = widget.initialTarget ?? 1;
    if (widget.initialReminderTime != null) {
      final parts = widget.initialReminderTime!.split(':');
      if (parts.length == 2) {
        _reminderTime = TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEditing = widget.goalId != null;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.outline.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                isEditing ? '编辑目标' : '自定义目标',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            _buildIconSelector(theme),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '目标名称',
                hintText: '输入目标名称',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            _buildPeriodSelector(theme),
            const SizedBox(height: 16),
            _buildTargetSelector(theme),
            const SizedBox(height: 16),
            _buildReminderSelector(theme),
            const SizedBox(height: 24),
            Row(
              children: [
                if (isEditing) ...[
                  OutlinedButton(
                    onPressed: _deleteGoal,
                    style: OutlinedButton.styleFrom(foregroundColor: theme.colorScheme.error),
                    child: const Text('删除'),
                  ),
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: FilledButton(
                    onPressed: _saveGoal,
                    child: Text(isEditing ? '保存' : '创建'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildIconSelector(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('图标', style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => setState(() => _showIconPicker = !_showIconPicker),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(_selectedIcon, style: const TextStyle(fontSize: 32)),
            ),
          ),
        ),
        if (_showIconPicker) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: EmojiIcons.available.length,
              itemBuilder: (context, index) {
                final emoji = EmojiIcons.available[index];
                final isSelected = emoji == _selectedIcon;
                return InkWell(
                  onTap: () => setState(() {
                    _selectedIcon = emoji;
                    _showIconPicker = false;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(emoji, style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPeriodSelector(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('周期', style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        SegmentedButton<GoalPeriod>(
          segments: [
            ButtonSegment(value: GoalPeriod.daily, label: Text(GoalPeriod.daily.displayName)),
            ButtonSegment(value: GoalPeriod.weekly, label: Text(GoalPeriod.weekly.displayName)),
          ],
          selected: {_selectedPeriod},
          onSelectionChanged: (s) => setState(() => _selectedPeriod = s.first),
        ),
      ],
    );
  }

  Widget _buildTargetSelector(ThemeData theme) {
    final label = _selectedPeriod == GoalPeriod.daily ? '每天 $_target 次' : '每周 $_target 天';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('目标', style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              onPressed: _target > 1 ? () => setState(() => _target--) : null,
              icon: const Icon(Icons.remove_circle_outline),
            ),
            Expanded(
              child: Center(
                child: Text(label, style: theme.textTheme.titleMedium),
              ),
            ),
            IconButton(
              onPressed: _target < 99 ? () => setState(() => _target++) : null,
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReminderSelector(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('提醒', style: theme.textTheme.titleSmall),
              const SizedBox(height: 4),
              Text(
                _reminderTime != null ? '每天 ${_reminderTime!.format(context)}' : '未设置',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
        if (_reminderTime != null)
          IconButton(
            onPressed: () => setState(() => _reminderTime = null),
            icon: const Icon(Icons.clear),
          ),
        OutlinedButton(
          onPressed: _pickReminderTime,
          child: Text(_reminderTime != null ? '修改' : '设置'),
        ),
      ],
    );
  }

  Future<void> _pickReminderTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _reminderTime ?? const TimeOfDay(hour: 9, minute: 0),
    );
    if (time != null) {
      setState(() => _reminderTime = time);
    }
  }

  Future<void> _saveGoal() async {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入目标名称')),
      );
      return;
    }

    final reminderTimeStr = _reminderTime != null
        ? '${_reminderTime!.hour.toString().padLeft(2, '0')}:${_reminderTime!.minute.toString().padLeft(2, '0')}'
        : null;

    if (widget.goalId != null) {
      await ref.read(goalsNotifierProvider.notifier).updateGoal(
        id: widget.goalId!,
        name: _nameController.text.trim(),
        icon: _selectedIcon,
        period: _selectedPeriod.name,
        target: _target,
        reminderTime: reminderTimeStr,
      );
    } else {
      await ref.read(goalsNotifierProvider.notifier).createGoal(
        name: _nameController.text.trim(),
        icon: _selectedIcon,
        period: _selectedPeriod.name,
        target: _target,
        reminderTime: reminderTimeStr,
      );
    }

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(widget.goalId != null ? '目标已更新' : '目标已创建')),
      );
    }
  }

  Future<void> _deleteGoal() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('删除目标'),
        content: const Text('确定要删除这个目标吗？相关的打卡记录也会被删除。'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('取消')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('删除', style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ),
        ],
      ),
    );

    if (confirmed == true && widget.goalId != null) {
      await ref.read(goalsNotifierProvider.notifier).deleteGoal(widget.goalId!);
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('目标已删除')),
        );
      }
    }
  }
}
