// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthSample {

 HealthMetricType get type; num get value; DateTime get startTime; DateTime get endTime; String get source;
/// Create a copy of HealthSample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthSampleCopyWith<HealthSample> get copyWith => _$HealthSampleCopyWithImpl<HealthSample>(this as HealthSample, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthSample&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,type,value,startTime,endTime,source);

@override
String toString() {
  return 'HealthSample(type: $type, value: $value, startTime: $startTime, endTime: $endTime, source: $source)';
}


}

/// @nodoc
abstract mixin class $HealthSampleCopyWith<$Res>  {
  factory $HealthSampleCopyWith(HealthSample value, $Res Function(HealthSample) _then) = _$HealthSampleCopyWithImpl;
@useResult
$Res call({
 HealthMetricType type, num value, DateTime startTime, DateTime endTime, String source
});




}
/// @nodoc
class _$HealthSampleCopyWithImpl<$Res>
    implements $HealthSampleCopyWith<$Res> {
  _$HealthSampleCopyWithImpl(this._self, this._then);

  final HealthSample _self;
  final $Res Function(HealthSample) _then;

/// Create a copy of HealthSample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? value = null,Object? startTime = null,Object? endTime = null,Object? source = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HealthMetricType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthSample].
extension HealthSamplePatterns on HealthSample {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthSample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthSample() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthSample value)  $default,){
final _that = this;
switch (_that) {
case _HealthSample():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthSample value)?  $default,){
final _that = this;
switch (_that) {
case _HealthSample() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthMetricType type,  num value,  DateTime startTime,  DateTime endTime,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthSample() when $default != null:
return $default(_that.type,_that.value,_that.startTime,_that.endTime,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthMetricType type,  num value,  DateTime startTime,  DateTime endTime,  String source)  $default,) {final _that = this;
switch (_that) {
case _HealthSample():
return $default(_that.type,_that.value,_that.startTime,_that.endTime,_that.source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthMetricType type,  num value,  DateTime startTime,  DateTime endTime,  String source)?  $default,) {final _that = this;
switch (_that) {
case _HealthSample() when $default != null:
return $default(_that.type,_that.value,_that.startTime,_that.endTime,_that.source);case _:
  return null;

}
}

}

/// @nodoc


class _HealthSample extends HealthSample {
  const _HealthSample({required this.type, required this.value, required this.startTime, required this.endTime, required this.source}): super._();
  

@override final  HealthMetricType type;
@override final  num value;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override final  String source;

/// Create a copy of HealthSample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthSampleCopyWith<_HealthSample> get copyWith => __$HealthSampleCopyWithImpl<_HealthSample>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthSample&&(identical(other.type, type) || other.type == type)&&(identical(other.value, value) || other.value == value)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.source, source) || other.source == source));
}


@override
int get hashCode => Object.hash(runtimeType,type,value,startTime,endTime,source);

@override
String toString() {
  return 'HealthSample(type: $type, value: $value, startTime: $startTime, endTime: $endTime, source: $source)';
}


}

