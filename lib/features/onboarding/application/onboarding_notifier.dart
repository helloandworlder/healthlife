import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/providers.dart';
import '../../../core/constants/db_constants.dart';
import '../../../core/constants/health_types.dart';
import '../../../shared/db/app_database.dart';
import '../../../shared/services/health_sync_service.dart';
import '../domain/onboarding_state.dart';

part 'onboarding_notifier.g.dart';

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  void goToStep(OnboardingStep step) {
    state = state.copyWith(currentStep: step, errorMessage: null);
  }

  void nextStep() {
    final nextIndex = state.currentStepIndex + 1;
    if (nextIndex < OnboardingStep.values.length) {
      state = state.copyWith(
        currentStep: OnboardingStep.values[nextIndex],
        errorMessage: null,
      );
    }
  }

  void previousStep() {
    final prevIndex = state.currentStepIndex - 1;
    if (prevIndex >= 0) {
      state = state.copyWith(
        currentStep: OnboardingStep.values[prevIndex],
        errorMessage: null,
      );
    }
  }

  void updateGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  void updateHeight(double height) {
    state = state.copyWith(height: height);
  }

  void updateWeight(double weight) {
    state = state.copyWith(weight: weight);
  }

  void updateBirthday(DateTime birthday) {
    state = state.copyWith(birthday: birthday);
  }

  void updateActivityLevel(UserActivityLevel level) {
    state = state.copyWith(activityLevel: level);
  }

  void setHealthSourceConnected(bool connected, {String? sourceType}) {
    state = state.copyWith(
      healthSourceConnected: connected,
      healthSourceType: sourceType,
    );
  }

  Future<bool> completeOnboarding() async {
    if (state.isSubmitting) return false;

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      final db = ref.read(databaseProvider);

      // Save user profile
      await db.userProfileDao.upsertProfile(
        UserProfilesCompanion(
          gender: Value(state.gender?.name),
          height: Value(state.height),
          weight: Value(state.weight),
          birthday: Value(state.birthday),
          activityLevel: Value(state.activityLevel.name),
        ),
      );

      // Initialize pet state
      await db.petDao.getOrCreateState();

      // Save health source setting
      if (state.healthSourceConnected && state.healthSourceType != null) {
        await db.settingsDao.setSetting(
          DbConstants.keyHealthSource,
          state.healthSourceType!,
        );

        // Trigger initial health data sync in background
        // Don't await - let it run asynchronously
        _triggerInitialSync();
      }

      // Mark onboarding as completed
      await db.settingsDao.setSetting(
        DbConstants.keyOnboardingCompleted,
        'true',
      );

      state = state.copyWith(isSubmitting: false);
      
      // Invalidate providers
      ref.invalidate(onboardingCompletedProvider);
      ref.invalidate(currentProfileProvider);

      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: '保存失败，请重试: ${e.toString()}',
      );
      return false;
    }
  }

  void _triggerInitialSync() {
    // Run sync in background without blocking
    Future.microtask(() async {
      try {
        final syncService = ref.read(healthSyncServiceProvider);
        await syncService.syncAll();
      } catch (e) {
        // Silently fail - user can manually sync later
        // TODO: Add proper logging when logging service is implemented
      }
    });
  }
}
