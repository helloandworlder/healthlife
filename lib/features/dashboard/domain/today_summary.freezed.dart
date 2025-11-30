// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodaySummary {

 int get steps; int get activeMinutes; int get caloriesBurned; double get sleepHours; int get caloriesIntake; CalorieBudget get calorieBudget; double? get latestWeight; double? get weightDelta;
/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodaySummaryCopyWith<TodaySummary> get copyWith => _$TodaySummaryCopyWithImpl<TodaySummary>(this as TodaySummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaySummary&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.caloriesIntake, caloriesIntake) || other.caloriesIntake == caloriesIntake)&&(identical(other.calorieBudget, calorieBudget) || other.calorieBudget == calorieBudget)&&(identical(other.latestWeight, latestWeight) || other.latestWeight == latestWeight)&&(identical(other.weightDelta, weightDelta) || other.weightDelta == weightDelta));
}


@override
int get hashCode => Object.hash(runtimeType,steps,activeMinutes,caloriesBurned,sleepHours,caloriesIntake,calorieBudget,latestWeight,weightDelta);

@override
String toString() {
  return 'TodaySummary(steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, caloriesIntake: $caloriesIntake, calorieBudget: $calorieBudget, latestWeight: $latestWeight, weightDelta: $weightDelta)';
}


}

/// @nodoc
abstract mixin class $TodaySummaryCopyWith<$Res>  {
  factory $TodaySummaryCopyWith(TodaySummary value, $Res Function(TodaySummary) _then) = _$TodaySummaryCopyWithImpl;
@useResult
$Res call({
 int steps, int activeMinutes, int caloriesBurned, double sleepHours, int caloriesIntake, CalorieBudget calorieBudget, double? latestWeight, double? weightDelta
});


$CalorieBudgetCopyWith<$Res> get calorieBudget;

}
/// @nodoc
class _$TodaySummaryCopyWithImpl<$Res>
    implements $TodaySummaryCopyWith<$Res> {
  _$TodaySummaryCopyWithImpl(this._self, this._then);

  final TodaySummary _self;
  final $Res Function(TodaySummary) _then;

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? caloriesIntake = null,Object? calorieBudget = null,Object? latestWeight = freezed,Object? weightDelta = freezed,}) {
  return _then(_self.copyWith(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,caloriesIntake: null == caloriesIntake ? _self.caloriesIntake : caloriesIntake // ignore: cast_nullable_to_non_nullable
as int,calorieBudget: null == calorieBudget ? _self.calorieBudget : calorieBudget // ignore: cast_nullable_to_non_nullable
as CalorieBudget,latestWeight: freezed == latestWeight ? _self.latestWeight : latestWeight // ignore: cast_nullable_to_non_nullable
as double?,weightDelta: freezed == weightDelta ? _self.weightDelta : weightDelta // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalorieBudgetCopyWith<$Res> get calorieBudget {
  
  return $CalorieBudgetCopyWith<$Res>(_self.calorieBudget, (value) {
    return _then(_self.copyWith(calorieBudget: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodaySummary].
extension TodaySummaryPatterns on TodaySummary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodaySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodaySummary value)  $default,){
final _that = this;
switch (_that) {
case _TodaySummary():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodaySummary value)?  $default,){
final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int caloriesIntake,  CalorieBudget calorieBudget,  double? latestWeight,  double? weightDelta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
return $default(_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.caloriesIntake,_that.calorieBudget,_that.latestWeight,_that.weightDelta);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int caloriesIntake,  CalorieBudget calorieBudget,  double? latestWeight,  double? weightDelta)  $default,) {final _that = this;
switch (_that) {
case _TodaySummary():
return $default(_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.caloriesIntake,_that.calorieBudget,_that.latestWeight,_that.weightDelta);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int caloriesIntake,  CalorieBudget calorieBudget,  double? latestWeight,  double? weightDelta)?  $default,) {final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
return $default(_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.caloriesIntake,_that.calorieBudget,_that.latestWeight,_that.weightDelta);case _:
  return null;

}
}

}

/// @nodoc


class _TodaySummary implements TodaySummary {
  const _TodaySummary({required this.steps, required this.activeMinutes, required this.caloriesBurned, required this.sleepHours, required this.caloriesIntake, required this.calorieBudget, this.latestWeight, this.weightDelta});
  

@override final  int steps;
@override final  int activeMinutes;
@override final  int caloriesBurned;
@override final  double sleepHours;
@override final  int caloriesIntake;
@override final  CalorieBudget calorieBudget;
@override final  double? latestWeight;
@override final  double? weightDelta;

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodaySummaryCopyWith<_TodaySummary> get copyWith => __$TodaySummaryCopyWithImpl<_TodaySummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodaySummary&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.caloriesIntake, caloriesIntake) || other.caloriesIntake == caloriesIntake)&&(identical(other.calorieBudget, calorieBudget) || other.calorieBudget == calorieBudget)&&(identical(other.latestWeight, latestWeight) || other.latestWeight == latestWeight)&&(identical(other.weightDelta, weightDelta) || other.weightDelta == weightDelta));
}


