// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_review_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeeklyReviewData {

 DateTime get weekStart; DateTime get weekEnd; double get avgSleepHours; int? get avgHrv; int get totalSteps; int get totalCaloriesBurned; int get exerciseMinutes; int get waterDays; int get goalCompletionRate; String get title; List<DailyReviewItem> get dailyItems;
/// Create a copy of WeeklyReviewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyReviewDataCopyWith<WeeklyReviewData> get copyWith => _$WeeklyReviewDataCopyWithImpl<WeeklyReviewData>(this as WeeklyReviewData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyReviewData&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.weekEnd, weekEnd) || other.weekEnd == weekEnd)&&(identical(other.avgSleepHours, avgSleepHours) || other.avgSleepHours == avgSleepHours)&&(identical(other.avgHrv, avgHrv) || other.avgHrv == avgHrv)&&(identical(other.totalSteps, totalSteps) || other.totalSteps == totalSteps)&&(identical(other.totalCaloriesBurned, totalCaloriesBurned) || other.totalCaloriesBurned == totalCaloriesBurned)&&(identical(other.exerciseMinutes, exerciseMinutes) || other.exerciseMinutes == exerciseMinutes)&&(identical(other.waterDays, waterDays) || other.waterDays == waterDays)&&(identical(other.goalCompletionRate, goalCompletionRate) || other.goalCompletionRate == goalCompletionRate)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.dailyItems, dailyItems));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,weekEnd,avgSleepHours,avgHrv,totalSteps,totalCaloriesBurned,exerciseMinutes,waterDays,goalCompletionRate,title,const DeepCollectionEquality().hash(dailyItems));

@override
String toString() {
  return 'WeeklyReviewData(weekStart: $weekStart, weekEnd: $weekEnd, avgSleepHours: $avgSleepHours, avgHrv: $avgHrv, totalSteps: $totalSteps, totalCaloriesBurned: $totalCaloriesBurned, exerciseMinutes: $exerciseMinutes, waterDays: $waterDays, goalCompletionRate: $goalCompletionRate, title: $title, dailyItems: $dailyItems)';
}


}

/// @nodoc
abstract mixin class $WeeklyReviewDataCopyWith<$Res>  {
  factory $WeeklyReviewDataCopyWith(WeeklyReviewData value, $Res Function(WeeklyReviewData) _then) = _$WeeklyReviewDataCopyWithImpl;
@useResult
$Res call({
 DateTime weekStart, DateTime weekEnd, double avgSleepHours, int? avgHrv, int totalSteps, int totalCaloriesBurned, int exerciseMinutes, int waterDays, int goalCompletionRate, String title, List<DailyReviewItem> dailyItems
});




}
/// @nodoc
class _$WeeklyReviewDataCopyWithImpl<$Res>
    implements $WeeklyReviewDataCopyWith<$Res> {
  _$WeeklyReviewDataCopyWithImpl(this._self, this._then);

  final WeeklyReviewData _self;
  final $Res Function(WeeklyReviewData) _then;

/// Create a copy of WeeklyReviewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekStart = null,Object? weekEnd = null,Object? avgSleepHours = null,Object? avgHrv = freezed,Object? totalSteps = null,Object? totalCaloriesBurned = null,Object? exerciseMinutes = null,Object? waterDays = null,Object? goalCompletionRate = null,Object? title = null,Object? dailyItems = null,}) {
  return _then(_self.copyWith(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,weekEnd: null == weekEnd ? _self.weekEnd : weekEnd // ignore: cast_nullable_to_non_nullable
as DateTime,avgSleepHours: null == avgSleepHours ? _self.avgSleepHours : avgSleepHours // ignore: cast_nullable_to_non_nullable
as double,avgHrv: freezed == avgHrv ? _self.avgHrv : avgHrv // ignore: cast_nullable_to_non_nullable
as int?,totalSteps: null == totalSteps ? _self.totalSteps : totalSteps // ignore: cast_nullable_to_non_nullable
as int,totalCaloriesBurned: null == totalCaloriesBurned ? _self.totalCaloriesBurned : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
as int,exerciseMinutes: null == exerciseMinutes ? _self.exerciseMinutes : exerciseMinutes // ignore: cast_nullable_to_non_nullable
as int,waterDays: null == waterDays ? _self.waterDays : waterDays // ignore: cast_nullable_to_non_nullable
as int,goalCompletionRate: null == goalCompletionRate ? _self.goalCompletionRate : goalCompletionRate // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dailyItems: null == dailyItems ? _self.dailyItems : dailyItems // ignore: cast_nullable_to_non_nullable
as List<DailyReviewItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyReviewData].
extension WeeklyReviewDataPatterns on WeeklyReviewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyReviewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyReviewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyReviewData value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyReviewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyReviewData value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyReviewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime weekStart,  DateTime weekEnd,  double avgSleepHours,  int? avgHrv,  int totalSteps,  int totalCaloriesBurned,  int exerciseMinutes,  int waterDays,  int goalCompletionRate,  String title,  List<DailyReviewItem> dailyItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyReviewData() when $default != null:
return $default(_that.weekStart,_that.weekEnd,_that.avgSleepHours,_that.avgHrv,_that.totalSteps,_that.totalCaloriesBurned,_that.exerciseMinutes,_that.waterDays,_that.goalCompletionRate,_that.title,_that.dailyItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime weekStart,  DateTime weekEnd,  double avgSleepHours,  int? avgHrv,  int totalSteps,  int totalCaloriesBurned,  int exerciseMinutes,  int waterDays,  int goalCompletionRate,  String title,  List<DailyReviewItem> dailyItems)  $default,) {final _that = this;
switch (_that) {
case _WeeklyReviewData():
return $default(_that.weekStart,_that.weekEnd,_that.avgSleepHours,_that.avgHrv,_that.totalSteps,_that.totalCaloriesBurned,_that.exerciseMinutes,_that.waterDays,_that.goalCompletionRate,_that.title,_that.dailyItems);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime weekStart,  DateTime weekEnd,  double avgSleepHours,  int? avgHrv,  int totalSteps,  int totalCaloriesBurned,  int exerciseMinutes,  int waterDays,  int goalCompletionRate,  String title,  List<DailyReviewItem> dailyItems)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyReviewData() when $default != null:
return $default(_that.weekStart,_that.weekEnd,_that.avgSleepHours,_that.avgHrv,_that.totalSteps,_that.totalCaloriesBurned,_that.exerciseMinutes,_that.waterDays,_that.goalCompletionRate,_that.title,_that.dailyItems);case _:
  return null;

}
}

}

