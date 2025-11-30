// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlanProgress {

 int get planId; double get initialWeight; double get targetWeight; double get currentWeight; int get currentDay; int get totalDays; DateTime get startDate; DateTime get endDate; int get dailyCalorieDeficit; double get bmi;
/// Create a copy of PlanProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanProgressCopyWith<PlanProgress> get copyWith => _$PlanProgressCopyWithImpl<PlanProgress>(this as PlanProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanProgress&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.initialWeight, initialWeight) || other.initialWeight == initialWeight)&&(identical(other.targetWeight, targetWeight) || other.targetWeight == targetWeight)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.currentDay, currentDay) || other.currentDay == currentDay)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.dailyCalorieDeficit, dailyCalorieDeficit) || other.dailyCalorieDeficit == dailyCalorieDeficit)&&(identical(other.bmi, bmi) || other.bmi == bmi));
}


@override
int get hashCode => Object.hash(runtimeType,planId,initialWeight,targetWeight,currentWeight,currentDay,totalDays,startDate,endDate,dailyCalorieDeficit,bmi);

@override
String toString() {
  return 'PlanProgress(planId: $planId, initialWeight: $initialWeight, targetWeight: $targetWeight, currentWeight: $currentWeight, currentDay: $currentDay, totalDays: $totalDays, startDate: $startDate, endDate: $endDate, dailyCalorieDeficit: $dailyCalorieDeficit, bmi: $bmi)';
}


}

/// @nodoc
abstract mixin class $PlanProgressCopyWith<$Res>  {
  factory $PlanProgressCopyWith(PlanProgress value, $Res Function(PlanProgress) _then) = _$PlanProgressCopyWithImpl;
@useResult
$Res call({
 int planId, double initialWeight, double targetWeight, double currentWeight, int currentDay, int totalDays, DateTime startDate, DateTime endDate, int dailyCalorieDeficit, double bmi
});




}
/// @nodoc
class _$PlanProgressCopyWithImpl<$Res>
    implements $PlanProgressCopyWith<$Res> {
  _$PlanProgressCopyWithImpl(this._self, this._then);

  final PlanProgress _self;
  final $Res Function(PlanProgress) _then;

/// Create a copy of PlanProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planId = null,Object? initialWeight = null,Object? targetWeight = null,Object? currentWeight = null,Object? currentDay = null,Object? totalDays = null,Object? startDate = null,Object? endDate = null,Object? dailyCalorieDeficit = null,Object? bmi = null,}) {
  return _then(_self.copyWith(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,initialWeight: null == initialWeight ? _self.initialWeight : initialWeight // ignore: cast_nullable_to_non_nullable
as double,targetWeight: null == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double,currentWeight: null == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double,currentDay: null == currentDay ? _self.currentDay : currentDay // ignore: cast_nullable_to_non_nullable
as int,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,dailyCalorieDeficit: null == dailyCalorieDeficit ? _self.dailyCalorieDeficit : dailyCalorieDeficit // ignore: cast_nullable_to_non_nullable
as int,bmi: null == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanProgress].
extension PlanProgressPatterns on PlanProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanProgress value)  $default,){
final _that = this;
switch (_that) {
case _PlanProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanProgress value)?  $default,){
final _that = this;
switch (_that) {
case _PlanProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int planId,  double initialWeight,  double targetWeight,  double currentWeight,  int currentDay,  int totalDays,  DateTime startDate,  DateTime endDate,  int dailyCalorieDeficit,  double bmi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanProgress() when $default != null:
return $default(_that.planId,_that.initialWeight,_that.targetWeight,_that.currentWeight,_that.currentDay,_that.totalDays,_that.startDate,_that.endDate,_that.dailyCalorieDeficit,_that.bmi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int planId,  double initialWeight,  double targetWeight,  double currentWeight,  int currentDay,  int totalDays,  DateTime startDate,  DateTime endDate,  int dailyCalorieDeficit,  double bmi)  $default,) {final _that = this;
switch (_that) {
case _PlanProgress():
return $default(_that.planId,_that.initialWeight,_that.targetWeight,_that.currentWeight,_that.currentDay,_that.totalDays,_that.startDate,_that.endDate,_that.dailyCalorieDeficit,_that.bmi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int planId,  double initialWeight,  double targetWeight,  double currentWeight,  int currentDay,  int totalDays,  DateTime startDate,  DateTime endDate,  int dailyCalorieDeficit,  double bmi)?  $default,) {final _that = this;
switch (_that) {
case _PlanProgress() when $default != null:
return $default(_that.planId,_that.initialWeight,_that.targetWeight,_that.currentWeight,_that.currentDay,_that.totalDays,_that.startDate,_that.endDate,_that.dailyCalorieDeficit,_that.bmi);case _:
  return null;

}
}

}

/// @nodoc


class _PlanProgress extends PlanProgress {
  const _PlanProgress({required this.planId, required this.initialWeight, required this.targetWeight, required this.currentWeight, required this.currentDay, required this.totalDays, required this.startDate, required this.endDate, required this.dailyCalorieDeficit, required this.bmi}): super._();
  

@override final  int planId;
@override final  double initialWeight;
@override final  double targetWeight;
@override final  double currentWeight;
@override final  int currentDay;
@override final  int totalDays;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int dailyCalorieDeficit;
@override final  double bmi;

/// Create a copy of PlanProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanProgressCopyWith<_PlanProgress> get copyWith => __$PlanProgressCopyWithImpl<_PlanProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanProgress&&(identical(other.planId, planId) || other.planId == planId)&&(identical(other.initialWeight, initialWeight) || other.initialWeight == initialWeight)&&(identical(other.targetWeight, targetWeight) || other.targetWeight == targetWeight)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.currentDay, currentDay) || other.currentDay == currentDay)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.dailyCalorieDeficit, dailyCalorieDeficit) || other.dailyCalorieDeficit == dailyCalorieDeficit)&&(identical(other.bmi, bmi) || other.bmi == bmi));
}


@override
int get hashCode => Object.hash(runtimeType,planId,initialWeight,targetWeight,currentWeight,currentDay,totalDays,startDate,endDate,dailyCalorieDeficit,bmi);

@override
String toString() {
  return 'PlanProgress(planId: $planId, initialWeight: $initialWeight, targetWeight: $targetWeight, currentWeight: $currentWeight, currentDay: $currentDay, totalDays: $totalDays, startDate: $startDate, endDate: $endDate, dailyCalorieDeficit: $dailyCalorieDeficit, bmi: $bmi)';
}


}

