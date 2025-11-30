import 'package:flutter/material.dart';

import '../domain/food_template.dart';

class AddMealSheet extends StatefulWidget {
  const AddMealSheet({
    super.key,
    required this.mealType,
    required this.onAddMeal,
  });

  final String mealType;
  final void Function({
    required String mealType,
    required String foodName,
    required int calories,
    String? note,
  }) onAddMeal;

  @override
  State<AddMealSheet> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends State<AddMealSheet> {
  final _foodNameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _noteController = TextEditingController();
  bool _showCustomInput = false;

  String get _mealTypeLabel {
    switch (widget.mealType) {
      case 'breakfast':
        return '早餐';
      case 'lunch':
        return '午餐';
      case 'dinner':
        return '晚餐';
      case 'snack':
        return '加餐';
      default:
        return '饮食';
    }
  }

  @override
  void dispose() {
    _foodNameController.dispose();
    _caloriesController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    final templates = FoodTemplates.getTemplates(widget.mealType);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomPadding),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '添加$_mealTypeLabel',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() => _showCustomInput = !_showCustomInput);
                },
                icon: Icon(_showCustomInput ? Icons.grid_view : Icons.edit),
                label: Text(_showCustomInput ? '常见食物' : '自定义'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_showCustomInput) ...[
            _buildCustomInput(context),
          ] else ...[
            _buildTemplateGrid(context, templates),
          ],
        ],
      ),
    );
  }

  Widget _buildTemplateGrid(BuildContext context, List<FoodTemplate> templates) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final template = templates[index];
          return _FoodTemplateCard(
            template: template,
            onTap: () => _addFromTemplate(template),
          );
        },
      ),
    );
  }

  Widget _buildCustomInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _foodNameController,
          decoration: const InputDecoration(
            labelText: '食物名称',
            hintText: '例如：炒饭',
            border: OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _caloriesController,
          decoration: const InputDecoration(
            labelText: '热量',
            hintText: '例如：300',
            suffixText: 'kcal',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _noteController,
          decoration: const InputDecoration(
            labelText: '备注 (可选)',
            hintText: '例如：半份',
            border: OutlineInputBorder(),
          ),
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _isCustomInputValid() ? _addCustomFood : null,
            child: const Text('添加'),
          ),
        ),
      ],
    );
  }

  bool _isCustomInputValid() {
    return _foodNameController.text.trim().isNotEmpty &&
        int.tryParse(_caloriesController.text) != null &&
        int.parse(_caloriesController.text) > 0;
  }

  void _addFromTemplate(FoodTemplate template) {
    widget.onAddMeal(
      mealType: widget.mealType,
      foodName: template.name,
      calories: template.calories,
    );
    Navigator.of(context).pop();
  }

  void _addCustomFood() {
    widget.onAddMeal(
      mealType: widget.mealType,
      foodName: _foodNameController.text.trim(),
      calories: int.parse(_caloriesController.text),
      note: _noteController.text.trim().isNotEmpty ? _noteController.text.trim() : null,
    );
    Navigator.of(context).pop();
  }
}

class _FoodTemplateCard extends StatelessWidget {
  const _FoodTemplateCard({
    required this.template,
    required this.onTap,
  });

  final FoodTemplate template;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Text(
                template.emoji ?? '🍽️',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${template.calories} kcal',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