/// @nodoc


class _WeeklyReviewData extends WeeklyReviewData {
  const _WeeklyReviewData({required this.weekStart, required this.weekEnd, required this.avgSleepHours, this.avgHrv, required this.totalSteps, required this.totalCaloriesBurned, required this.exerciseMinutes, required this.waterDays, required this.goalCompletionRate, required this.title, required final  List<DailyReviewItem> dailyItems}): _dailyItems = dailyItems,super._();
  

@override final  DateTime weekStart;
@override final  DateTime weekEnd;
@override final  double avgSleepHours;
@override final  int? avgHrv;
@override final  int totalSteps;
@override final  int totalCaloriesBurned;
@override final  int exerciseMinutes;
@override final  int waterDays;
@override final  int goalCompletionRate;
@override final  String title;
 final  List<DailyReviewItem> _dailyItems;
@override List<DailyReviewItem> get dailyItems {
  if (_dailyItems is EqualUnmodifiableListView) return _dailyItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyItems);
}


/// Create a copy of WeeklyReviewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyReviewDataCopyWith<_WeeklyReviewData> get copyWith => __$WeeklyReviewDataCopyWithImpl<_WeeklyReviewData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyReviewData&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.weekEnd, weekEnd) || other.weekEnd == weekEnd)&&(identical(other.avgSleepHours, avgSleepHours) || other.avgSleepHours == avgSleepHours)&&(identical(other.avgHrv, avgHrv) || other.avgHrv == avgHrv)&&(identical(other.totalSteps, totalSteps) || other.totalSteps == totalSteps)&&(identical(other.totalCaloriesBurned, totalCaloriesBurned) || other.totalCaloriesBurned == totalCaloriesBurned)&&(identical(other.exerciseMinutes, exerciseMinutes) || other.exerciseMinutes == exerciseMinutes)&&(identical(other.waterDays, waterDays) || other.waterDays == waterDays)&&(identical(other.goalCompletionRate, goalCompletionRate) || other.goalCompletionRate == goalCompletionRate)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._dailyItems, _dailyItems));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,weekEnd,avgSleepHours,avgHrv,totalSteps,totalCaloriesBurned,exerciseMinutes,waterDays,goalCompletionRate,title,const DeepCollectionEquality().hash(_dailyItems));