@override
int get hashCode => Object.hash(runtimeType,steps,activeMinutes,caloriesBurned,sleepHours,caloriesIntake,calorieBudget,latestWeight,weightDelta);

@override
String toString() {
  return 'TodaySummary(steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, caloriesIntake: $caloriesIntake, calorieBudget: $calorieBudget, latestWeight: $latestWeight, weightDelta: $weightDelta)';
}


}

/// @nodoc
abstract mixin class _$TodaySummaryCopyWith<$Res> implements $TodaySummaryCopyWith<$Res> {
  factory _$TodaySummaryCopyWith(_TodaySummary value, $Res Function(_TodaySummary) _then) = __$TodaySummaryCopyWithImpl;
@override @useResult
$Res call({
 int steps, int activeMinutes, int caloriesBurned, double sleepHours, int caloriesIntake, CalorieBudget calorieBudget, double? latestWeight, double? weightDelta
});


@override $CalorieBudgetCopyWith<$Res> get calorieBudget;

}
/// @nodoc
class __$TodaySummaryCopyWithImpl<$Res>
    implements _$TodaySummaryCopyWith<$Res> {
  __$TodaySummaryCopyWithImpl(this._self, this._then);

  final _TodaySummary _self;
  final $Res Function(_TodaySummary) _then;

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? caloriesIntake = null,Object? calorieBudget = null,Object? latestWeight = freezed,Object? weightDelta = freezed,}) {
  return _then(_TodaySummary(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,caloriesIntake: null == caloriesIntake ? _self.caloriesIntake : caloriesIntake // ignore: cast_nullable_to_non_nullable
as int,calorieBudget: null == calorieBudget ? _self.calorieBudget : calorieBudget // ignore: cast_nullable_to_non_nullable
as CalorieBudget,latestWeight: freezed == latestWeight ? _self.latestWeight : latestWeight // ignore: cast_nullable_to_non_nullable
as double?,weightDelta: freezed == weightDelta ? _self.weightDelta : weightDelta // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalorieBudgetCopyWith<$Res> get calorieBudget {
  
  return $CalorieBudgetCopyWith<$Res>(_self.calorieBudget, (value) {
    return _then(_self.copyWith(calorieBudget: value));
  });
}
}

/// @nodoc
mixin _$CalorieBudget {

 int get burned; int get intake; int get deficit; int get remaining; bool get isOverBudget;
/// Create a copy of CalorieBudget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalorieBudgetCopyWith<CalorieBudget> get copyWith => _$CalorieBudgetCopyWithImpl<CalorieBudget>(this as CalorieBudget, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalorieBudget&&(identical(other.burned, burned) || other.burned == burned)&&(identical(other.intake, intake) || other.intake == intake)&&(identical(other.deficit, deficit) || other.deficit == deficit)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.isOverBudget, isOverBudget) || other.isOverBudget == isOverBudget));
}


@override
int get hashCode => Object.hash(runtimeType,burned,intake,deficit,remaining,isOverBudget);

@override
String toString() {
  return 'CalorieBudget(burned: $burned, intake: $intake, deficit: $deficit, remaining: $remaining, isOverBudget: $isOverBudget)';
}


}

