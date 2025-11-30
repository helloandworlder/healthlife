// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealCaloriesForTypeHash() =>
    r'f7022919091a80be800911800817cf3195adcd9d';

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

/// See also [mealCaloriesForType].
@ProviderFor(mealCaloriesForType)
const mealCaloriesForTypeProvider = MealCaloriesForTypeFamily();

/// See also [mealCaloriesForType].
class MealCaloriesForTypeFamily extends Family<AsyncValue<int>> {
  /// See also [mealCaloriesForType].
  const MealCaloriesForTypeFamily();

  /// See also [mealCaloriesForType].
  MealCaloriesForTypeProvider call(String mealType) {
    return MealCaloriesForTypeProvider(mealType);
  }

  @override
  MealCaloriesForTypeProvider getProviderOverride(
    covariant MealCaloriesForTypeProvider provider,
  ) {
    return call(provider.mealType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mealCaloriesForTypeProvider';
}

/// See also [mealCaloriesForType].
class MealCaloriesForTypeProvider extends AutoDisposeFutureProvider<int> {
  /// See also [mealCaloriesForType].
  MealCaloriesForTypeProvider(String mealType)
    : this._internal(
        (ref) => mealCaloriesForType(ref as MealCaloriesForTypeRef, mealType),
        from: mealCaloriesForTypeProvider,
        name: r'mealCaloriesForTypeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$mealCaloriesForTypeHash,
        dependencies: MealCaloriesForTypeFamily._dependencies,
        allTransitiveDependencies:
            MealCaloriesForTypeFamily._allTransitiveDependencies,
        mealType: mealType,
      );

  MealCaloriesForTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mealType,
  }) : super.internal();

  final String mealType;

  @override
  Override overrideWith(
    FutureOr<int> Function(MealCaloriesForTypeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MealCaloriesForTypeProvider._internal(
        (ref) => create(ref as MealCaloriesForTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mealType: mealType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _MealCaloriesForTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MealCaloriesForTypeProvider && other.mealType == mealType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mealType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MealCaloriesForTypeRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `mealType` of this provider.
  String get mealType;
}

class _MealCaloriesForTypeProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with MealCaloriesForTypeRef {
  _MealCaloriesForTypeProviderElement(super.provider);

  @override
  String get mealType => (origin as MealCaloriesForTypeProvider).mealType;
}

String _$mealNotifierHash() => r'034ab78ed5867fa157d10ba2af9be01de1740134';

/// See also [MealNotifier].
@ProviderFor(MealNotifier)
final mealNotifierProvider =
    AutoDisposeAsyncNotifierProvider<MealNotifier, MealState>.internal(
      MealNotifier.new,
      name: r'mealNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$mealNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MealNotifier = AutoDisposeAsyncNotifier<MealState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
