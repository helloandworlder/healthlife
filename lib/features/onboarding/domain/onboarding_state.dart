import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/constants/health_types.dart';

part 'onboarding_state.freezed.dart';

enum OnboardingStep {
  welcome,
  profileInput,
  activityLevel,
  healthSource,
}

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingStep.welcome) OnboardingStep currentStep,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    // Profile data
    Gender? gender,
    double? height,
    double? weight,
    DateTime? birthday,
    @Default(UserActivityLevel.sedentary) UserActivityLevel activityLevel,
    // Health source
    @Default(false) bool healthSourceConnected,
    String? healthSourceType,
  }) = _OnboardingState;

  const OnboardingState._();

  int get currentStepIndex => currentStep.index;

  bool get canProceedFromProfile {
    return gender != null && height != null && weight != null && birthday != null;
  }

  int get age {
    if (birthday == null) return 0;
    final now = DateTime.now();
    int age = now.year - birthday!.year;
    if (now.month < birthday!.month ||
        (now.month == birthday!.month && now.day < birthday!.day)) {
      age--;
    }
    return age;
  }
}