/// @nodoc
abstract mixin class $CalorieBudgetCopyWith<$Res>  {
  factory $CalorieBudgetCopyWith(CalorieBudget value, $Res Function(CalorieBudget) _then) = _$CalorieBudgetCopyWithImpl;
@useResult
$Res call({
 int burned, int intake, int deficit, int remaining, bool isOverBudget
});




}
/// @nodoc
class _$CalorieBudgetCopyWithImpl<$Res>
    implements $CalorieBudgetCopyWith<$Res> {
  _$CalorieBudgetCopyWithImpl(this._self, this._then);

  final CalorieBudget _self;
  final $Res Function(CalorieBudget) _then;

/// Create a copy of CalorieBudget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? burned = null,Object? intake = null,Object? deficit = null,Object? remaining = null,Object? isOverBudget = null,}) {
  return _then(_self.copyWith(
burned: null == burned ? _self.burned : burned // ignore: cast_nullable_to_non_nullable
as int,intake: null == intake ? _self.intake : intake // ignore: cast_nullable_to_non_nullable
as int,deficit: null == deficit ? _self.deficit : deficit // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,isOverBudget: null == isOverBudget ? _self.isOverBudget : isOverBudget // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CalorieBudget].
extension CalorieBudgetPatterns on CalorieBudget {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalorieBudget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalorieBudget() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalorieBudget value)  $default,){
final _that = this;
switch (_that) {
case _CalorieBudget():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalorieBudget value)?  $default,){
final _that = this;
switch (_that) {
case _CalorieBudget() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int burned,  int intake,  int deficit,  int remaining,  bool isOverBudget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalorieBudget() when $default != null:
return $default(_that.burned,_that.intake,_that.deficit,_that.remaining,_that.isOverBudget);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int burned,  int intake,  int deficit,  int remaining,  bool isOverBudget)  $default,) {final _that = this;
switch (_that) {
case _CalorieBudget():
return $default(_that.burned,_that.intake,_that.deficit,_that.remaining,_that.isOverBudget);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int burned,  int intake,  int deficit,  int remaining,  bool isOverBudget)?  $default,) {final _that = this;
switch (_that) {
case _CalorieBudget() when $default != null:
return $default(_that.burned,_that.intake,_that.deficit,_that.remaining,_that.isOverBudget);case _:
  return null;

}
}

}

/// @nodoc


class _CalorieBudget implements CalorieBudget {
  const _CalorieBudget({required this.burned, required this.intake, required this.deficit, required this.remaining, required this.isOverBudget});
  

@override final  int burned;
@override final  int intake;
@override final  int deficit;
@override final  int remaining;
@override final  bool isOverBudget;

/// Create a copy of CalorieBudget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalorieBudgetCopyWith<_CalorieBudget> get copyWith => __$CalorieBudgetCopyWithImpl<_CalorieBudget>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalorieBudget&&(identical(other.burned, burned) || other.burned == burned)&&(identical(other.intake, intake) || other.intake == intake)&&(identical(other.deficit, deficit) || other.deficit == deficit)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.isOverBudget, isOverBudget) || other.isOverBudget == isOverBudget));
}


@override
int get hashCode => Object.hash(runtimeType,burned,intake,deficit,remaining,isOverBudget);

@override
String toString() {
  return 'CalorieBudget(burned: $burned, intake: $intake, deficit: $deficit, remaining: $remaining, isOverBudget: $isOverBudget)';
}


}

/// @nodoc
abstract mixin class _$CalorieBudgetCopyWith<$Res> implements $CalorieBudgetCopyWith<$Res> {
  factory _$CalorieBudgetCopyWith(_CalorieBudget value, $Res Function(_CalorieBudget) _then) = __$CalorieBudgetCopyWithImpl;
@override @useResult
$Res call({
 int burned, int intake, int deficit, int remaining, bool isOverBudget
});




}
/// @nodoc
class __$CalorieBudgetCopyWithImpl<$Res>
    implements _$CalorieBudgetCopyWith<$Res> {
  __$CalorieBudgetCopyWithImpl(this._self, this._then);

  final _CalorieBudget _self;
  final $Res Function(_CalorieBudget) _then;

/// Create a copy of CalorieBudget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? burned = null,Object? intake = null,Object? deficit = null,Object? remaining = null,Object? isOverBudget = null,}) {
  return _then(_CalorieBudget(
burned: null == burned ? _self.burned : burned // ignore: cast_nullable_to_non_nullable
as int,intake: null == intake ? _self.intake : intake // ignore: cast_nullable_to_non_nullable
as int,deficit: null == deficit ? _self.deficit : deficit // ignore: cast_nullable_to_non_nullable
as int,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as int,isOverBudget: null == isOverBudget ? _self.isOverBudget : isOverBudget // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
