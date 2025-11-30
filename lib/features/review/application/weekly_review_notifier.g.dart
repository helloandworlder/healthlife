// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_review_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weeklyReviewNotifierHash() =>
    r'f6ab672bbfa7a0b55d50ddb047789f5f57fcaddd';

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

abstract class _$WeeklyReviewNotifier
    extends BuildlessAutoDisposeAsyncNotifier<WeeklyReviewData> {
  late final DateTime? weekStart;

  FutureOr<WeeklyReviewData> build({DateTime? weekStart});
}

/// See also [WeeklyReviewNotifier].
@ProviderFor(WeeklyReviewNotifier)
const weeklyReviewNotifierProvider = WeeklyReviewNotifierFamily();

/// See also [WeeklyReviewNotifier].
class WeeklyReviewNotifierFamily extends Family<AsyncValue<WeeklyReviewData>> {
  /// See also [WeeklyReviewNotifier].
  const WeeklyReviewNotifierFamily();

  /// See also [WeeklyReviewNotifier].
  WeeklyReviewNotifierProvider call({DateTime? weekStart}) {
    return WeeklyReviewNotifierProvider(weekStart: weekStart);
  }

  @override
  WeeklyReviewNotifierProvider getProviderOverride(
    covariant WeeklyReviewNotifierProvider provider,
  ) {
    return call(weekStart: provider.weekStart);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weeklyReviewNotifierProvider';
}

/// See also [WeeklyReviewNotifier].
class WeeklyReviewNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          WeeklyReviewNotifier,
          WeeklyReviewData
        > {
  /// See also [WeeklyReviewNotifier].
  WeeklyReviewNotifierProvider({DateTime? weekStart})
    : this._internal(
        () => WeeklyReviewNotifier()..weekStart = weekStart,
        from: weeklyReviewNotifierProvider,
        name: r'weeklyReviewNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weeklyReviewNotifierHash,
        dependencies: WeeklyReviewNotifierFamily._dependencies,
        allTransitiveDependencies:
            WeeklyReviewNotifierFamily._allTransitiveDependencies,
        weekStart: weekStart,
      );

  WeeklyReviewNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weekStart,
  }) : super.internal();

  final DateTime? weekStart;

  @override
  FutureOr<WeeklyReviewData> runNotifierBuild(
    covariant WeeklyReviewNotifier notifier,
  ) {
    return notifier.build(weekStart: weekStart);
  }

  @override
  Override overrideWith(WeeklyReviewNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeeklyReviewNotifierProvider._internal(
        () => create()..weekStart = weekStart,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weekStart: weekStart,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    WeeklyReviewNotifier,
    WeeklyReviewData
  >
  createElement() {
    return _WeeklyReviewNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeeklyReviewNotifierProvider &&
        other.weekStart == weekStart;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weekStart.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeeklyReviewNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<WeeklyReviewData> {
  /// The parameter `weekStart` of this provider.
  DateTime? get weekStart;
}

class _WeeklyReviewNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          WeeklyReviewNotifier,
          WeeklyReviewData
        >
    with WeeklyReviewNotifierRef {
  _WeeklyReviewNotifierProviderElement(super.provider);

  @override
  DateTime? get weekStart => (origin as WeeklyReviewNotifierProvider).weekStart;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