@override
String toString() {
  return 'WeeklyReviewData(weekStart: $weekStart, weekEnd: $weekEnd, avgSleepHours: $avgSleepHours, avgHrv: $avgHrv, totalSteps: $totalSteps, totalCaloriesBurned: $totalCaloriesBurned, exerciseMinutes: $exerciseMinutes, waterDays: $waterDays, goalCompletionRate: $goalCompletionRate, title: $title, dailyItems: $dailyItems)';
}


}

/// @nodoc
abstract mixin class _$WeeklyReviewDataCopyWith<$Res> implements $WeeklyReviewDataCopyWith<$Res> {
  factory _$WeeklyReviewDataCopyWith(_WeeklyReviewData value, $Res Function(_WeeklyReviewData) _then) = __$WeeklyReviewDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime weekStart, DateTime weekEnd, double avgSleepHours, int? avgHrv, int totalSteps, int totalCaloriesBurned, int exerciseMinutes, int waterDays, int goalCompletionRate, String title, List<DailyReviewItem> dailyItems
});




}
/// @nodoc
class __$WeeklyReviewDataCopyWithImpl<$Res>
    implements _$WeeklyReviewDataCopyWith<$Res> {
  __$WeeklyReviewDataCopyWithImpl(this._self, this._then);

  final _WeeklyReviewData _self;
  final $Res Function(_WeeklyReviewData) _then;

/// Create a copy of WeeklyReviewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekStart = null,Object? weekEnd = null,Object? avgSleepHours = null,Object? avgHrv = freezed,Object? totalSteps = null,Object? totalCaloriesBurned = null,Object? exerciseMinutes = null,Object? waterDays = null,Object? goalCompletionRate = null,Object? title = null,Object? dailyItems = null,}) {
  return _then(_WeeklyReviewData(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,weekEnd: null == weekEnd ? _self.weekEnd : weekEnd // ignore: cast_nullable_to_non_nullable
as DateTime,avgSleepHours: null == avgSleepHours ? _self.avgSleepHours : avgSleepHours // ignore: cast_nullable_to_non_nullable
as double,avgHrv: freezed == avgHrv ? _self.avgHrv : avgHrv // ignore: cast_nullable_to_non_nullable
as int?,totalSteps: null == totalSteps ? _self.totalSteps : totalSteps // ignore: cast_nullable_to_non_nullable
as int,totalCaloriesBurned: null == totalCaloriesBurned ? _self.totalCaloriesBurned : totalCaloriesBurned // ignore: cast_nullable_to_non_nullable
as int,exerciseMinutes: null == exerciseMinutes ? _self.exerciseMinutes : exerciseMinutes // ignore: cast_nullable_to_non_nullable
as int,waterDays: null == waterDays ? _self.waterDays : waterDays // ignore: cast_nullable_to_non_nullable
as int,goalCompletionRate: null == goalCompletionRate ? _self.goalCompletionRate : goalCompletionRate // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dailyItems: null == dailyItems ? _self._dailyItems : dailyItems // ignore: cast_nullable_to_non_nullable
as List<DailyReviewItem>,
  ));
}


}

/// @nodoc
mixin _$DailyReviewItem {

 DateTime get date; int get steps; int get activeMinutes; int get caloriesBurned; double get sleepHours; int? get hrv; int get goalsCompleted; int get goalsTotal;
/// Create a copy of DailyReviewItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyReviewItemCopyWith<DailyReviewItem> get copyWith => _$DailyReviewItemCopyWithImpl<DailyReviewItem>(this as DailyReviewItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyReviewItem&&(identical(other.date, date) || other.date == date)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.hrv, hrv) || other.hrv == hrv)&&(identical(other.goalsCompleted, goalsCompleted) || other.goalsCompleted == goalsCompleted)&&(identical(other.goalsTotal, goalsTotal) || other.goalsTotal == goalsTotal));
}


@override
int get hashCode => Object.hash(runtimeType,date,steps,activeMinutes,caloriesBurned,sleepHours,hrv,goalsCompleted,goalsTotal);

@override
String toString() {
  return 'DailyReviewItem(date: $date, steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, hrv: $hrv, goalsCompleted: $goalsCompleted, goalsTotal: $goalsTotal)';
}


}

