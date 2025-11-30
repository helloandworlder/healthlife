// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_with_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalWithProgress {

 Goal get goal; int get progress; bool get isCompleted;
/// Create a copy of GoalWithProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalWithProgressCopyWith<GoalWithProgress> get copyWith => _$GoalWithProgressCopyWithImpl<GoalWithProgress>(this as GoalWithProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalWithProgress&&const DeepCollectionEquality().equals(other.goal, goal)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(goal),progress,isCompleted);

@override
String toString() {
  return 'GoalWithProgress(goal: $goal, progress: $progress, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $GoalWithProgressCopyWith<$Res>  {
  factory $GoalWithProgressCopyWith(GoalWithProgress value, $Res Function(GoalWithProgress) _then) = _$GoalWithProgressCopyWithImpl;
@useResult
$Res call({
 Goal goal, int progress, bool isCompleted
});




}
/// @nodoc
class _$GoalWithProgressCopyWithImpl<$Res>
    implements $GoalWithProgressCopyWith<$Res> {
  _$GoalWithProgressCopyWithImpl(this._self, this._then);

  final GoalWithProgress _self;
  final $Res Function(GoalWithProgress) _then;

/// Create a copy of GoalWithProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goal = freezed,Object? progress = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalWithProgress].
extension GoalWithProgressPatterns on GoalWithProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalWithProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalWithProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalWithProgress value)  $default,){
final _that = this;
switch (_that) {
case _GoalWithProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalWithProgress value)?  $default,){
final _that = this;
switch (_that) {
case _GoalWithProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Goal goal,  int progress,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalWithProgress() when $default != null:
return $default(_that.goal,_that.progress,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Goal goal,  int progress,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _GoalWithProgress():
return $default(_that.goal,_that.progress,_that.isCompleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Goal goal,  int progress,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _GoalWithProgress() when $default != null:
return $default(_that.goal,_that.progress,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _GoalWithProgress extends GoalWithProgress {
  const _GoalWithProgress({required this.goal, required this.progress, required this.isCompleted}): super._();
  

@override final  Goal goal;
@override final  int progress;
@override final  bool isCompleted;

/// Create a copy of GoalWithProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalWithProgressCopyWith<_GoalWithProgress> get copyWith => __$GoalWithProgressCopyWithImpl<_GoalWithProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalWithProgress&&const DeepCollectionEquality().equals(other.goal, goal)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(goal),progress,isCompleted);

@override
String toString() {
  return 'GoalWithProgress(goal: $goal, progress: $progress, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$GoalWithProgressCopyWith<$Res> implements $GoalWithProgressCopyWith<$Res> {
  factory _$GoalWithProgressCopyWith(_GoalWithProgress value, $Res Function(_GoalWithProgress) _then) = __$GoalWithProgressCopyWithImpl;
@override @useResult
$Res call({
 Goal goal, int progress, bool isCompleted
});




}
/// @nodoc
class __$GoalWithProgressCopyWithImpl<$Res>
    implements _$GoalWithProgressCopyWith<$Res> {
  __$GoalWithProgressCopyWithImpl(this._self, this._then);

  final _GoalWithProgress _self;
  final $Res Function(_GoalWithProgress) _then;

/// Create a copy of GoalWithProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goal = freezed,Object? progress = null,Object? isCompleted = null,}) {
  return _then(_GoalWithProgress(
goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as Goal,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$GoalsState {

 List<GoalWithProgress> get goals; bool get isLoading; String? get error;
/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalsStateCopyWith<GoalsState> get copyWith => _$GoalsStateCopyWithImpl<GoalsState>(this as GoalsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalsState&&const DeepCollectionEquality().equals(other.goals, goals)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(goals),isLoading,error);

@override
String toString() {
  return 'GoalsState(goals: $goals, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $GoalsStateCopyWith<$Res>  {
  factory $GoalsStateCopyWith(GoalsState value, $Res Function(GoalsState) _then) = _$GoalsStateCopyWithImpl;
@useResult
$Res call({
 List<GoalWithProgress> goals, bool isLoading, String? error
});




}
/// @nodoc
class _$GoalsStateCopyWithImpl<$Res>
    implements $GoalsStateCopyWith<$Res> {
  _$GoalsStateCopyWithImpl(this._self, this._then);

  final GoalsState _self;
  final $Res Function(GoalsState) _then;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goals = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalWithProgress>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalsState].
extension GoalsStatePatterns on GoalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalsState value)  $default,){
final _that = this;
switch (_that) {
case _GoalsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalsState value)?  $default,){
final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GoalWithProgress> goals,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
return $default(_that.goals,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GoalWithProgress> goals,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _GoalsState():
return $default(_that.goals,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GoalWithProgress> goals,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _GoalsState() when $default != null:
return $default(_that.goals,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GoalsState extends GoalsState {
  const _GoalsState({final  List<GoalWithProgress> goals = const [], this.isLoading = false, this.error}): _goals = goals,super._();
  

 final  List<GoalWithProgress> _goals;
@override@JsonKey() List<GoalWithProgress> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalsStateCopyWith<_GoalsState> get copyWith => __$GoalsStateCopyWithImpl<_GoalsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalsState&&const DeepCollectionEquality().equals(other._goals, _goals)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_goals),isLoading,error);

@override
String toString() {
  return 'GoalsState(goals: $goals, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$GoalsStateCopyWith<$Res> implements $GoalsStateCopyWith<$Res> {
  factory _$GoalsStateCopyWith(_GoalsState value, $Res Function(_GoalsState) _then) = __$GoalsStateCopyWithImpl;
@override @useResult
$Res call({
 List<GoalWithProgress> goals, bool isLoading, String? error
});




}
/// @nodoc
class __$GoalsStateCopyWithImpl<$Res>
    implements _$GoalsStateCopyWith<$Res> {
  __$GoalsStateCopyWithImpl(this._self, this._then);

  final _GoalsState _self;
  final $Res Function(_GoalsState) _then;

/// Create a copy of GoalsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goals = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_GoalsState(
goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalWithProgress>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
