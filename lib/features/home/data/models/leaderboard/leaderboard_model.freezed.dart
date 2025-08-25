// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardModel {

 String get id; String get name; String get photoUrl; int get rank; int get score; String get achievement; DateTime get lastActive;
/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardModelCopyWith<LeaderboardModel> get copyWith => _$LeaderboardModelCopyWithImpl<LeaderboardModel>(this as LeaderboardModel, _$identity);

  /// Serializes this LeaderboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.score, score) || other.score == score)&&(identical(other.achievement, achievement) || other.achievement == achievement)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,photoUrl,rank,score,achievement,lastActive);

@override
String toString() {
  return 'LeaderboardModel(id: $id, name: $name, photoUrl: $photoUrl, rank: $rank, score: $score, achievement: $achievement, lastActive: $lastActive)';
}


}

/// @nodoc
abstract mixin class $LeaderboardModelCopyWith<$Res>  {
  factory $LeaderboardModelCopyWith(LeaderboardModel value, $Res Function(LeaderboardModel) _then) = _$LeaderboardModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String photoUrl, int rank, int score, String achievement, DateTime lastActive
});




}
/// @nodoc
class _$LeaderboardModelCopyWithImpl<$Res>
    implements $LeaderboardModelCopyWith<$Res> {
  _$LeaderboardModelCopyWithImpl(this._self, this._then);

  final LeaderboardModel _self;
  final $Res Function(LeaderboardModel) _then;

/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? photoUrl = null,Object? rank = null,Object? score = null,Object? achievement = null,Object? lastActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,achievement: null == achievement ? _self.achievement : achievement // ignore: cast_nullable_to_non_nullable
as String,lastActive: null == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardModel].
extension LeaderboardModelPatterns on LeaderboardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardModel value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String photoUrl,  int rank,  int score,  String achievement,  DateTime lastActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
return $default(_that.id,_that.name,_that.photoUrl,_that.rank,_that.score,_that.achievement,_that.lastActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String photoUrl,  int rank,  int score,  String achievement,  DateTime lastActive)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardModel():
return $default(_that.id,_that.name,_that.photoUrl,_that.rank,_that.score,_that.achievement,_that.lastActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String photoUrl,  int rank,  int score,  String achievement,  DateTime lastActive)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardModel() when $default != null:
return $default(_that.id,_that.name,_that.photoUrl,_that.rank,_that.score,_that.achievement,_that.lastActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaderboardModel implements LeaderboardModel {
   _LeaderboardModel({required this.id, required this.name, required this.photoUrl, required this.rank, required this.score, required this.achievement, required this.lastActive});
  factory _LeaderboardModel.fromJson(Map<String, dynamic> json) => _$LeaderboardModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String photoUrl;
@override final  int rank;
@override final  int score;
@override final  String achievement;
@override final  DateTime lastActive;

/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardModelCopyWith<_LeaderboardModel> get copyWith => __$LeaderboardModelCopyWithImpl<_LeaderboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.score, score) || other.score == score)&&(identical(other.achievement, achievement) || other.achievement == achievement)&&(identical(other.lastActive, lastActive) || other.lastActive == lastActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,photoUrl,rank,score,achievement,lastActive);

@override
String toString() {
  return 'LeaderboardModel(id: $id, name: $name, photoUrl: $photoUrl, rank: $rank, score: $score, achievement: $achievement, lastActive: $lastActive)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardModelCopyWith<$Res> implements $LeaderboardModelCopyWith<$Res> {
  factory _$LeaderboardModelCopyWith(_LeaderboardModel value, $Res Function(_LeaderboardModel) _then) = __$LeaderboardModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String photoUrl, int rank, int score, String achievement, DateTime lastActive
});




}
/// @nodoc
class __$LeaderboardModelCopyWithImpl<$Res>
    implements _$LeaderboardModelCopyWith<$Res> {
  __$LeaderboardModelCopyWithImpl(this._self, this._then);

  final _LeaderboardModel _self;
  final $Res Function(_LeaderboardModel) _then;

/// Create a copy of LeaderboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? photoUrl = null,Object? rank = null,Object? score = null,Object? achievement = null,Object? lastActive = null,}) {
  return _then(_LeaderboardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,achievement: null == achievement ? _self.achievement : achievement // ignore: cast_nullable_to_non_nullable
as String,lastActive: null == lastActive ? _self.lastActive : lastActive // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
