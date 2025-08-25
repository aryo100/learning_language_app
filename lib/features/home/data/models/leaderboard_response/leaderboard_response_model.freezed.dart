// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardResponseModel {

 List<LeaderboardModel> get points; List<LeaderboardModel> get attendance;
/// Create a copy of LeaderboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardResponseModelCopyWith<LeaderboardResponseModel> get copyWith => _$LeaderboardResponseModelCopyWithImpl<LeaderboardResponseModel>(this as LeaderboardResponseModel, _$identity);

  /// Serializes this LeaderboardResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardResponseModel&&const DeepCollectionEquality().equals(other.points, points)&&const DeepCollectionEquality().equals(other.attendance, attendance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),const DeepCollectionEquality().hash(attendance));

@override
String toString() {
  return 'LeaderboardResponseModel(points: $points, attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class $LeaderboardResponseModelCopyWith<$Res>  {
  factory $LeaderboardResponseModelCopyWith(LeaderboardResponseModel value, $Res Function(LeaderboardResponseModel) _then) = _$LeaderboardResponseModelCopyWithImpl;
@useResult
$Res call({
 List<LeaderboardModel> points, List<LeaderboardModel> attendance
});




}
/// @nodoc
class _$LeaderboardResponseModelCopyWithImpl<$Res>
    implements $LeaderboardResponseModelCopyWith<$Res> {
  _$LeaderboardResponseModelCopyWithImpl(this._self, this._then);

  final LeaderboardResponseModel _self;
  final $Res Function(LeaderboardResponseModel) _then;

/// Create a copy of LeaderboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? attendance = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<LeaderboardModel>,attendance: null == attendance ? _self.attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<LeaderboardModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardResponseModel].
extension LeaderboardResponseModelPatterns on LeaderboardResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardResponseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LeaderboardModel> points,  List<LeaderboardModel> attendance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardResponseModel() when $default != null:
return $default(_that.points,_that.attendance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LeaderboardModel> points,  List<LeaderboardModel> attendance)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardResponseModel():
return $default(_that.points,_that.attendance);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LeaderboardModel> points,  List<LeaderboardModel> attendance)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardResponseModel() when $default != null:
return $default(_that.points,_that.attendance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderboardResponseModel implements LeaderboardResponseModel {
   _LeaderboardResponseModel({required final  List<LeaderboardModel> points, required final  List<LeaderboardModel> attendance}): _points = points,_attendance = attendance;
  factory _LeaderboardResponseModel.fromJson(Map<String, dynamic> json) => _$LeaderboardResponseModelFromJson(json);

 final  List<LeaderboardModel> _points;
@override List<LeaderboardModel> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

 final  List<LeaderboardModel> _attendance;
@override List<LeaderboardModel> get attendance {
  if (_attendance is EqualUnmodifiableListView) return _attendance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attendance);
}


/// Create a copy of LeaderboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardResponseModelCopyWith<_LeaderboardResponseModel> get copyWith => __$LeaderboardResponseModelCopyWithImpl<_LeaderboardResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardResponseModel&&const DeepCollectionEquality().equals(other._points, _points)&&const DeepCollectionEquality().equals(other._attendance, _attendance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),const DeepCollectionEquality().hash(_attendance));

@override
String toString() {
  return 'LeaderboardResponseModel(points: $points, attendance: $attendance)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardResponseModelCopyWith<$Res> implements $LeaderboardResponseModelCopyWith<$Res> {
  factory _$LeaderboardResponseModelCopyWith(_LeaderboardResponseModel value, $Res Function(_LeaderboardResponseModel) _then) = __$LeaderboardResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<LeaderboardModel> points, List<LeaderboardModel> attendance
});




}
/// @nodoc
class __$LeaderboardResponseModelCopyWithImpl<$Res>
    implements _$LeaderboardResponseModelCopyWith<$Res> {
  __$LeaderboardResponseModelCopyWithImpl(this._self, this._then);

  final _LeaderboardResponseModel _self;
  final $Res Function(_LeaderboardResponseModel) _then;

/// Create a copy of LeaderboardResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? attendance = null,}) {
  return _then(_LeaderboardResponseModel(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<LeaderboardModel>,attendance: null == attendance ? _self._attendance : attendance // ignore: cast_nullable_to_non_nullable
as List<LeaderboardModel>,
  ));
}


}

// dart format on