/// @nodoc
abstract mixin class _$PlanProgressCopyWith<$Res> implements $PlanProgressCopyWith<$Res> {
  factory _$PlanProgressCopyWith(_PlanProgress value, $Res Function(_PlanProgress) _then) = __$PlanProgressCopyWithImpl;
@override @useResult
$Res call({
 int planId, double initialWeight, double targetWeight, double currentWeight, int currentDay, int totalDays, DateTime startDate, DateTime endDate, int dailyCalorieDeficit, double bmi
});




}
/// @nodoc
class __$PlanProgressCopyWithImpl<$Res>
    implements _$PlanProgressCopyWith<$Res> {
  __$PlanProgressCopyWithImpl(this._self, this._then);

  final _PlanProgress _self;
  final $Res Function(_PlanProgress) _then;

/// Create a copy of PlanProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planId = null,Object? initialWeight = null,Object? targetWeight = null,Object? currentWeight = null,Object? currentDay = null,Object? totalDays = null,Object? startDate = null,Object? endDate = null,Object? dailyCalorieDeficit = null,Object? bmi = null,}) {
  return _then(_PlanProgress(
planId: null == planId ? _self.planId : planId // ignore: cast_nullable_to_non_nullable
as int,initialWeight: null == initialWeight ? _self.initialWeight : initialWeight // ignore: cast_nullable_to_non_nullable
as double,targetWeight: null == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double,currentWeight: null == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double,currentDay: null == currentDay ? _self.currentDay : currentDay // ignore: cast_nullable_to_non_nullable
as int,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,dailyCalorieDeficit: null == dailyCalorieDeficit ? _self.dailyCalorieDeficit : dailyCalorieDeficit // ignore: cast_nullable_to_non_nullable
as int,bmi: null == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
