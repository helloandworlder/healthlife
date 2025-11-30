import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/health_types.dart';
import '../../application/onboarding_notifier.dart';

class ProfileInputPage extends ConsumerWidget {
  const ProfileInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            '告诉我们一些关于你的信息',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '这些信息将帮助我们为你提供更准确的健康建议',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
          const SizedBox(height: 32),

          // Gender Selection
          Text(
            '性别',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: Gender.values.map((gender) {
              final isSelected = state.gender == gender;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: gender == Gender.male ? 8 : 0,
                    left: gender == Gender.female ? 8 : 0,
                  ),
                  child: _GenderCard(
                    gender: gender,
                    isSelected: isSelected,
                    onTap: () => notifier.updateGender(gender),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Height Picker
          Text(
            '身高',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _ValuePickerTile(
            value: state.height != null ? '${state.height!.toInt()} cm' : '请选择身高',
            hasValue: state.height != null,
            onTap: () => _showHeightPicker(context, ref, notifier, state.height),
          ),
          const SizedBox(height: 24),

          // Weight Picker
          Text(
            '体重',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _ValuePickerTile(
            value: state.weight != null ? '${state.weight!.toStringAsFixed(1)} kg' : '请选择体重',
            hasValue: state.weight != null,
            onTap: () => _showWeightPicker(context, ref, notifier, state.weight),
          ),
          const SizedBox(height: 24),

          // Birthday Picker
          Text(
            '出生日期',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _ValuePickerTile(
            value: state.birthday != null
                ? DateFormat('yyyy年MM月dd日').format(state.birthday!)
                : '请选择出生日期',
            hasValue: state.birthday != null,
            icon: Icons.calendar_today_outlined,
            onTap: () => _showBirthdayPicker(context, ref, notifier, state.birthday),
          ),
          if (state.birthday != null) ...[
            const SizedBox(height: 8),
            Text(
              '年龄: ${state.age} 岁',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _showHeightPicker(
    BuildContext context,
    WidgetRef ref,
    OnboardingNotifier notifier,
    double? currentHeight,
  ) {
    final initialHeight = (currentHeight ?? 170).toInt();
    int selectedHeight = initialHeight;

    showModalBottomSheet(
      context: context,
      builder: (ctx) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('取消'),
                  ),
                  Text('选择身高', style: Theme.of(ctx).textTheme.titleMedium),
                  TextButton(
                    onPressed: () {
                      notifier.updateHeight(selectedHeight.toDouble());
                      Navigator.pop(ctx);
                    },
                    child: const Text('确定'),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                  initialItem: initialHeight - 100,
                ),
                itemExtent: 40,
                onSelectedItemChanged: (index) {
                  selectedHeight = index + 100;
                },
                children: List.generate(121, (index) {
                  final height = index + 100;
                  return Center(
                    child: Text(
                      '$height cm',
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWeightPicker(
    BuildContext context,
    WidgetRef ref,
    OnboardingNotifier notifier,
    double? currentWeight,
  ) {
    final initialWeight = currentWeight ?? 60.0;
    final intPart = initialWeight.floor();
    final decPart = ((initialWeight - intPart) * 10).round();
    
    int selectedInt = intPart;
    int selectedDec = decPart;

    showModalBottomSheet(
      context: context,
      builder: (ctx) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('取消'),
                  ),
                  Text('选择体重', style: Theme.of(ctx).textTheme.titleMedium),
                  TextButton(
                    onPressed: () {
                      notifier.updateWeight(selectedInt + selectedDec / 10);
                      Navigator.pop(ctx);
                    },
                    child: const Text('确定'),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: Row(
                children: [
                  // 整数部分 (30-150 kg)
                  Expanded(
                    flex: 2,
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: intPart - 30,
                      ),
                      itemExtent: 40,
                      onSelectedItemChanged: (index) {
                        selectedInt = index + 30;
                      },
                      children: List.generate(121, (index) {
                        return Center(
                          child: Text(
                            '${index + 30}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }),
                    ),
                  ),
                  const Center(
                    child: Text('.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  // 小数部分 (0-9)
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(
                        initialItem: decPart,
                      ),
                      itemExtent: 40,
                      onSelectedItemChanged: (index) {
                        selectedDec = index;
                      },
                      children: List.generate(10, (index) {
                        return Center(
                          child: Text(
                            '$index',
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text(' kg', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBirthdayPicker(
    BuildContext context,
    WidgetRef ref,
    OnboardingNotifier notifier,
    DateTime? currentBirthday,
  ) {
    final now = DateTime.now();
    DateTime selectedDate = currentBirthday ?? DateTime(now.year - 25, now.month, now.day);

    showModalBottomSheet(
      context: context,
      builder: (ctx) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('取消'),
                  ),
                  Text('选择出生日期', style: Theme.of(ctx).textTheme.titleMedium),
                  TextButton(
                    onPressed: () {
                      notifier.updateBirthday(selectedDate);
                      Navigator.pop(ctx);
                    },
                    child: const Text('确定'),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                minimumDate: DateTime(1920),
                maximumDate: DateTime(now.year - 10, now.month, now.day),
                onDateTimeChanged: (date) {
                  selectedDate = date;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ValuePickerTile extends StatelessWidget {
  final String value;
  final bool hasValue;
  final IconData? icon;
  final VoidCallback onTap;

  const _ValuePickerTile({
    required this.value,
    required this.hasValue,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: hasValue ? theme.colorScheme.onSurface : theme.colorScheme.outline,
                ),
              ),
            ),
            Icon(
              icon ?? Icons.keyboard_arrow_down,
              color: theme.colorScheme.outline,
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderCard extends StatelessWidget {
  final Gender gender;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderCard({
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
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
              gender == Gender.male ? Icons.male : Icons.female,
              size: 40,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.outline,
            ),
            const SizedBox(height: 8),
            Text(
              gender.displayName,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
