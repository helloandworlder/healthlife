// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatMessage {

 String get id; MessageRole get role; String get content; DateTime get timestamp; bool get isLoading; String? get error;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,role,content,timestamp,isLoading,error);

@override
String toString() {
  return 'ChatMessage(id: $id, role: $role, content: $content, timestamp: $timestamp, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, MessageRole role, String content, DateTime timestamp, bool isLoading, String? error
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? timestamp = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MessageRole role,  String content,  DateTime timestamp,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.timestamp,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MessageRole role,  String content,  DateTime timestamp,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.role,_that.content,_that.timestamp,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MessageRole role,  String content,  DateTime timestamp,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.timestamp,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ChatMessage extends ChatMessage {
  const _ChatMessage({required this.id, required this.role, required this.content, required this.timestamp, this.isLoading = false, this.error}): super._();
  

@override final  String id;
@override final  MessageRole role;
@override final  String content;
@override final  DateTime timestamp;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,id,role,content,timestamp,isLoading,error);

@override
String toString() {
  return 'ChatMessage(id: $id, role: $role, content: $content, timestamp: $timestamp, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, MessageRole role, String content, DateTime timestamp, bool isLoading, String? error
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? timestamp = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$HealthContext {

 int get todaySteps; int get todayCaloriesBurned; int get todayCaloriesIntake; double get sleepHours; List<GoalProgress> get goals; double? get currentWeight; double? get targetWeight;
/// Create a copy of HealthContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthContextCopyWith<HealthContext> get copyWith => _$HealthContextCopyWithImpl<HealthContext>(this as HealthContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthContext&&(identical(other.todaySteps, todaySteps) || other.todaySteps == todaySteps)&&(identical(other.todayCaloriesBurned, todayCaloriesBurned) || other.todayCaloriesBurned == todayCaloriesBurned)&&(identical(other.todayCaloriesIntake, todayCaloriesIntake) || other.todayCaloriesIntake == todayCaloriesIntake)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&const DeepCollectionEquality().equals(other.goals, goals)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.targetWeight, targetWeight) || other.targetWeight == targetWeight));
}


@override
int get hashCode => Object.hash(runtimeType,todaySteps,todayCaloriesBurned,todayCaloriesIntake,sleepHours,const DeepCollectionEquality().hash(goals),currentWeight,targetWeight);

@override
String toString() {
  return 'HealthContext(todaySteps: $todaySteps, todayCaloriesBurned: $todayCaloriesBurned, todayCaloriesIntake: $todayCaloriesIntake, sleepHours: $sleepHours, goals: $goals, currentWeight: $currentWeight, targetWeight: $targetWeight)';
}


}

/// @nodoc
abstract mixin class $HealthContextCopyWith<$Res>  {
  factory $HealthContextCopyWith(HealthContext value, $Res Function(HealthContext) _then) = _$HealthContextCopyWithImpl;
@useResult
$Res call({
 int todaySteps, int todayCaloriesBurned, int todayCaloriesIntake, double sleepHours, List<GoalProgress> goals, double? currentWeight, double? targetWeight
});




}
/// @nodoc
class _$HealthContextCopyWithImpl<$Res>
    implements $HealthContextCopyWith<$Res> {
  _$HealthContextCopyWithImpl(this._self, this._then);

  final HealthContext _self;
  final $Res Function(HealthContext) _then;

/// Create a copy of HealthContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todaySteps = null,Object? todayCaloriesBurned = null,Object? todayCaloriesIntake = null,Object? sleepHours = null,Object? goals = null,Object? currentWeight = freezed,Object? targetWeight = freezed,}) {
  return _then(_self.copyWith(
todaySteps: null == todaySteps ? _self.todaySteps : todaySteps // ignore: cast_nullable_to_non_nullable
as int,todayCaloriesBurned: null == todayCaloriesBurned ? _self.todayCaloriesBurned : todayCaloriesBurned // ignore: cast_nullable_to_non_nullable
as int,todayCaloriesIntake: null == todayCaloriesIntake ? _self.todayCaloriesIntake : todayCaloriesIntake // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalProgress>,currentWeight: freezed == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double?,targetWeight: freezed == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthContext].
extension HealthContextPatterns on HealthContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthContext value)  $default,){
final _that = this;
switch (_that) {
case _HealthContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthContext value)?  $default,){
final _that = this;
switch (_that) {
case _HealthContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int todaySteps,  int todayCaloriesBurned,  int todayCaloriesIntake,  double sleepHours,  List<GoalProgress> goals,  double? currentWeight,  double? targetWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthContext() when $default != null:
return $default(_that.todaySteps,_that.todayCaloriesBurned,_that.todayCaloriesIntake,_that.sleepHours,_that.goals,_that.currentWeight,_that.targetWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int todaySteps,  int todayCaloriesBurned,  int todayCaloriesIntake,  double sleepHours,  List<GoalProgress> goals,  double? currentWeight,  double? targetWeight)  $default,) {final _that = this;
switch (_that) {
case _HealthContext():
return $default(_that.todaySteps,_that.todayCaloriesBurned,_that.todayCaloriesIntake,_that.sleepHours,_that.goals,_that.currentWeight,_that.targetWeight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int todaySteps,  int todayCaloriesBurned,  int todayCaloriesIntake,  double sleepHours,  List<GoalProgress> goals,  double? currentWeight,  double? targetWeight)?  $default,) {final _that = this;
switch (_that) {
case _HealthContext() when $default != null:
return $default(_that.todaySteps,_that.todayCaloriesBurned,_that.todayCaloriesIntake,_that.sleepHours,_that.goals,_that.currentWeight,_that.targetWeight);case _:
  return null;

}
}

}

/// @nodoc


class _HealthContext extends HealthContext {
  const _HealthContext({required this.todaySteps, required this.todayCaloriesBurned, required this.todayCaloriesIntake, required this.sleepHours, required final  List<GoalProgress> goals, this.currentWeight, this.targetWeight}): _goals = goals,super._();
  

@override final  int todaySteps;
@override final  int todayCaloriesBurned;
@override final  int todayCaloriesIntake;
@override final  double sleepHours;
 final  List<GoalProgress> _goals;
@override List<GoalProgress> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

@override final  double? currentWeight;
@override final  double? targetWeight;

/// Create a copy of HealthContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthContextCopyWith<_HealthContext> get copyWith => __$HealthContextCopyWithImpl<_HealthContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthContext&&(identical(other.todaySteps, todaySteps) || other.todaySteps == todaySteps)&&(identical(other.todayCaloriesBurned, todayCaloriesBurned) || other.todayCaloriesBurned == todayCaloriesBurned)&&(identical(other.todayCaloriesIntake, todayCaloriesIntake) || other.todayCaloriesIntake == todayCaloriesIntake)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&const DeepCollectionEquality().equals(other._goals, _goals)&&(identical(other.currentWeight, currentWeight) || other.currentWeight == currentWeight)&&(identical(other.targetWeight, targetWeight) || other.targetWeight == targetWeight));
}


@override
int get hashCode => Object.hash(runtimeType,todaySteps,todayCaloriesBurned,todayCaloriesIntake,sleepHours,const DeepCollectionEquality().hash(_goals),currentWeight,targetWeight);

@override
String toString() {
  return 'HealthContext(todaySteps: $todaySteps, todayCaloriesBurned: $todayCaloriesBurned, todayCaloriesIntake: $todayCaloriesIntake, sleepHours: $sleepHours, goals: $goals, currentWeight: $currentWeight, targetWeight: $targetWeight)';
}


}

/// @nodoc
abstract mixin class _$HealthContextCopyWith<$Res> implements $HealthContextCopyWith<$Res> {
  factory _$HealthContextCopyWith(_HealthContext value, $Res Function(_HealthContext) _then) = __$HealthContextCopyWithImpl;
@override @useResult
$Res call({
 int todaySteps, int todayCaloriesBurned, int todayCaloriesIntake, double sleepHours, List<GoalProgress> goals, double? currentWeight, double? targetWeight
});




}
/// @nodoc
class __$HealthContextCopyWithImpl<$Res>
    implements _$HealthContextCopyWith<$Res> {
  __$HealthContextCopyWithImpl(this._self, this._then);

  final _HealthContext _self;
  final $Res Function(_HealthContext) _then;

/// Create a copy of HealthContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todaySteps = null,Object? todayCaloriesBurned = null,Object? todayCaloriesIntake = null,Object? sleepHours = null,Object? goals = null,Object? currentWeight = freezed,Object? targetWeight = freezed,}) {
  return _then(_HealthContext(
todaySteps: null == todaySteps ? _self.todaySteps : todaySteps // ignore: cast_nullable_to_non_nullable
as int,todayCaloriesBurned: null == todayCaloriesBurned ? _self.todayCaloriesBurned : todayCaloriesBurned // ignore: cast_nullable_to_non_nullable
as int,todayCaloriesIntake: null == todayCaloriesIntake ? _self.todayCaloriesIntake : todayCaloriesIntake // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalProgress>,currentWeight: freezed == currentWeight ? _self.currentWeight : currentWeight // ignore: cast_nullable_to_non_nullable
as double?,targetWeight: freezed == targetWeight ? _self.targetWeight : targetWeight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$GoalProgress {

 String get name; int get progress; int get target; bool get isCompleted;
/// Create a copy of GoalProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalProgressCopyWith<GoalProgress> get copyWith => _$GoalProgressCopyWithImpl<GoalProgress>(this as GoalProgress, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalProgress&&(identical(other.name, name) || other.name == name)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.target, target) || other.target == target)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,name,progress,target,isCompleted);

@override
String toString() {
  return 'GoalProgress(name: $name, progress: $progress, target: $target, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $GoalProgressCopyWith<$Res>  {
  factory $GoalProgressCopyWith(GoalProgress value, $Res Function(GoalProgress) _then) = _$GoalProgressCopyWithImpl;
@useResult
$Res call({
 String name, int progress, int target, bool isCompleted
});




}
/// @nodoc
class _$GoalProgressCopyWithImpl<$Res>
    implements $GoalProgressCopyWith<$Res> {
  _$GoalProgressCopyWithImpl(this._self, this._then);

  final GoalProgress _self;
  final $Res Function(GoalProgress) _then;

/// Create a copy of GoalProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? progress = null,Object? target = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalProgress].
extension GoalProgressPatterns on GoalProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalProgress value)  $default,){
final _that = this;
switch (_that) {
case _GoalProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalProgress value)?  $default,){
final _that = this;
switch (_that) {
case _GoalProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int progress,  int target,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalProgress() when $default != null:
return $default(_that.name,_that.progress,_that.target,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int progress,  int target,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _GoalProgress():
return $default(_that.name,_that.progress,_that.target,_that.isCompleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int progress,  int target,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _GoalProgress() when $default != null:
return $default(_that.name,_that.progress,_that.target,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _GoalProgress implements GoalProgress {
  const _GoalProgress({required this.name, required this.progress, required this.target, required this.isCompleted});
  

@override final  String name;
@override final  int progress;
@override final  int target;
@override final  bool isCompleted;

/// Create a copy of GoalProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalProgressCopyWith<_GoalProgress> get copyWith => __$GoalProgressCopyWithImpl<_GoalProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalProgress&&(identical(other.name, name) || other.name == name)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.target, target) || other.target == target)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,name,progress,target,isCompleted);

@override
String toString() {
  return 'GoalProgress(name: $name, progress: $progress, target: $target, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$GoalProgressCopyWith<$Res> implements $GoalProgressCopyWith<$Res> {
  factory _$GoalProgressCopyWith(_GoalProgress value, $Res Function(_GoalProgress) _then) = __$GoalProgressCopyWithImpl;
@override @useResult
$Res call({
 String name, int progress, int target, bool isCompleted
});




}
/// @nodoc
class __$GoalProgressCopyWithImpl<$Res>
    implements _$GoalProgressCopyWith<$Res> {
  __$GoalProgressCopyWithImpl(this._self, this._then);

  final _GoalProgress _self;
  final $Res Function(_GoalProgress) _then;

/// Create a copy of GoalProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? progress = null,Object? target = null,Object? isCompleted = null,}) {
  return _then(_GoalProgress(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ChatState {

 List<ChatMessage> get messages; bool get isLoading; String? get error; HealthContext? get healthContext;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.healthContext, healthContext) || other.healthContext == healthContext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isLoading,error,healthContext);

@override
String toString() {
  return 'ChatState(messages: $messages, isLoading: $isLoading, error: $error, healthContext: $healthContext)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 List<ChatMessage> messages, bool isLoading, String? error, HealthContext? healthContext
});


$HealthContextCopyWith<$Res>? get healthContext;

}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? isLoading = null,Object? error = freezed,Object? healthContext = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,healthContext: freezed == healthContext ? _self.healthContext : healthContext // ignore: cast_nullable_to_non_nullable
as HealthContext?,
  ));
}
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthContextCopyWith<$Res>? get healthContext {
    if (_self.healthContext == null) {
    return null;
  }

  return $HealthContextCopyWith<$Res>(_self.healthContext!, (value) {
    return _then(_self.copyWith(healthContext: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessage> messages,  bool isLoading,  String? error,  HealthContext? healthContext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.isLoading,_that.error,_that.healthContext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessage> messages,  bool isLoading,  String? error,  HealthContext? healthContext)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.messages,_that.isLoading,_that.error,_that.healthContext);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessage> messages,  bool isLoading,  String? error,  HealthContext? healthContext)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.isLoading,_that.error,_that.healthContext);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState extends ChatState {
  const _ChatState({final  List<ChatMessage> messages = const [], this.isLoading = false, this.error, this.healthContext}): _messages = messages,super._();
  

 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  HealthContext? healthContext;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.healthContext, healthContext) || other.healthContext == healthContext));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),isLoading,error,healthContext);

@override
String toString() {
  return 'ChatState(messages: $messages, isLoading: $isLoading, error: $error, healthContext: $healthContext)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessage> messages, bool isLoading, String? error, HealthContext? healthContext
});


@override $HealthContextCopyWith<$Res>? get healthContext;

}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isLoading = null,Object? error = freezed,Object? healthContext = freezed,}) {
  return _then(_ChatState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,healthContext: freezed == healthContext ? _self.healthContext : healthContext // ignore: cast_nullable_to_non_nullable
as HealthContext?,
  ));
}

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthContextCopyWith<$Res>? get healthContext {
    if (_self.healthContext == null) {
    return null;
  }

  return $HealthContextCopyWith<$Res>(_self.healthContext!, (value) {
    return _then(_self.copyWith(healthContext: value));
  });
}
}

// dart format on