/// @nodoc
abstract mixin class _$HealthSampleCopyWith<$Res> implements $HealthSampleCopyWith<$Res> {
  factory _$HealthSampleCopyWith(_HealthSample value, $Res Function(_HealthSample) _then) = __$HealthSampleCopyWithImpl;
@override @useResult
$Res call({
 HealthMetricType type, num value, DateTime startTime, DateTime endTime, String source
});




}
/// @nodoc
class __$HealthSampleCopyWithImpl<$Res>
    implements _$HealthSampleCopyWith<$Res> {
  __$HealthSampleCopyWithImpl(this._self, this._then);

  final _HealthSample _self;
  final $Res Function(_HealthSample) _then;

/// Create a copy of HealthSample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? value = null,Object? startTime = null,Object? endTime = null,Object? source = null,}) {
  return _then(_HealthSample(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HealthMetricType,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$HealthSyncResult {

 Map<HealthMetricType, int> get processedCounts; DateTime get syncTime; String? get error;
/// Create a copy of HealthSyncResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthSyncResultCopyWith<HealthSyncResult> get copyWith => _$HealthSyncResultCopyWithImpl<HealthSyncResult>(this as HealthSyncResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthSyncResult&&const DeepCollectionEquality().equals(other.processedCounts, processedCounts)&&(identical(other.syncTime, syncTime) || other.syncTime == syncTime)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(processedCounts),syncTime,error);

@override
String toString() {
  return 'HealthSyncResult(processedCounts: $processedCounts, syncTime: $syncTime, error: $error)';
}


}

/// @nodoc
abstract mixin class $HealthSyncResultCopyWith<$Res>  {
  factory $HealthSyncResultCopyWith(HealthSyncResult value, $Res Function(HealthSyncResult) _then) = _$HealthSyncResultCopyWithImpl;
@useResult
$Res call({
 Map<HealthMetricType, int> processedCounts, DateTime syncTime, String? error
});




}
/// @nodoc
class _$HealthSyncResultCopyWithImpl<$Res>
    implements $HealthSyncResultCopyWith<$Res> {
  _$HealthSyncResultCopyWithImpl(this._self, this._then);

  final HealthSyncResult _self;
  final $Res Function(HealthSyncResult) _then;

/// Create a copy of HealthSyncResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? processedCounts = null,Object? syncTime = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
processedCounts: null == processedCounts ? _self.processedCounts : processedCounts // ignore: cast_nullable_to_non_nullable
as Map<HealthMetricType, int>,syncTime: null == syncTime ? _self.syncTime : syncTime // ignore: cast_nullable_to_non_nullable
as DateTime,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthSyncResult].
extension HealthSyncResultPatterns on HealthSyncResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthSyncResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthSyncResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthSyncResult value)  $default,){
final _that = this;
switch (_that) {
case _HealthSyncResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthSyncResult value)?  $default,){
final _that = this;
switch (_that) {
case _HealthSyncResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<HealthMetricType, int> processedCounts,  DateTime syncTime,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthSyncResult() when $default != null:
return $default(_that.processedCounts,_that.syncTime,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<HealthMetricType, int> processedCounts,  DateTime syncTime,  String? error)  $default,) {final _that = this;
switch (_that) {
case _HealthSyncResult():
return $default(_that.processedCounts,_that.syncTime,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<HealthMetricType, int> processedCounts,  DateTime syncTime,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _HealthSyncResult() when $default != null:
return $default(_that.processedCounts,_that.syncTime,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _HealthSyncResult extends HealthSyncResult {
  const _HealthSyncResult({required final  Map<HealthMetricType, int> processedCounts, required this.syncTime, this.error}): _processedCounts = processedCounts,super._();
  

 final  Map<HealthMetricType, int> _processedCounts;
@override Map<HealthMetricType, int> get processedCounts {
  if (_processedCounts is EqualUnmodifiableMapView) return _processedCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_processedCounts);
}

@override final  DateTime syncTime;
@override final  String? error;

/// Create a copy of HealthSyncResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthSyncResultCopyWith<_HealthSyncResult> get copyWith => __$HealthSyncResultCopyWithImpl<_HealthSyncResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthSyncResult&&const DeepCollectionEquality().equals(other._processedCounts, _processedCounts)&&(identical(other.syncTime, syncTime) || other.syncTime == syncTime)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_processedCounts),syncTime,error);

@override
String toString() {
  return 'HealthSyncResult(processedCounts: $processedCounts, syncTime: $syncTime, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HealthSyncResultCopyWith<$Res> implements $HealthSyncResultCopyWith<$Res> {
  factory _$HealthSyncResultCopyWith(_HealthSyncResult value, $Res Function(_HealthSyncResult) _then) = __$HealthSyncResultCopyWithImpl;
@override @useResult
$Res call({
 Map<HealthMetricType, int> processedCounts, DateTime syncTime, String? error
});




}
/// @nodoc
class __$HealthSyncResultCopyWithImpl<$Res>
    implements _$HealthSyncResultCopyWith<$Res> {
  __$HealthSyncResultCopyWithImpl(this._self, this._then);

  final _HealthSyncResult _self;
  final $Res Function(_HealthSyncResult) _then;

/// Create a copy of HealthSyncResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? processedCounts = null,Object? syncTime = null,Object? error = freezed,}) {
  return _then(_HealthSyncResult(
processedCounts: null == processedCounts ? _self._processedCounts : processedCounts // ignore: cast_nullable_to_non_nullable
as Map<HealthMetricType, int>,syncTime: null == syncTime ? _self.syncTime : syncTime // ignore: cast_nullable_to_non_nullable
as DateTime,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DailyHealthData {

 DateTime get date; int get steps; int get activeMinutes; int get caloriesBurned; double get sleepHours; int? get avgHeartRate; int? get hrv;
/// Create a copy of DailyHealthData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyHealthDataCopyWith<DailyHealthData> get copyWith => _$DailyHealthDataCopyWithImpl<DailyHealthData>(this as DailyHealthData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyHealthData&&(identical(other.date, date) || other.date == date)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.avgHeartRate, avgHeartRate) || other.avgHeartRate == avgHeartRate)&&(identical(other.hrv, hrv) || other.hrv == hrv));
}


@override
int get hashCode => Object.hash(runtimeType,date,steps,activeMinutes,caloriesBurned,sleepHours,avgHeartRate,hrv);

@override
String toString() {
  return 'DailyHealthData(date: $date, steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, avgHeartRate: $avgHeartRate, hrv: $hrv)';
}


}

/// @nodoc
abstract mixin class $DailyHealthDataCopyWith<$Res>  {
  factory $DailyHealthDataCopyWith(DailyHealthData value, $Res Function(DailyHealthData) _then) = _$DailyHealthDataCopyWithImpl;
@useResult
$Res call({
 DateTime date, int steps, int activeMinutes, int caloriesBurned, double sleepHours, int? avgHeartRate, int? hrv
});




}
/// @nodoc
class _$DailyHealthDataCopyWithImpl<$Res>
    implements $DailyHealthDataCopyWith<$Res> {
  _$DailyHealthDataCopyWithImpl(this._self, this._then);

  final DailyHealthData _self;
  final $Res Function(DailyHealthData) _then;

/// Create a copy of DailyHealthData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? avgHeartRate = freezed,Object? hrv = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,avgHeartRate: freezed == avgHeartRate ? _self.avgHeartRate : avgHeartRate // ignore: cast_nullable_to_non_nullable
as int?,hrv: freezed == hrv ? _self.hrv : hrv // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyHealthData].
extension DailyHealthDataPatterns on DailyHealthData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyHealthData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyHealthData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyHealthData value)  $default,){
final _that = this;
switch (_that) {
case _DailyHealthData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyHealthData value)?  $default,){
final _that = this;
switch (_that) {
case _DailyHealthData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int? avgHeartRate,  int? hrv)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyHealthData() when $default != null:
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.avgHeartRate,_that.hrv);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int? avgHeartRate,  int? hrv)  $default,) {final _that = this;
switch (_that) {
case _DailyHealthData():
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.avgHeartRate,_that.hrv);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int steps,  int activeMinutes,  int caloriesBurned,  double sleepHours,  int? avgHeartRate,  int? hrv)?  $default,) {final _that = this;
switch (_that) {
case _DailyHealthData() when $default != null:
return $default(_that.date,_that.steps,_that.activeMinutes,_that.caloriesBurned,_that.sleepHours,_that.avgHeartRate,_that.hrv);case _:
  return null;

}
}

}

/// @nodoc


class _DailyHealthData implements DailyHealthData {
  const _DailyHealthData({required this.date, this.steps = 0, this.activeMinutes = 0, this.caloriesBurned = 0, this.sleepHours = 0.0, this.avgHeartRate, this.hrv});
  

@override final  DateTime date;
@override@JsonKey() final  int steps;
@override@JsonKey() final  int activeMinutes;
@override@JsonKey() final  int caloriesBurned;
@override@JsonKey() final  double sleepHours;
@override final  int? avgHeartRate;
@override final  int? hrv;

/// Create a copy of DailyHealthData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyHealthDataCopyWith<_DailyHealthData> get copyWith => __$DailyHealthDataCopyWithImpl<_DailyHealthData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyHealthData&&(identical(other.date, date) || other.date == date)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.activeMinutes, activeMinutes) || other.activeMinutes == activeMinutes)&&(identical(other.caloriesBurned, caloriesBurned) || other.caloriesBurned == caloriesBurned)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.avgHeartRate, avgHeartRate) || other.avgHeartRate == avgHeartRate)&&(identical(other.hrv, hrv) || other.hrv == hrv));
}


@override
int get hashCode => Object.hash(runtimeType,date,steps,activeMinutes,caloriesBurned,sleepHours,avgHeartRate,hrv);

@override
String toString() {
  return 'DailyHealthData(date: $date, steps: $steps, activeMinutes: $activeMinutes, caloriesBurned: $caloriesBurned, sleepHours: $sleepHours, avgHeartRate: $avgHeartRate, hrv: $hrv)';
}


}

/// @nodoc
abstract mixin class _$DailyHealthDataCopyWith<$Res> implements $DailyHealthDataCopyWith<$Res> {
  factory _$DailyHealthDataCopyWith(_DailyHealthData value, $Res Function(_DailyHealthData) _then) = __$DailyHealthDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int steps, int activeMinutes, int caloriesBurned, double sleepHours, int? avgHeartRate, int? hrv
});




}
/// @nodoc
class __$DailyHealthDataCopyWithImpl<$Res>
    implements _$DailyHealthDataCopyWith<$Res> {
  __$DailyHealthDataCopyWithImpl(this._self, this._then);

  final _DailyHealthData _self;
  final $Res Function(_DailyHealthData) _then;

/// Create a copy of DailyHealthData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? steps = null,Object? activeMinutes = null,Object? caloriesBurned = null,Object? sleepHours = null,Object? avgHeartRate = freezed,Object? hrv = freezed,}) {
  return _then(_DailyHealthData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,activeMinutes: null == activeMinutes ? _self.activeMinutes : activeMinutes // ignore: cast_nullable_to_non_nullable
as int,caloriesBurned: null == caloriesBurned ? _self.caloriesBurned : caloriesBurned // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,avgHeartRate: freezed == avgHeartRate ? _self.avgHeartRate : avgHeartRate // ignore: cast_nullable_to_non_nullable
as int?,hrv: freezed == hrv ? _self.hrv : hrv // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
