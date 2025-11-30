// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodTemplate {

 String get name; int get calories; String? get emoji;
/// Create a copy of FoodTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodTemplateCopyWith<FoodTemplate> get copyWith => _$FoodTemplateCopyWithImpl<FoodTemplate>(this as FoodTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}


@override
int get hashCode => Object.hash(runtimeType,name,calories,emoji);

@override
String toString() {
  return 'FoodTemplate(name: $name, calories: $calories, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class $FoodTemplateCopyWith<$Res>  {
  factory $FoodTemplateCopyWith(FoodTemplate value, $Res Function(FoodTemplate) _then) = _$FoodTemplateCopyWithImpl;
@useResult
$Res call({
 String name, int calories, String? emoji
});




}
/// @nodoc
class _$FoodTemplateCopyWithImpl<$Res>
    implements $FoodTemplateCopyWith<$Res> {
  _$FoodTemplateCopyWithImpl(this._self, this._then);

  final FoodTemplate _self;
  final $Res Function(FoodTemplate) _then;

/// Create a copy of FoodTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? calories = null,Object? emoji = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodTemplate].
extension FoodTemplatePatterns on FoodTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodTemplate value)  $default,){
final _that = this;
switch (_that) {
case _FoodTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _FoodTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int calories,  String? emoji)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodTemplate() when $default != null:
return $default(_that.name,_that.calories,_that.emoji);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int calories,  String? emoji)  $default,) {final _that = this;
switch (_that) {
case _FoodTemplate():
return $default(_that.name,_that.calories,_that.emoji);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int calories,  String? emoji)?  $default,) {final _that = this;
switch (_that) {
case _FoodTemplate() when $default != null:
return $default(_that.name,_that.calories,_that.emoji);case _:
  return null;

}
}

}

/// @nodoc


class _FoodTemplate implements FoodTemplate {
  const _FoodTemplate({required this.name, required this.calories, this.emoji});
  

@override final  String name;
@override final  int calories;
@override final  String? emoji;

/// Create a copy of FoodTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodTemplateCopyWith<_FoodTemplate> get copyWith => __$FoodTemplateCopyWithImpl<_FoodTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}


@override
int get hashCode => Object.hash(runtimeType,name,calories,emoji);

@override
String toString() {
  return 'FoodTemplate(name: $name, calories: $calories, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class _$FoodTemplateCopyWith<$Res> implements $FoodTemplateCopyWith<$Res> {
  factory _$FoodTemplateCopyWith(_FoodTemplate value, $Res Function(_FoodTemplate) _then) = __$FoodTemplateCopyWithImpl;
@override @useResult
$Res call({
 String name, int calories, String? emoji
});




}
/// @nodoc
class __$FoodTemplateCopyWithImpl<$Res>
    implements _$FoodTemplateCopyWith<$Res> {
  __$FoodTemplateCopyWithImpl(this._self, this._then);

  final _FoodTemplate _self;
  final $Res Function(_FoodTemplate) _then;

/// Create a copy of FoodTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? calories = null,Object? emoji = freezed,}) {
  return _then(_FoodTemplate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
