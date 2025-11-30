import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/providers.dart';
import '../../../core/constants/health_types.dart';
import '../../../core/utils/bmi_calculator.dart';
import '../../../core/utils/calorie_calculator.dart';
import '../../../shared/db/app_database.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  Gender? _gender;
  DateTime? _birthday;
  UserActivityLevel _activityLevel = UserActivityLevel.sedentary;
  bool _isLoading = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    final profile = await ref.read(currentProfileProvider.future);
    if (profile != null && mounted) {
      setState(() {
        _gender = profile.gender != null ? Gender.values.firstWhere(
          (g) => g.name == profile.gender,
          orElse: () => Gender.male,
        ) : null;
        _heightController.text = profile.height?.toStringAsFixed(0) ?? '';
        _weightController.text = profile.weight?.toStringAsFixed(1) ?? '';
        _birthday = profile.birthday;
        _activityLevel = UserActivityLevel.values.firstWhere(
          (l) => l.name == profile.activityLevel,
          orElse: () => UserActivityLevel.sedentary,
        );
      });
    }
  }

  void _markChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('个人信息'),
        actions: [
          if (_hasChanges)
            TextButton(
              onPressed: _isLoading ? null : _saveProfile,
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('保存'),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Gender section
            _buildSectionTitle(theme, '性别'),
            Row(
              children: Gender.values.map((gender) {
                final isSelected = _gender == gender;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: gender == Gender.male ? 8 : 0,
                      left: gender == Gender.female ? 8 : 0,
                    ),
                    child: _buildSelectableCard(
                      theme,
                      icon: gender == Gender.male ? Icons.male : Icons.female,
                      label: gender.displayName,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() => _gender = gender);
                        _markChanged();
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Height & Weight
            _buildSectionTitle(theme, '身体数据'),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _heightController,
                    label: '身高',
                    suffix: 'cm',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: _weightController,
                    label: '体重',
                    suffix: 'kg',
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}\.?\d{0,1}')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // BMI display
            if (_heightController.text.isNotEmpty && _weightController.text.isNotEmpty)
              _buildBMICard(theme),
            const SizedBox(height: 24),

            // Birthday
            _buildSectionTitle(theme, '出生日期'),
            InkWell(
              onTap: _selectBirthday,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.cake_outlined, color: theme.colorScheme.outline),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _birthday != null
                            ? DateFormat('yyyy年MM月dd日').format(_birthday!)
                            : '请选择出生日期',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: _birthday != null
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.outline,
                        ),
                      ),
                    ),
                    if (_birthday != null)
                      Text(
                        '${_calculateAge()} 岁',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Activity Level
            _buildSectionTitle(theme, '活动水平'),
            ...UserActivityLevel.values.map((level) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildActivityLevelCard(theme, level),
              );
            }),
            const SizedBox(height: 24),

            // Estimated TDEE
            if (_canCalculateTDEE())
              _buildTDEECard(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSelectableCard(
    ThemeData theme, {
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outline.withValues(alpha: 0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String suffix,
    required TextInputType keyboardType,
    required List<TextInputFormatter> inputFormatters,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (_) => _markChanged(),
    );
  }

  Widget _buildBMICard(ThemeData theme) {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height == null || weight == null || height == 0) {
      return const SizedBox.shrink();
    }

    final bmi = BMICalculator.calculateBMI(weightKg: weight, heightCm: height);
    final category = BMICalculator.getBMICategory(bmi);
    final color = BMICalculator.getBMICategoryColor(bmi);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMI',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              category,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityLevelCard(ThemeData theme, UserActivityLevel level) {
    final isSelected = _activityLevel == level;

    return InkWell(
      onTap: () {
        setState(() => _activityLevel = level);
        _markChanged();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level.displayName,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  Text(
                    level.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildTDEECard(ThemeData theme) {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);
    final age = _calculateAge();

    if (height == null || weight == null || _gender == null || age == 0) {
      return const SizedBox.shrink();
    }

    final bmr = CalorieCalculator.calculateBMR(
      gender: _gender!,
      weightKg: weight,
      heightCm: height,
      age: age,
    );
    final tdee = CalorieCalculator.calculateTDEE(bmr, _activityLevel);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '预估每日热量消耗',
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                tdee.round().toString(),
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'kcal',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '基础代谢 (BMR): ${bmr.round()} kcal',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateAge() {
    if (_birthday == null) return 0;
    final now = DateTime.now();
    int age = now.year - _birthday!.year;
    if (now.month < _birthday!.month ||
        (now.month == _birthday!.month && now.day < _birthday!.day)) {
      age--;
    }
    return age;
  }

  bool _canCalculateTDEE() {
    return _gender != null &&
        _heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        _birthday != null;
  }

  Future<void> _selectBirthday() async {
    final now = DateTime.now();
    final initialDate = _birthday ?? DateTime(now.year - 25, now.month, now.day);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1920),
      lastDate: DateTime(now.year - 10, now.month, now.day),
      locale: const Locale('zh', 'CN'),
    );

    if (picked != null) {
      setState(() => _birthday = picked);
      _markChanged();
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final db = ref.read(databaseProvider);
      await db.userProfileDao.upsertProfile(
        UserProfilesCompanion(
          gender: Value(_gender?.name),
          height: Value(double.tryParse(_heightController.text)),
          weight: Value(double.tryParse(_weightController.text)),
          birthday: Value(_birthday),
          activityLevel: Value(_activityLevel.name),
        ),
      );

      ref.invalidate(currentProfileProvider);

      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasChanges = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('保存成功'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('保存失败: ${e.toString()}'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
