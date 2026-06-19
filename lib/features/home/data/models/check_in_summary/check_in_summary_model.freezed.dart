// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInSummaryModel {

 int get totalCheckInsPerWeek; int get totalCheckInsPerMonth; DateTime get lastCheckInDate; bool get canCheckInToday; int get streakDays; int get pointsPerCheckIn;
/// Create a copy of CheckInSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInSummaryModelCopyWith<CheckInSummaryModel> get copyWith => _$CheckInSummaryModelCopyWithImpl<CheckInSummaryModel>(this as CheckInSummaryModel, _$identity);

  /// Serializes this CheckInSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInSummaryModel&&(identical(other.totalCheckInsPerWeek, totalCheckInsPerWeek) || other.totalCheckInsPerWeek == totalCheckInsPerWeek)&&(identical(other.totalCheckInsPerMonth, totalCheckInsPerMonth) || other.totalCheckInsPerMonth == totalCheckInsPerMonth)&&(identical(other.lastCheckInDate, lastCheckInDate) || other.lastCheckInDate == lastCheckInDate)&&(identical(other.canCheckInToday, canCheckInToday) || other.canCheckInToday == canCheckInToday)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.pointsPerCheckIn, pointsPerCheckIn) || other.pointsPerCheckIn == pointsPerCheckIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCheckInsPerWeek,totalCheckInsPerMonth,lastCheckInDate,canCheckInToday,streakDays,pointsPerCheckIn);

@override
String toString() {
  return 'CheckInSummaryModel(totalCheckInsPerWeek: $totalCheckInsPerWeek, totalCheckInsPerMonth: $totalCheckInsPerMonth, lastCheckInDate: $lastCheckInDate, canCheckInToday: $canCheckInToday, streakDays: $streakDays, pointsPerCheckIn: $pointsPerCheckIn)';
}


}

