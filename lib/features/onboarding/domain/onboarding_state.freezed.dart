// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

 OnboardingStep get currentStep; bool get isSubmitting; String? get errorMessage;// Profile data
 Gender? get gender; double? get height; double? get weight; DateTime? get birthday; UserActivityLevel get activityLevel;// Health source
 bool get healthSourceConnected; String? get healthSourceType;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.activityLevel, activityLevel) || other.activityLevel == activityLevel)&&(identical(other.healthSourceConnected, healthSourceConnected) || other.healthSourceConnected == healthSourceConnected)&&(identical(other.healthSourceType, healthSourceType) || other.healthSourceType == healthSourceType));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,isSubmitting,errorMessage,gender,height,weight,birthday,activityLevel,healthSourceConnected,healthSourceType);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, isSubmitting: $isSubmitting, errorMessage: $errorMessage, gender: $gender, height: $height, weight: $weight, birthday: $birthday, activityLevel: $activityLevel, healthSourceConnected: $healthSourceConnected, healthSourceType: $healthSourceType)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 OnboardingStep currentStep, bool isSubmitting, String? errorMessage, Gender? gender, double? height, double? weight, DateTime? birthday, UserActivityLevel activityLevel, bool healthSourceConnected, String? healthSourceType
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? gender = freezed,Object? height = freezed,Object? weight = freezed,Object? birthday = freezed,Object? activityLevel = null,Object? healthSourceConnected = null,Object? healthSourceType = freezed,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as OnboardingStep,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,activityLevel: null == activityLevel ? _self.activityLevel : activityLevel // ignore: cast_nullable_to_non_nullable
as UserActivityLevel,healthSourceConnected: null == healthSourceConnected ? _self.healthSourceConnected : healthSourceConnected // ignore: cast_nullable_to_non_nullable
as bool,healthSourceType: freezed == healthSourceType ? _self.healthSourceType : healthSourceType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OnboardingStep currentStep,  bool isSubmitting,  String? errorMessage,  Gender? gender,  double? height,  double? weight,  DateTime? birthday,  UserActivityLevel activityLevel,  bool healthSourceConnected,  String? healthSourceType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.isSubmitting,_that.errorMessage,_that.gender,_that.height,_that.weight,_that.birthday,_that.activityLevel,_that.healthSourceConnected,_that.healthSourceType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OnboardingStep currentStep,  bool isSubmitting,  String? errorMessage,  Gender? gender,  double? height,  double? weight,  DateTime? birthday,  UserActivityLevel activityLevel,  bool healthSourceConnected,  String? healthSourceType)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.currentStep,_that.isSubmitting,_that.errorMessage,_that.gender,_that.height,_that.weight,_that.birthday,_that.activityLevel,_that.healthSourceConnected,_that.healthSourceType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OnboardingStep currentStep,  bool isSubmitting,  String? errorMessage,  Gender? gender,  double? height,  double? weight,  DateTime? birthday,  UserActivityLevel activityLevel,  bool healthSourceConnected,  String? healthSourceType)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.isSubmitting,_that.errorMessage,_that.gender,_that.height,_that.weight,_that.birthday,_that.activityLevel,_that.healthSourceConnected,_that.healthSourceType);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState extends OnboardingState {
  const _OnboardingState({this.currentStep = OnboardingStep.welcome, this.isSubmitting = false, this.errorMessage, this.gender, this.height, this.weight, this.birthday, this.activityLevel = UserActivityLevel.sedentary, this.healthSourceConnected = false, this.healthSourceType}): super._();
  

@override@JsonKey() final  OnboardingStep currentStep;
@override@JsonKey() final  bool isSubmitting;
@override final  String? errorMessage;
// Profile data
@override final  Gender? gender;
@override final  double? height;
@override final  double? weight;
@override final  DateTime? birthday;
@override@JsonKey() final  UserActivityLevel activityLevel;
// Health source
@override@JsonKey() final  bool healthSourceConnected;
@override final  String? healthSourceType;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.height, height) || other.height == height)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.activityLevel, activityLevel) || other.activityLevel == activityLevel)&&(identical(other.healthSourceConnected, healthSourceConnected) || other.healthSourceConnected == healthSourceConnected)&&(identical(other.healthSourceType, healthSourceType) || other.healthSourceType == healthSourceType));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,isSubmitting,errorMessage,gender,height,weight,birthday,activityLevel,healthSourceConnected,healthSourceType);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, isSubmitting: $isSubmitting, errorMessage: $errorMessage, gender: $gender, height: $height, weight: $weight, birthday: $birthday, activityLevel: $activityLevel, healthSourceConnected: $healthSourceConnected, healthSourceType: $healthSourceType)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 OnboardingStep currentStep, bool isSubmitting, String? errorMessage, Gender? gender, double? height, double? weight, DateTime? birthday, UserActivityLevel activityLevel, bool healthSourceConnected, String? healthSourceType
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? isSubmitting = null,Object? errorMessage = freezed,Object? gender = freezed,Object? height = freezed,Object? weight = freezed,Object? birthday = freezed,Object? activityLevel = null,Object? healthSourceConnected = null,Object? healthSourceType = freezed,}) {
  return _then(_OnboardingState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as OnboardingStep,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,activityLevel: null == activityLevel ? _self.activityLevel : activityLevel // ignore: cast_nullable_to_non_nullable
as UserActivityLevel,healthSourceConnected: null == healthSourceConnected ? _self.healthSourceConnected : healthSourceConnected // ignore: cast_nullable_to_non_nullable
as bool,healthSourceType: freezed == healthSourceType ? _self.healthSourceType : healthSourceType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
