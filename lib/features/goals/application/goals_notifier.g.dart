// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goalReviewForDateHash() => r'822ec230c1c7d5067ead3fd753298351e87c1a41';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [goalReviewForDate].
@ProviderFor(goalReviewForDate)
const goalReviewForDateProvider = GoalReviewForDateFamily();

/// See also [goalReviewForDate].
class GoalReviewForDateFamily extends Family<AsyncValue<List<GoalReviewItem>>> {
  /// See also [goalReviewForDate].
  const GoalReviewForDateFamily();

  /// See also [goalReviewForDate].
  GoalReviewForDateProvider call(DateTime date) {
    return GoalReviewForDateProvider(date);
  }

  @override
  GoalReviewForDateProvider getProviderOverride(
    covariant GoalReviewForDateProvider provider,
  ) {
    return call(provider.date);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'goalReviewForDateProvider';
}

/// See also [goalReviewForDate].
class GoalReviewForDateProvider
    extends AutoDisposeFutureProvider<List<GoalReviewItem>> {
  /// See also [goalReviewForDate].
  GoalReviewForDateProvider(DateTime date)
    : this._internal(
        (ref) => goalReviewForDate(ref as GoalReviewForDateRef, date),
        from: goalReviewForDateProvider,
        name: r'goalReviewForDateProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$goalReviewForDateHash,
        dependencies: GoalReviewForDateFamily._dependencies,
        allTransitiveDependencies:
            GoalReviewForDateFamily._allTransitiveDependencies,
        date: date,
      );

  GoalReviewForDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<List<GoalReviewItem>> Function(GoalReviewForDateRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GoalReviewForDateProvider._internal(
        (ref) => create(ref as GoalReviewForDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GoalReviewItem>> createElement() {
    return _GoalReviewForDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GoalReviewForDateProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GoalReviewForDateRef
    on AutoDisposeFutureProviderRef<List<GoalReviewItem>> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _GoalReviewForDateProviderElement
    extends AutoDisposeFutureProviderElement<List<GoalReviewItem>>
    with GoalReviewForDateRef {
  _GoalReviewForDateProviderElement(super.provider);

  @override
  DateTime get date => (origin as GoalReviewForDateProvider).date;
}

String _$goalsNotifierHash() => r'e03777ac783dbed15fe1d58beecd0ca71d2ad44f';

/// See also [GoalsNotifier].
@ProviderFor(GoalsNotifier)
final goalsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<GoalsNotifier, GoalsState>.internal(
      GoalsNotifier.new,
      name: r'goalsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$goalsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GoalsNotifier = AutoDisposeAsyncNotifier<GoalsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
