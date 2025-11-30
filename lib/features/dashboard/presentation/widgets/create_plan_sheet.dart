import 'package:flutter/material.dart';

import '../../../../core/utils/calorie_calculator.dart';

class CreatePlanSheet extends StatefulWidget {
  const CreatePlanSheet({
    super.key,
    this.initialWeight,
    required this.onCreatePlan,
  });

  final double? initialWeight;
  final Future<void> Function({
    required double initialWeight,
    required double targetWeight,
    required int durationDays,
    required int dailyCalorieDeficit,
  }) onCreatePlan;

  @override
  State<CreatePlanSheet> createState() => _CreatePlanSheetState();
}

class _CreatePlanSheetState extends State<CreatePlanSheet> {
  late TextEditingController _initialWeightController;
  late TextEditingController _targetWeightController;
  int _selectedDuration = 30;
  int _dailyDeficit = 500;

  final List<int> _durationOptions = [30, 60, 90];

  @override
  void initState() {
    super.initState();
    _initialWeightController = TextEditingController(
      text: widget.initialWeight?.toStringAsFixed(1) ?? '',
    );
    _targetWeightController = TextEditingController();
  }

  @override
  void dispose() {
    _initialWeightController.dispose();
    _targetWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '创建减重计划',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildWeightInput(
                  context,
                  label: '初始体重',
                  controller: _initialWeightController,
                  suffix: 'kg',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildWeightInput(
                  context,
                  label: '目标体重',
                  controller: _targetWeightController,
                  suffix: 'kg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '计划时长',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: _durationOptions.map((days) {
              final isSelected = _selectedDuration == days;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: days != _durationOptions.last ? 8 : 0,
                  ),
                  child: ChoiceChip(
                    label: Text('$days 天'),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedDuration = days);
                        _updateDeficit();
                      }
                    },
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Text(
            '每日热量缺口',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _dailyDeficit.toDouble(),
                  min: 250,
                  max: 1000,
                  divisions: 15,
                  label: '$_dailyDeficit kcal',
                  onChanged: (value) {
                    setState(() => _dailyDeficit = value.round());
                  },
                ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  '$_dailyDeficit kcal',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildEstimation(context),
          if (!_isValid() && _hasInput()) _buildValidationHint(context),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _isValid() ? _onSubmit : null,
              child: const Text('开始计划'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValidationHint(BuildContext context) {
    final theme = Theme.of(context);
    final initial = double.tryParse(_initialWeightController.text);
    final target = double.tryParse(_targetWeightController.text);

    String hint = '';
    if (initial == null) {
      hint = '请输入有效的初始体重';
    } else if (target == null) {
      hint = '请输入有效的目标体重';
    } else if (initial <= target) {
      hint = '目标体重需小于初始体重';
    } else if (target <= 0) {
      hint = '目标体重需大于0';
    }

    if (hint.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16, color: theme.colorScheme.error),
          const SizedBox(width: 8),
          Text(
            hint,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }

  bool _hasInput() {
    return _initialWeightController.text.isNotEmpty || 
           _targetWeightController.text.isNotEmpty;
  }

  Widget _buildWeightInput(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required String suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        border: const OutlineInputBorder(),
      ),
      onChanged: (_) {
        setState(() {});
        _updateDeficit();
      },
    );
  }

  Widget _buildEstimation(BuildContext context) {
    final theme = Theme.of(context);

    if (!_isValid()) {
      return const SizedBox.shrink();
    }

    final weeklyLoss = CalorieCalculator.estimateWeeklyWeightLoss(_dailyDeficit);
    final totalLoss = (weeklyLoss * _selectedDuration / 7);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.lightbulb_outline,
            color: theme.colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '按此计划，预计每周减重 ${weeklyLoss.toStringAsFixed(2)} kg，'
              '$_selectedDuration 天共减 ${totalLoss.toStringAsFixed(1)} kg',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateDeficit() {
    final initial = double.tryParse(_initialWeightController.text);
    final target = double.tryParse(_targetWeightController.text);

    if (initial != null && target != null && initial > target) {
      final suggested = CalorieCalculator.suggestDailyDeficit(
        currentWeight: initial,
        targetWeight: target,
        durationDays: _selectedDuration,
      );
      setState(() => _dailyDeficit = suggested);
    }
  }

  bool _isValid() {
    final initial = double.tryParse(_initialWeightController.text);
    final target = double.tryParse(_targetWeightController.text);
    return initial != null && target != null && initial > target && target > 0;
  }

  Future<void> _onSubmit() async {
    final initialWeight = double.tryParse(_initialWeightController.text.trim());
    final targetWeight = double.tryParse(_targetWeightController.text.trim());
    
    if (initialWeight == null || targetWeight == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入有效的体重数值')),
      );
      return;
    }

    // Get scaffold messenger before any async operations
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    try {
      await widget.onCreatePlan(
        initialWeight: initialWeight,
        targetWeight: targetWeight,
        durationDays: _selectedDuration,
        dailyCalorieDeficit: _dailyDeficit,
      );
      
      navigator.pop();
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('计划创建成功！')),
      );
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('创建计划失败: $e')),
      );
    }
  }
}
