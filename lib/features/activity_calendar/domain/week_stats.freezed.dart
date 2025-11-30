// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeekStats {

 DateTime get weekStart; int get activeDays; int get totalMinutes; int get totalCalories; int get streak; List<DayActivity> get dayActivities;
/// Create a copy of WeekStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekStatsCopyWith<WeekStats> get copyWith => _$WeekStatsCopyWithImpl<WeekStats>(this as WeekStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekStats&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.activeDays, activeDays) || other.activeDays == activeDays)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.totalCalories, totalCalories) || other.totalCalories == totalCalories)&&(identical(other.streak, streak) || other.streak == streak)&&const DeepCollectionEquality().equals(other.dayActivities, dayActivities));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,activeDays,totalMinutes,totalCalories,streak,const DeepCollectionEquality().hash(dayActivities));

@override
String toString() {
  return 'WeekStats(weekStart: $weekStart, activeDays: $activeDays, totalMinutes: $totalMinutes, totalCalories: $totalCalories, streak: $streak, dayActivities: $dayActivities)';
}


}

/// @nodoc
abstract mixin class $WeekStatsCopyWith<$Res>  {
  factory $WeekStatsCopyWith(WeekStats value, $Res Function(WeekStats) _then) = _$WeekStatsCopyWithImpl;
@useResult
$Res call({
 DateTime weekStart, int activeDays, int totalMinutes, int totalCalories, int streak, List<DayActivity> dayActivities
});




}
/// @nodoc
class _$WeekStatsCopyWithImpl<$Res>
    implements $WeekStatsCopyWith<$Res> {
  _$WeekStatsCopyWithImpl(this._self, this._then);

  final WeekStats _self;
  final $Res Function(WeekStats) _then;

/// Create a copy of WeekStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekStart = null,Object? activeDays = null,Object? totalMinutes = null,Object? totalCalories = null,Object? streak = null,Object? dayActivities = null,}) {
  return _then(_self.copyWith(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,activeDays: null == activeDays ? _self.activeDays : activeDays // ignore: cast_nullable_to_non_nullable
as int,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,totalCalories: null == totalCalories ? _self.totalCalories : totalCalories // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,dayActivities: null == dayActivities ? _self.dayActivities : dayActivities // ignore: cast_nullable_to_non_nullable
as List<DayActivity>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeekStats].
extension WeekStatsPatterns on WeekStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeekStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeekStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeekStats value)  $default,){
final _that = this;
switch (_that) {
case _WeekStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeekStats value)?  $default,){
final _that = this;
switch (_that) {
case _WeekStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime weekStart,  int activeDays,  int totalMinutes,  int totalCalories,  int streak,  List<DayActivity> dayActivities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeekStats() when $default != null:
return $default(_that.weekStart,_that.activeDays,_that.totalMinutes,_that.totalCalories,_that.streak,_that.dayActivities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime weekStart,  int activeDays,  int totalMinutes,  int totalCalories,  int streak,  List<DayActivity> dayActivities)  $default,) {final _that = this;
switch (_that) {
case _WeekStats():
return $default(_that.weekStart,_that.activeDays,_that.totalMinutes,_that.totalCalories,_that.streak,_that.dayActivities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime weekStart,  int activeDays,  int totalMinutes,  int totalCalories,  int streak,  List<DayActivity> dayActivities)?  $default,) {final _that = this;
switch (_that) {
case _WeekStats() when $default != null:
return $default(_that.weekStart,_that.activeDays,_that.totalMinutes,_that.totalCalories,_that.streak,_that.dayActivities);case _:
  return null;

}
}

}

/// @nodoc


class _WeekStats extends WeekStats {
  const _WeekStats({required this.weekStart, required this.activeDays, required this.totalMinutes, required this.totalCalories, required this.streak, required final  List<DayActivity> dayActivities}): _dayActivities = dayActivities,super._();
  

@override final  DateTime weekStart;
@override final  int activeDays;
@override final  int totalMinutes;
@override final  int totalCalories;
@override final  int streak;
 final  List<DayActivity> _dayActivities;
@override List<DayActivity> get dayActivities {
  if (_dayActivities is EqualUnmodifiableListView) return _dayActivities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dayActivities);
}


/// Create a copy of WeekStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeekStatsCopyWith<_WeekStats> get copyWith => __$WeekStatsCopyWithImpl<_WeekStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeekStats&&(identical(other.weekStart, weekStart) || other.weekStart == weekStart)&&(identical(other.activeDays, activeDays) || other.activeDays == activeDays)&&(identical(other.totalMinutes, totalMinutes) || other.totalMinutes == totalMinutes)&&(identical(other.totalCalories, totalCalories) || other.totalCalories == totalCalories)&&(identical(other.streak, streak) || other.streak == streak)&&const DeepCollectionEquality().equals(other._dayActivities, _dayActivities));
}


