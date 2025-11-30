// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weightNotifierHash() => r'd338fbcdfd798b717f32671228daac251795a4a6';

/// See also [WeightNotifier].
@ProviderFor(WeightNotifier)
final weightNotifierProvider =
    AutoDisposeAsyncNotifierProvider<WeightNotifier, WeightState>.internal(
      WeightNotifier.new,
      name: r'weightNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$weightNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WeightNotifier = AutoDisposeAsyncNotifier<WeightState>;
String _$weightHistoryNotifierHash() =>
    r'e4fbd4788ea513db882aa795c33c3ef4a5ad57e4';

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

abstract class _$WeightHistoryNotifier
    extends BuildlessAutoDisposeAsyncNotifier<WeightHistoryState> {
  late final int days;

  FutureOr<WeightHistoryState> build({int days = 30});
}

/// See also [WeightHistoryNotifier].
@ProviderFor(WeightHistoryNotifier)
const weightHistoryNotifierProvider = WeightHistoryNotifierFamily();

/// See also [WeightHistoryNotifier].
class WeightHistoryNotifierFamily
    extends Family<AsyncValue<WeightHistoryState>> {
  /// See also [WeightHistoryNotifier].
  const WeightHistoryNotifierFamily();

  /// See also [WeightHistoryNotifier].
  WeightHistoryNotifierProvider call({int days = 30}) {
    return WeightHistoryNotifierProvider(days: days);
  }

  @override
  WeightHistoryNotifierProvider getProviderOverride(
    covariant WeightHistoryNotifierProvider provider,
  ) {
    return call(days: provider.days);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weightHistoryNotifierProvider';
}

/// See also [WeightHistoryNotifier].
class WeightHistoryNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          WeightHistoryNotifier,
          WeightHistoryState
        > {
  /// See also [WeightHistoryNotifier].
  WeightHistoryNotifierProvider({int days = 30})
    : this._internal(
        () => WeightHistoryNotifier()..days = days,
        from: weightHistoryNotifierProvider,
        name: r'weightHistoryNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weightHistoryNotifierHash,
        dependencies: WeightHistoryNotifierFamily._dependencies,
        allTransitiveDependencies:
            WeightHistoryNotifierFamily._allTransitiveDependencies,
        days: days,
      );

  WeightHistoryNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.days,
  }) : super.internal();

  final int days;

  @override
  FutureOr<WeightHistoryState> runNotifierBuild(
    covariant WeightHistoryNotifier notifier,
  ) {
    return notifier.build(days: days);
  }

  @override
  Override overrideWith(WeightHistoryNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeightHistoryNotifierProvider._internal(
        () => create()..days = days,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        days: days,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    WeightHistoryNotifier,
    WeightHistoryState
  >
  createElement() {
    return _WeightHistoryNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeightHistoryNotifierProvider && other.days == days;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, days.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeightHistoryNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<WeightHistoryState> {
  /// The parameter `days` of this provider.
  int get days;
}

class _WeightHistoryNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          WeightHistoryNotifier,
          WeightHistoryState
        >
    with WeightHistoryNotifierRef {
  _WeightHistoryNotifierProviderElement(super.provider);

  @override
  int get days => (origin as WeightHistoryNotifierProvider).days;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
