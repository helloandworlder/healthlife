import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/providers.dart';
import '../../../shared/db/app_database.dart';
import '../application/gamification_service.dart';

class PetDetailPage extends ConsumerStatefulWidget {
  const PetDetailPage({super.key});

  @override
  ConsumerState<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends ConsumerState<PetDetailPage> {
  final _nameController = TextEditingController();
  bool _isEditingName = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final petStateAsync = ref.watch(petStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的宠物'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: petStateAsync.when(
        data: (petState) => _buildContent(context, petState),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('加载失败: $e')),
      ),
    );
  }

  Widget _buildContent(BuildContext context, PetState petState) {
    final theme = Theme.of(context);
    final gamification = ref.read(gamificationServiceProvider);
    final expNeeded = gamification.expNeeded(petState.level);
    final expProgress = petState.exp / expNeeded;
    final milestones = gamification.getMilestones(petState);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildPetAvatar(theme, petState),
          const SizedBox(height: 24),
          _buildNameSection(theme, petState),
          const SizedBox(height: 24),
          _buildLevelCard(theme, petState, expProgress, expNeeded, gamification),
          const SizedBox(height: 16),
          _buildStatsCard(theme, petState, gamification),
          const SizedBox(height: 16),
          _buildMilestonesCard(theme, milestones),
        ],
      ),
    );
  }

  Widget _buildPetAvatar(ThemeData theme, PetState petState) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '🐱',
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }

  Widget _buildNameSection(ThemeData theme, PetState petState) {
    if (_isEditingName) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              controller: _nameController,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveName,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => setState(() => _isEditingName = false),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          petState.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(Icons.edit, color: theme.colorScheme.primary),
          onPressed: () {
            _nameController.text = petState.name;
            setState(() => _isEditingName = true);
          },
        ),
      ],
    );
  }

  Widget _buildLevelCard(ThemeData theme, PetState petState, double expProgress, int expNeeded, GamificationService gamification) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Lv.${petState.level}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      gamification.getLevelTitle(petState.level),
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${petState.exp} / $expNeeded',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: expProgress,
                minHeight: 12,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '还需 ${expNeeded - petState.exp} 经验升级',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(ThemeData theme, PetState petState, GamificationService gamification) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '陪伴数据',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildStatRow(theme, Icons.calendar_today, '陪伴天数', '${petState.companionDays} 天'),
            const Divider(),
            _buildStatRow(theme, Icons.emoji_emotions, '心情', gamification.getPetMood(petState)),
            const Divider(),
            _buildStatRow(theme, Icons.star, '总经验', '${petState.level * 100 + petState.exp}'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(ThemeData theme, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Text(label, style: theme.textTheme.bodyMedium),
          const Spacer(),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonesCard(ThemeData theme, List<Milestone> milestones) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '里程碑',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...milestones.map((m) => _buildMilestoneItem(theme, m)),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneItem(ThemeData theme, Milestone milestone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: milestone.achieved ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                milestone.icon,
                style: TextStyle(
                  fontSize: 20,
                  color: milestone.achieved ? null : Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                milestone.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: milestone.achieved ? null : theme.colorScheme.outline,
                ),
              ),
              Text(
                '${milestone.days} 天',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (milestone.achieved)
            Icon(
              Icons.check_circle,
              color: theme.colorScheme.primary,
            )
          else
            Icon(
              Icons.circle_outlined,
              color: theme.colorScheme.outline,
            ),
        ],
      ),
    );
  }

  Future<void> _saveName() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final db = ref.read(databaseProvider);
    await db.petDao.updateName(name);
    ref.invalidate(petStateProvider);
    setState(() => _isEditingName = false);
  }
}
