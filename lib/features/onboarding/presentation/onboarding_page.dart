import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/route_names.dart';
import '../application/onboarding_notifier.dart';
import '../domain/onboarding_state.dart';
import 'widgets/activity_level_page.dart';
import 'widgets/health_source_connect_page.dart';
import 'widgets/profile_input_page.dart';
import 'widgets/welcome_page.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(onboardingNotifierProvider);
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    // Sync PageController with state
    ref.listen<OnboardingState>(onboardingNotifierProvider, (previous, next) {
      if (previous?.currentStepIndex != next.currentStepIndex) {
        _pageController.animateToPage(
          next.currentStepIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: List.generate(
                  OnboardingStep.values.length,
                  (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        right: index < OnboardingStep.values.length - 1 ? 8 : 0,
                      ),
                      height: 4,
                      decoration: BoxDecoration(
                        color: index <= state.currentStepIndex
                            ? theme.colorScheme.primary
                            : theme.colorScheme.outline.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Page content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  if (index != state.currentStepIndex) {
                    notifier.goToStep(OnboardingStep.values[index]);
                  }
                },
                children: const [
                  WelcomePage(),
                  ProfileInputPage(),
                  ActivityLevelPage(),
                  HealthSourceConnectPage(),
                ],
              ),
            ),

            // Error message
            if (state.errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: theme.colorScheme.error,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.errorMessage!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: state.isSubmitting ? null : () => _handleNext(state, notifier),
                      child: state.isSubmitting
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: theme.colorScheme.onPrimary,
                              ),
                            )
                          : Text(_getButtonText(state)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (state.currentStep != OnboardingStep.welcome)
                    TextButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () {
                              if (state.currentStep == OnboardingStep.healthSource) {
                                _completeOnboarding(notifier);
                              } else {
                                notifier.previousStep();
                              }
                            },
                      child: Text(
                        state.currentStep == OnboardingStep.healthSource ? '跳过' : '返回',
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

  String _getButtonText(OnboardingState state) {
    switch (state.currentStep) {
      case OnboardingStep.welcome:
        return '开始设置';
      case OnboardingStep.profileInput:
        return '下一步';
      case OnboardingStep.activityLevel:
        return '下一步';
      case OnboardingStep.healthSource:
        return '完成设置';
    }
  }

  void _handleNext(OnboardingState state, OnboardingNotifier notifier) {
    switch (state.currentStep) {
      case OnboardingStep.welcome:
        notifier.nextStep();
        break;
      case OnboardingStep.profileInput:
        if (state.canProceedFromProfile) {
          notifier.nextStep();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('请填写所有必填信息'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
        break;
      case OnboardingStep.activityLevel:
        notifier.nextStep();
        break;
      case OnboardingStep.healthSource:
        _completeOnboarding(notifier);
        break;
    }
  }

  Future<void> _completeOnboarding(OnboardingNotifier notifier) async {
    final success = await notifier.completeOnboarding();
    if (success && mounted) {
      context.go(RoutePaths.dashboard);
    }
  }
}
