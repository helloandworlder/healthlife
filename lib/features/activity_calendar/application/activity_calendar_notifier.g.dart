// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_calendar_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dayDetailHash() => r'5bd80c0ca08c026fed38a5ff56522a7d9ac421e8';

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

/// See also [dayDetail].
@ProviderFor(dayDetail)
const dayDetailProvider = DayDetailFamily();

/// See also [dayDetail].
class DayDetailFamily extends Family<AsyncValue<DayActivity?>> {
  /// See also [dayDetail].
  const DayDetailFamily();

  /// See also [dayDetail].
  DayDetailProvider call(DateTime date) {
    return DayDetailProvider(date);
  }

  @override
  DayDetailProvider getProviderOverride(covariant DayDetailProvider provider) {
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
  String? get name => r'dayDetailProvider';
}

/// See also [dayDetail].
class DayDetailProvider extends AutoDisposeFutureProvider<DayActivity?> {
  /// See also [dayDetail].
  DayDetailProvider(DateTime date)
    : this._internal(
        (ref) => dayDetail(ref as DayDetailRef, date),
        from: dayDetailProvider,
        name: r'dayDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dayDetailHash,
        dependencies: DayDetailFamily._dependencies,
        allTransitiveDependencies: DayDetailFamily._allTransitiveDependencies,
        date: date,
      );

  DayDetailProvider._internal(
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
    FutureOr<DayActivity?> Function(DayDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DayDetailProvider._internal(
        (ref) => create(ref as DayDetailRef),
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
  AutoDisposeFutureProviderElement<DayActivity?> createElement() {
    return _DayDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DayDetailProvider && other.date == date;
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
mixin DayDetailRef on AutoDisposeFutureProviderRef<DayActivity?> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DayDetailProviderElement
    extends AutoDisposeFutureProviderElement<DayActivity?>
    with DayDetailRef {
  _DayDetailProviderElement(super.provider);

  @override
  DateTime get date => (origin as DayDetailProvider).date;
}

String _$activityCalendarNotifierHash() =>
    r'e9de4d19a06adec39fc5d35d389506dbd8e18134';

/// See also [ActivityCalendarNotifier].
@ProviderFor(ActivityCalendarNotifier)
final activityCalendarNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      ActivityCalendarNotifier,
      ActivityCalendarState
    >.internal(
      ActivityCalendarNotifier.new,
      name: r'activityCalendarNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activityCalendarNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActivityCalendarNotifier =
    AutoDisposeAsyncNotifier<ActivityCalendarState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
