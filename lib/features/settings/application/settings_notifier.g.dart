// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityHeatmapDataHash() =>
    r'f62c3985da9d1b93c3c873909f7c0a8a1bc2fd48';

/// See also [activityHeatmapData].
@ProviderFor(activityHeatmapData)
final activityHeatmapDataProvider =
    AutoDisposeFutureProvider<Map<DateTime, int>>.internal(
      activityHeatmapData,
      name: r'activityHeatmapDataProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activityHeatmapDataHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivityHeatmapDataRef =
    AutoDisposeFutureProviderRef<Map<DateTime, int>>;
String _$settingsNotifierHash() => r'3129cecac1c530bbe16a48ec83db367029b82739';

/// See also [SettingsNotifier].
@ProviderFor(SettingsNotifier)
final settingsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SettingsNotifier, SettingsState>.internal(
      SettingsNotifier.new,
      name: r'settingsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SettingsNotifier = AutoDisposeAsyncNotifier<SettingsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
