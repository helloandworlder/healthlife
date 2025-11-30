// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'd66464688f3f3beae31aa517238455b4413086f1';

/// 数据库实例 Provider
///
/// Copied from [database].
@ProviderFor(database)
final databaseProvider = Provider<AppDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = ProviderRef<AppDatabase>;
String _$onboardingCompletedHash() =>
    r'daca59c64d1a788725be209a3c8fc8bf94d605f5';

/// 是否完成 Onboarding
///
/// Copied from [onboardingCompleted].
@ProviderFor(onboardingCompleted)
final onboardingCompletedProvider = AutoDisposeFutureProvider<bool>.internal(
  onboardingCompleted,
  name: r'onboardingCompletedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingCompletedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OnboardingCompletedRef = AutoDisposeFutureProviderRef<bool>;
String _$currentProfileHash() => r'b73777363cc2ba5a81e1ddd007cacbe5b0c75a7b';

/// 当前用户档案
///
/// Copied from [currentProfile].
@ProviderFor(currentProfile)
final currentProfileProvider = AutoDisposeFutureProvider<UserProfile?>.internal(
  currentProfile,
  name: r'currentProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentProfileRef = AutoDisposeFutureProviderRef<UserProfile?>;
String _$activePlanHash() => r'bf235245febbea77cf1035cf2be2d91f8548bcab';

/// 当前激活计划
///
/// Copied from [activePlan].
@ProviderFor(activePlan)
final activePlanProvider = AutoDisposeFutureProvider<Plan?>.internal(
  activePlan,
  name: r'activePlanProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activePlanHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivePlanRef = AutoDisposeFutureProviderRef<Plan?>;
String _$petStateHash() => r'452db2f4a2090c6c409c8265c13d727d8278659f';

/// 宠物状态
///
/// Copied from [petState].
@ProviderFor(petState)
final petStateProvider = AutoDisposeFutureProvider<PetState>.internal(
  petState,
  name: r'petStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PetStateRef = AutoDisposeFutureProviderRef<PetState>;
String _$appSettingsHash() => r'9334f70e5072427d7baf1973be11e0adb3d427fc';

/// 应用设置
///
/// Copied from [appSettings].
@ProviderFor(appSettings)
final appSettingsProvider =
    AutoDisposeFutureProvider<Map<String, String>>.internal(
      appSettings,
      name: r'appSettingsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appSettingsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppSettingsRef = AutoDisposeFutureProviderRef<Map<String, String>>;
String _$weightUnitHash() => r'701639e3b718882422f5adcc1c831bad85e3d669';

/// 体重单位
///
/// Copied from [weightUnit].
@ProviderFor(weightUnit)
final weightUnitProvider = AutoDisposeFutureProvider<String>.internal(
  weightUnit,
  name: r'weightUnitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weightUnitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeightUnitRef = AutoDisposeFutureProviderRef<String>;
String _$heightUnitHash() => r'ebc30dbe66885f7d482a095f7d28143f34c59158';

/// 身高单位
///
/// Copied from [heightUnit].
@ProviderFor(heightUnit)
final heightUnitProvider = AutoDisposeFutureProvider<String>.internal(
  heightUnit,
  name: r'heightUnitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$heightUnitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HeightUnitRef = AutoDisposeFutureProviderRef<String>;
String _$themeModeHash() => r'934346d792235ccb533801bcd539bb93c6d4e898';

/// 主题模式
///
/// Copied from [themeMode].
@ProviderFor(themeMode)
final themeModeProvider = AutoDisposeFutureProvider<String>.internal(
  themeMode,
  name: r'themeModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ThemeModeRef = AutoDisposeFutureProviderRef<String>;
String _$languageHash() => r'ce516350f699a4c2048bb5c900bb0f53426417e6';

/// 语言设置
///
/// Copied from [language].
@ProviderFor(language)
final languageProvider = AutoDisposeFutureProvider<String>.internal(
  language,
  name: r'languageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$languageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LanguageRef = AutoDisposeFutureProviderRef<String>;
String _$notificationsEnabledHash() =>
    r'd1e1329fbdc1e447be82b01f0445f2a38043eb00';

/// 通知开关
///
/// Copied from [notificationsEnabled].
@ProviderFor(notificationsEnabled)
final notificationsEnabledProvider = AutoDisposeFutureProvider<bool>.internal(
  notificationsEnabled,
  name: r'notificationsEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationsEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NotificationsEnabledRef = AutoDisposeFutureProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