/// @nodoc
abstract mixin class $DailyReviewItemCopyWith<$Res>  {
  factory $DailyReviewItemCopyWith(DailyReviewItem value, $Res Function(DailyReviewItem) _then) = _$DailyReviewItemCopyWithImpl;
@useResult
$Res call({
 DateTime date, int steps, int activeMinutes, int caloriesBurned, double sleepHours, int? hrv, int goalsCompleted, int goalsTotal
});




}
/// @nodoc
class _$DailyReviewItemCopyWithImpl<$Res>
    implements $DailyReviewItemCopyWith<$Res> {
  _$DailyReviewItemCopyWithImpl(this._self, this._then);

  final DailyReviewItem _self;
  final $Res Function(DailyReviewItem) _then;

/// Create a copy of DailyReviewItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? hrv = freezed,Object? goalsCompleted = null,Object? goalsTotal = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,hrv: freezed == hrv ? _self.hrv : hrv // ignore: cast_nullable_to_non_nullable
as int?,goalsCompleted: null == goalsCompleted ? _self.goalsCompleted : goalsCompleted // ignore: cast_nullable_to_non_nullable
as int,goalsTotal: null == goalsTotal ? _self.goalsTotal : goalsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyReviewItem].
extension DailyReviewItemPatterns on DailyReviewItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyReviewItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyReviewItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyReviewItem value)  $default,){
final _that = this;
switch (_that) {
case _DailyReviewItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyReviewItem value)?  $default,){
final _that = this;
switch (_that) {
case _DailyReviewItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int? hrv,  int goalsCompleted,  int goalsTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyReviewItem() when $default != null:
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.hrv,_that.goalsCompleted,_that.goalsTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int? hrv,  int goalsCompleted,  int goalsTotal)  $default,) {final _that = this;
switch (_that) {
case _DailyReviewItem():
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.hrv,_that.goalsCompleted,_that.goalsTotal);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int? hrv,  int goalsCompleted,  int goalsTotal)?  $default,) {final _that = this;
switch (_that) {
case _DailyReviewItem() when $default != null:
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.hrv,_that.goalsCompleted,_that.goalsTotal);case _:
  return null;

}
}

}

/// @nodoc


class _DailyReviewItem implements DailyReviewItem {
  const _DailyReviewItem({required this.date, required this.steps, required this.activeMinutes, required this.caloriesBurned, required this.sleepHours, this.hrv, required this.goalsCompleted, required this.goalsTotal});
  

@override final  DateTime date;
@override final  int steps;
@override final  int activeMinutes;
@override final  int caloriesBurned;
@override final  double sleepHours;
@override final  int? hrv;
@override final  int goalsCompleted;
@override final  int goalsTotal;

/// Create a copy of DailyReviewItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyReviewItemCopyWith<_DailyReviewItem> get copyWith => __$DailyReviewItemCopyWithImpl<_DailyReviewItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyReviewItem&&(identical(other.date, date) || other.date == date)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.hrv, hrv) || other.hrv == hrv)&&(identical(other.goalsCompleted, goalsCompleted) || other.goalsCompleted == goalsCompleted)&&(identical(other.goalsTotal, goalsTotal) || other.goalsTotal == goalsTotal));
}


@override
int get hashCode => Object.hash(runtimeType,date,steps,activeMinutes,caloriesBurned,sleepHours,hrv,goalsCompleted,goalsTotal);

@override
String toString() {
  return 'DailyReviewItem(date: $date, steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, hrv: $hrv, goalsCompleted: $goalsCompleted, goalsTotal: $goalsTotal)';
}


}

/// @nodoc
abstract mixin class _$DailyReviewItemCopyWith<$Res> implements $DailyReviewItemCopyWith<$Res> {
  factory _$DailyReviewItemCopyWith(_DailyReviewItem value, $Res Function(_DailyReviewItem) _then) = __$DailyReviewItemCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int steps, int activeMinutes, int caloriesBurned, double sleepHours, int? hrv, int goalsCompleted, int goalsTotal
});




}
/// @nodoc
class __$DailyReviewItemCopyWithImpl<$Res>
    implements _$DailyReviewItemCopyWith<$Res> {
  __$DailyReviewItemCopyWithImpl(this._self, this._then);

  final _DailyReviewItem _self;
  final $Res Function(_DailyReviewItem) _then;

/// Create a copy of DailyReviewItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? hrv = freezed,Object? goalsCompleted = null,Object? goalsTotal = null,}) {
  return _then(_DailyReviewItem(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,hrv: freezed == hrv ? _self.hrv : hrv // ignore: cast_nullable_to_non_nullable
as int?,goalsCompleted: null == goalsCompleted ? _self.goalsCompleted : goalsCompleted // ignore: cast_nullable_to_non_nullable
as int,goalsTotal: null == goalsTotal ? _self.goalsTotal : goalsTotal // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