@override
int get hashCode => Object.hash(runtimeType,weekStart,activeDays,totalMinutes,totalCalories,streak,const DeepCollectionEquality().hash(_dayActivities));

@override
String toString() {
  return 'WeekStats(weekStart: $weekStart, activeDays: $activeDays, totalMinutes: $totalMinutes, totalCalories: $totalCalories, streak: $streak, dayActivities: $dayActivities)';
}


}

/// @nodoc
abstract mixin class _$WeekStatsCopyWith<$Res> implements $WeekStatsCopyWith<$Res> {
  factory _$WeekStatsCopyWith(_WeekStats value, $Res Function(_WeekStats) _then) = __$WeekStatsCopyWithImpl;
@override @useResult
$Res call({
 DateTime weekStart, int activeDays, int totalMinutes, int totalCalories, int streak, List<DayActivity> dayActivities
});




}
/// @nodoc
class __$WeekStatsCopyWithImpl<$Res>
    implements _$WeekStatsCopyWith<$Res> {
  __$WeekStatsCopyWithImpl(this._self, this._then);

  final _WeekStats _self;
  final $Res Function(_WeekStats) _then;

/// Create a copy of WeekStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekStart = null,Object? activeDays = null,Object? totalMinutes = null,Object? totalCalories = null,Object? streak = null,Object? dayActivities = null,}) {
  return _then(_WeekStats(
weekStart: null == weekStart ? _self.weekStart : weekStart // ignore: cast_nullable_to_non_nullable
as DateTime,activeDays: null == activeDays ? _self.activeDays : activeDays // ignore: cast_nullable_to_non_nullable
as int,totalMinutes: null == totalMinutes ? _self.totalMinutes : totalMinutes // ignore: cast_nullable_to_non_nullable
as int,totalCalories: null == totalCalories ? _self.totalCalories : totalCalories // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,dayActivities: null == dayActivities ? _self._dayActivities : dayActivities // ignore: cast_nullable_to_non_nullable
as List<DayActivity>,
  ));
}


}

/// @nodoc
mixin _$DayActivity {

 DateTime get date; int get steps; int get activeMinutes; int get caloriesBurned; double get sleepHours; ActivityLevel get level;
/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayActivityCopyWith<DayActivity> get copyWith => _$DayActivityCopyWithImpl<DayActivity>(this as DayActivity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayActivity&&(identical(other.date, date) || other.date == date)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,date,steps,activeMinutes,caloriesBurned,sleepHours,level);

@override
String toString() {
  return 'DayActivity(date: $date, steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, level: $level)';
}


}

/// @nodoc
abstract mixin class $DayActivityCopyWith<$Res>  {
  factory $DayActivityCopyWith(DayActivity value, $Res Function(DayActivity) _then) = _$DayActivityCopyWithImpl;
@useResult
$Res call({
 DateTime date, int steps, int activeMinutes, int caloriesBurned, double sleepHours, ActivityLevel level
});




}
/// @nodoc
class _$DayActivityCopyWithImpl<$Res>
    implements $DayActivityCopyWith<$Res> {
  _$DayActivityCopyWithImpl(this._self, this._then);

  final DayActivity _self;
  final $Res Function(DayActivity) _then;

/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? level = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as ActivityLevel,
  ));
}

}


/// Adds pattern-matching-related methods to [DayActivity].
extension DayActivityPatterns on DayActivity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayActivity value)  $default,){
final _that = this;
switch (_that) {
case _DayActivity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayActivity value)?  $default,){
final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  ActivityLevel level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  ActivityLevel level)  $default,) {final _that = this;
switch (_that) {
case _DayActivity():
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.level);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  ActivityLevel level)?  $default,) {final _that = this;
switch (_that) {
case _DayActivity() when $default != null:
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.level);case _:
  return null;

}
}

}

/// @nodoc


class _DayActivity extends DayActivity {
  const _DayActivity({required this.date, required this.steps, required this.activeMinutes, required this.caloriesBurned, required this.sleepHours, required this.level}): super._();
  

@override final  DateTime date;
@override final  int steps;
@override final  int activeMinutes;
@override final  int caloriesBurned;
@override final  double sleepHours;
@override final  ActivityLevel level;

/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayActivityCopyWith<_DayActivity> get copyWith => __$DayActivityCopyWithImpl<_DayActivity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayActivity&&(identical(other.date, date) || other.date == date)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.level, level) || other.level == level));
}


@override
int get hashCode => Object.hash(runtimeType,date,steps,activeMinutes,caloriesBurned,sleepHours,level);

@override
String toString() {
  return 'DayActivity(date: $date, steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, level: $level)';
}


}

/// @nodoc
abstract mixin class _$DayActivityCopyWith<$Res> implements $DayActivityCopyWith<$Res> {
  factory _$DayActivityCopyWith(_DayActivity value, $Res Function(_DayActivity) _then) = __$DayActivityCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int steps, int activeMinutes, int caloriesBurned, double sleepHours, ActivityLevel level
});




}
/// @nodoc
class __$DayActivityCopyWithImpl<$Res>
    implements _$DayActivityCopyWith<$Res> {
  __$DayActivityCopyWithImpl(this._self, this._then);

  final _DayActivity _self;
  final $Res Function(_DayActivity) _then;

/// Create a copy of DayActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? level = null,}) {
  return _then(_DayActivity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as ActivityLevel,
  ));
}


}

