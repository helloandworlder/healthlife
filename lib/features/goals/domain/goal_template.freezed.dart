// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GoalTemplate {

 String get name; String get icon; GoalPeriod get period; int get target; String get category;
/// Create a copy of GoalTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalTemplateCopyWith<GoalTemplate> get copyWith => _$GoalTemplateCopyWithImpl<GoalTemplate>(this as GoalTemplate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.period, period) || other.period == period)&&(identical(other.target, target) || other.target == target)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,name,icon,period,target,category);

@override
String toString() {
  return 'GoalTemplate(name: $name, icon: $icon, period: $period, target: $target, category: $category)';
}


}

/// @nodoc
abstract mixin class $GoalTemplateCopyWith<$Res>  {
  factory $GoalTemplateCopyWith(GoalTemplate value, $Res Function(GoalTemplate) _then) = _$GoalTemplateCopyWithImpl;
@useResult
$Res call({
 String name, String icon, GoalPeriod period, int target, String category
});




}
/// @nodoc
class _$GoalTemplateCopyWithImpl<$Res>
    implements $GoalTemplateCopyWith<$Res> {
  _$GoalTemplateCopyWithImpl(this._self, this._then);

  final GoalTemplate _self;
  final $Res Function(GoalTemplate) _then;

/// Create a copy of GoalTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? icon = null,Object? period = null,Object? target = null,Object? category = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as GoalPeriod,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalTemplate].
extension GoalTemplatePatterns on GoalTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalTemplate value)  $default,){
final _that = this;
switch (_that) {
case _GoalTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _GoalTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String icon,  GoalPeriod period,  int target,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalTemplate() when $default != null:
return $default(_that.name,_that.icon,_that.period,_that.target,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String icon,  GoalPeriod period,  int target,  String category)  $default,) {final _that = this;
switch (_that) {
case _GoalTemplate():
return $default(_that.name,_that.icon,_that.period,_that.target,_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String icon,  GoalPeriod period,  int target,  String category)?  $default,) {final _that = this;
switch (_that) {
case _GoalTemplate() when $default != null:
return $default(_that.name,_that.icon,_that.period,_that.target,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _GoalTemplate implements GoalTemplate {
  const _GoalTemplate({required this.name, required this.icon, required this.period, required this.target, required this.category});
  

@override final  String name;
@override final  String icon;
@override final  GoalPeriod period;
@override final  int target;
@override final  String category;

/// Create a copy of GoalTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalTemplateCopyWith<_GoalTemplate> get copyWith => __$GoalTemplateCopyWithImpl<_GoalTemplate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalTemplate&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.period, period) || other.period == period)&&(identical(other.target, target) || other.target == target)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,name,icon,period,target,category);

@override
String toString() {
  return 'GoalTemplate(name: $name, icon: $icon, period: $period, target: $target, category: $category)';
}


}

/// @nodoc
abstract mixin class _$GoalTemplateCopyWith<$Res> implements $GoalTemplateCopyWith<$Res> {
  factory _$GoalTemplateCopyWith(_GoalTemplate value, $Res Function(_GoalTemplate) _then) = __$GoalTemplateCopyWithImpl;
@override @useResult
$Res call({
 String name, String icon, GoalPeriod period, int target, String category
});




}
/// @nodoc
class __$GoalTemplateCopyWithImpl<$Res>
    implements _$GoalTemplateCopyWith<$Res> {
  __$GoalTemplateCopyWithImpl(this._self, this._then);

  final _GoalTemplate _self;
  final $Res Function(_GoalTemplate) _then;

/// Create a copy of GoalTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? icon = null,Object? period = null,Object? target = null,Object? category = null,}) {
  return _then(_GoalTemplate(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as GoalPeriod,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