/// @nodoc
abstract mixin class $CheckInSummaryModelCopyWith<$Res>  {
  factory $CheckInSummaryModelCopyWith(CheckInSummaryModel value, $Res Function(CheckInSummaryModel) _then) = _$CheckInSummaryModelCopyWithImpl;
@useResult
$Res call({
 int totalCheckInsPerWeek, int totalCheckInsPerMonth, DateTime lastCheckInDate, bool canCheckInToday, int streakDays, int pointsPerCheckIn
});




}
/// @nodoc
class _$CheckInSummaryModelCopyWithImpl<$Res>
    implements $CheckInSummaryModelCopyWith<$Res> {
  _$CheckInSummaryModelCopyWithImpl(this._self, this._then);

  final CheckInSummaryModel _self;
  final $Res Function(CheckInSummaryModel) _then;

/// Create a copy of CheckInSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCheckInsPerWeek = null,Object? totalCheckInsPerMonth = null,Object? lastCheckInDate = null,Object? canCheckInToday = null,Object? streakDays = null,Object? pointsPerCheckIn = null,}) {
  return _then(_self.copyWith(
totalCheckInsPerWeek: null == totalCheckInsPerWeek ? _self.totalCheckInsPerWeek : totalCheckInsPerWeek // ignore: cast_nullable_to_non_nullable
as int,totalCheckInsPerMonth: null == totalCheckInsPerMonth ? _self.totalCheckInsPerMonth : totalCheckInsPerMonth // ignore: cast_nullable_to_non_nullable
as int,lastCheckInDate: null == lastCheckInDate ? _self.lastCheckInDate : lastCheckInDate // ignore: cast_nullable_to_non_nullable
as DateTime,canCheckInToday: null == canCheckInToday ? _self.canCheckInToday : canCheckInToday // ignore: cast_nullable_to_non_nullable
as bool,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,pointsPerCheckIn: null == pointsPerCheckIn ? _self.pointsPerCheckIn : pointsPerCheckIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInSummaryModel].
extension CheckInSummaryModelPatterns on CheckInSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _CheckInSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalCheckInsPerWeek,  int totalCheckInsPerMonth,  DateTime lastCheckInDate,  bool canCheckInToday,  int streakDays,  int pointsPerCheckIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInSummaryModel() when $default != null:
return $default(_that.totalCheckInsPerWeek,_that.totalCheckInsPerMonth,_that.lastCheckInDate,_that.canCheckInToday,_that.streakDays,_that.pointsPerCheckIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalCheckInsPerWeek,  int totalCheckInsPerMonth,  DateTime lastCheckInDate,  bool canCheckInToday,  int streakDays,  int pointsPerCheckIn)  $default,) {final _that = this;
switch (_that) {
case _CheckInSummaryModel():
return $default(_that.totalCheckInsPerWeek,_that.totalCheckInsPerMonth,_that.lastCheckInDate,_that.canCheckInToday,_that.streakDays,_that.pointsPerCheckIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalCheckInsPerWeek,  int totalCheckInsPerMonth,  DateTime lastCheckInDate,  bool canCheckInToday,  int streakDays,  int pointsPerCheckIn)?  $default,) {final _that = this;
switch (_that) {
case _CheckInSummaryModel() when $default != null:
return $default(_that.totalCheckInsPerWeek,_that.totalCheckInsPerMonth,_that.lastCheckInDate,_that.canCheckInToday,_that.streakDays,_that.pointsPerCheckIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInSummaryModel implements CheckInSummaryModel {
   _CheckInSummaryModel({required this.totalCheckInsPerWeek, required this.totalCheckInsPerMonth, required this.lastCheckInDate, this.canCheckInToday = true, this.streakDays = 0, this.pointsPerCheckIn = 10});
  factory _CheckInSummaryModel.fromJson(Map<String, dynamic> json) => _$CheckInSummaryModelFromJson(json);

@override final  int totalCheckInsPerWeek;
@override final  int totalCheckInsPerMonth;
@override final  DateTime lastCheckInDate;
@override@JsonKey() final  bool canCheckInToday;
@override@JsonKey() final  int streakDays;
@override@JsonKey() final  int pointsPerCheckIn;

/// Create a copy of CheckInSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInSummaryModelCopyWith<_CheckInSummaryModel> get copyWith => __$CheckInSummaryModelCopyWithImpl<_CheckInSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInSummaryModel&&(identical(other.totalCheckInsPerWeek, totalCheckInsPerWeek) || other.totalCheckInsPerWeek == totalCheckInsPerWeek)&&(identical(other.totalCheckInsPerMonth, totalCheckInsPerMonth) || other.totalCheckInsPerMonth == totalCheckInsPerMonth)&&(identical(other.lastCheckInDate, lastCheckInDate) || other.lastCheckInDate == lastCheckInDate)&&(identical(other.canCheckInToday, canCheckInToday) || other.canCheckInToday == canCheckInToday)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.pointsPerCheckIn, pointsPerCheckIn) || other.pointsPerCheckIn == pointsPerCheckIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCheckInsPerWeek,totalCheckInsPerMonth,lastCheckInDate,canCheckInToday,streakDays,pointsPerCheckIn);

@override
String toString() {
  return 'CheckInSummaryModel(totalCheckInsPerWeek: $totalCheckInsPerWeek, totalCheckInsPerMonth: $totalCheckInsPerMonth, lastCheckInDate: $lastCheckInDate, canCheckInToday: $canCheckInToday, streakDays: $streakDays, pointsPerCheckIn: $pointsPerCheckIn)';
}


}

/// @nodoc
abstract mixin class _$CheckInSummaryModelCopyWith<$Res> implements $CheckInSummaryModelCopyWith<$Res> {
  factory _$CheckInSummaryModelCopyWith(_CheckInSummaryModel value, $Res Function(_CheckInSummaryModel) _then) = __$CheckInSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int totalCheckInsPerWeek, int totalCheckInsPerMonth, DateTime lastCheckInDate, bool canCheckInToday, int streakDays, int pointsPerCheckIn
});




}
/// @nodoc
class __$CheckInSummaryModelCopyWithImpl<$Res>
    implements _$CheckInSummaryModelCopyWith<$Res> {
  __$CheckInSummaryModelCopyWithImpl(this._self, this._then);

  final _CheckInSummaryModel _self;
  final $Res Function(_CheckInSummaryModel) _then;

/// Create a copy of CheckInSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCheckInsPerWeek = null,Object? totalCheckInsPerMonth = null,Object? lastCheckInDate = null,Object? canCheckInToday = null,Object? streakDays = null,Object? pointsPerCheckIn = null,}) {
  return _then(_CheckInSummaryModel(
totalCheckInsPerWeek: null == totalCheckInsPerWeek ? _self.totalCheckInsPerWeek : totalCheckInsPerWeek // ignore: cast_nullable_to_non_nullable
as int,totalCheckInsPerMonth: null == totalCheckInsPerMonth ? _self.totalCheckInsPerMonth : totalCheckInsPerMonth // ignore: cast_nullable_to_non_nullable
as int,lastCheckInDate: null == lastCheckInDate ? _self.lastCheckInDate : lastCheckInDate // ignore: cast_nullable_to_non_nullable
as DateTime,canCheckInToday: null == canCheckInToday ? _self.canCheckInToday : canCheckInToday // ignore: cast_nullable_to_non_nullable
as bool,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,pointsPerCheckIn: null == pointsPerCheckIn ? _self.pointsPerCheckIn : pointsPerCheckIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