/// @nodoc
mixin _$MonthHeatmap {

 DateTime get month; Map<int, ActivityLevel> get dayLevels;
/// Create a copy of MonthHeatmap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthHeatmapCopyWith<MonthHeatmap> get copyWith => _$MonthHeatmapCopyWithImpl<MonthHeatmap>(this as MonthHeatmap, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthHeatmap&&(identical(other.month, month) || other.month == month)&&const DeepCollectionEquality().equals(other.dayLevels, dayLevels));
}


@override
int get hashCode => Object.hash(runtimeType,month,const DeepCollectionEquality().hash(dayLevels));

@override
String toString() {
  return 'MonthHeatmap(month: $month, dayLevels: $dayLevels)';
}


}

/// @nodoc
abstract mixin class $MonthHeatmapCopyWith<$Res>  {
  factory $MonthHeatmapCopyWith(MonthHeatmap value, $Res Function(MonthHeatmap) _then) = _$MonthHeatmapCopyWithImpl;
@useResult
$Res call({
 DateTime month, Map<int, ActivityLevel> dayLevels
});




}
/// @nodoc
class _$MonthHeatmapCopyWithImpl<$Res>
    implements $MonthHeatmapCopyWith<$Res> {
  _$MonthHeatmapCopyWithImpl(this._self, this._then);

  final MonthHeatmap _self;
  final $Res Function(MonthHeatmap) _then;

/// Create a copy of MonthHeatmap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? dayLevels = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,dayLevels: null == dayLevels ? _self.dayLevels : dayLevels // ignore: cast_nullable_to_non_nullable
as Map<int, ActivityLevel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthHeatmap].
extension MonthHeatmapPatterns on MonthHeatmap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthHeatmap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthHeatmap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthHeatmap value)  $default,){
final _that = this;
switch (_that) {
case _MonthHeatmap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthHeatmap value)?  $default,){
final _that = this;
switch (_that) {
case _MonthHeatmap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime month,  Map<int, ActivityLevel> dayLevels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthHeatmap() when $default != null:
return $default(_that.month,_that.dayLevels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime month,  Map<int, ActivityLevel> dayLevels)  $default,) {final _that = this;
switch (_that) {
case _MonthHeatmap():
return $default(_that.month,_that.dayLevels);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime month,  Map<int, ActivityLevel> dayLevels)?  $default,) {final _that = this;
switch (_that) {
case _MonthHeatmap() when $default != null:
return $default(_that.month,_that.dayLevels);case _:
  return null;

}
}

}

/// @nodoc


class _MonthHeatmap implements MonthHeatmap {
  const _MonthHeatmap({required this.month, required final  Map<int, ActivityLevel> dayLevels}): _dayLevels = dayLevels;
  

@override final  DateTime month;
 final  Map<int, ActivityLevel> _dayLevels;
@override Map<int, ActivityLevel> get dayLevels {
  if (_dayLevels is EqualUnmodifiableMapView) return _dayLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_dayLevels);
}


/// Create a copy of MonthHeatmap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthHeatmapCopyWith<_MonthHeatmap> get copyWith => __$MonthHeatmapCopyWithImpl<_MonthHeatmap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthHeatmap&&(identical(other.month, month) || other.month == month)&&const DeepCollectionEquality().equals(other._dayLevels, _dayLevels));
}


@override
int get hashCode => Object.hash(runtimeType,month,const DeepCollectionEquality().hash(_dayLevels));

@override
String toString() {
  return 'MonthHeatmap(month: $month, dayLevels: $dayLevels)';
}


}

/// @nodoc
abstract mixin class _$MonthHeatmapCopyWith<$Res> implements $MonthHeatmapCopyWith<$Res> {
  factory _$MonthHeatmapCopyWith(_MonthHeatmap value, $Res Function(_MonthHeatmap) _then) = __$MonthHeatmapCopyWithImpl;
@override @useResult
$Res call({
 DateTime month, Map<int, ActivityLevel> dayLevels
});




}
/// @nodoc
class __$MonthHeatmapCopyWithImpl<$Res>
    implements _$MonthHeatmapCopyWith<$Res> {
  __$MonthHeatmapCopyWithImpl(this._self, this._then);

  final _MonthHeatmap _self;
  final $Res Function(_MonthHeatmap) _then;

/// Create a copy of MonthHeatmap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? dayLevels = null,}) {
  return _then(_MonthHeatmap(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,dayLevels: null == dayLevels ? _self._dayLevels : dayLevels // ignore: cast_nullable_to_non_nullable
as Map<int, ActivityLevel>,
  ));
}


}

// dart format on
