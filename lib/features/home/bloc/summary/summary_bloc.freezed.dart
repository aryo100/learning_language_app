// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummaryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent()';
}


}

/// @nodoc
class $SummaryEventCopyWith<$Res>  {
$SummaryEventCopyWith(SummaryEvent _, $Res Function(SummaryEvent) __);
}


/// Adds pattern-matching-related methods to [SummaryEvent].
extension SummaryEventPatterns on SummaryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetCheckInSummary value)?  getCheckInSummary,TResult Function( _GetNewWord value)?  getNewWord,TResult Function( _GetLeaderboard value)?  getLeaderboard,TResult Function( _GetLeaderboardMe value)?  getLeaderboardMe,TResult Function( _GetPointsRules value)?  getPointsRules,TResult Function( _PostCheckIn value)?  postCheckIn,TResult Function( _ClearCheckInResult value)?  clearCheckInResult,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary(_that);case _GetNewWord() when getNewWord != null:
return getNewWord(_that);case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard(_that);case _GetLeaderboardMe() when getLeaderboardMe != null:
return getLeaderboardMe(_that);case _GetPointsRules() when getPointsRules != null:
return getPointsRules(_that);case _PostCheckIn() when postCheckIn != null:
return postCheckIn(_that);case _ClearCheckInResult() when clearCheckInResult != null:
return clearCheckInResult(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetCheckInSummary value)  getCheckInSummary,required TResult Function( _GetNewWord value)  getNewWord,required TResult Function( _GetLeaderboard value)  getLeaderboard,required TResult Function( _GetLeaderboardMe value)  getLeaderboardMe,required TResult Function( _GetPointsRules value)  getPointsRules,required TResult Function( _PostCheckIn value)  postCheckIn,required TResult Function( _ClearCheckInResult value)  clearCheckInResult,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetCheckInSummary():
return getCheckInSummary(_that);case _GetNewWord():
return getNewWord(_that);case _GetLeaderboard():
return getLeaderboard(_that);case _GetLeaderboardMe():
return getLeaderboardMe(_that);case _GetPointsRules():
return getPointsRules(_that);case _PostCheckIn():
return postCheckIn(_that);case _ClearCheckInResult():
return clearCheckInResult(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetCheckInSummary value)?  getCheckInSummary,TResult? Function( _GetNewWord value)?  getNewWord,TResult? Function( _GetLeaderboard value)?  getLeaderboard,TResult? Function( _GetLeaderboardMe value)?  getLeaderboardMe,TResult? Function( _GetPointsRules value)?  getPointsRules,TResult? Function( _PostCheckIn value)?  postCheckIn,TResult? Function( _ClearCheckInResult value)?  clearCheckInResult,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary(_that);case _GetNewWord() when getNewWord != null:
return getNewWord(_that);case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard(_that);case _GetLeaderboardMe() when getLeaderboardMe != null:
return getLeaderboardMe(_that);case _GetPointsRules() when getPointsRules != null:
return getPointsRules(_that);case _PostCheckIn() when postCheckIn != null:
return postCheckIn(_that);case _ClearCheckInResult() when clearCheckInResult != null:
return clearCheckInResult(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getCheckInSummary,TResult Function()?  getNewWord,TResult Function()?  getLeaderboard,TResult Function()?  getLeaderboardMe,TResult Function()?  getPointsRules,TResult Function()?  postCheckIn,TResult Function()?  clearCheckInResult,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary();case _GetNewWord() when getNewWord != null:
return getNewWord();case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard();case _GetLeaderboardMe() when getLeaderboardMe != null:
return getLeaderboardMe();case _GetPointsRules() when getPointsRules != null:
return getPointsRules();case _PostCheckIn() when postCheckIn != null:
return postCheckIn();case _ClearCheckInResult() when clearCheckInResult != null:
return clearCheckInResult();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getCheckInSummary,required TResult Function()  getNewWord,required TResult Function()  getLeaderboard,required TResult Function()  getLeaderboardMe,required TResult Function()  getPointsRules,required TResult Function()  postCheckIn,required TResult Function()  clearCheckInResult,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetCheckInSummary():
return getCheckInSummary();case _GetNewWord():
return getNewWord();case _GetLeaderboard():
return getLeaderboard();case _GetLeaderboardMe():
return getLeaderboardMe();case _GetPointsRules():
return getPointsRules();case _PostCheckIn():
return postCheckIn();case _ClearCheckInResult():
return clearCheckInResult();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getCheckInSummary,TResult? Function()?  getNewWord,TResult? Function()?  getLeaderboard,TResult? Function()?  getLeaderboardMe,TResult? Function()?  getPointsRules,TResult? Function()?  postCheckIn,TResult? Function()?  clearCheckInResult,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary();case _GetNewWord() when getNewWord != null:
return getNewWord();case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard();case _GetLeaderboardMe() when getLeaderboardMe != null:
return getLeaderboardMe();case _GetPointsRules() when getPointsRules != null:
return getPointsRules();case _PostCheckIn() when postCheckIn != null:
return postCheckIn();case _ClearCheckInResult() when clearCheckInResult != null:
return clearCheckInResult();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SummaryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.started()';
}


}




/// @nodoc


class _GetCheckInSummary implements SummaryEvent {
  const _GetCheckInSummary();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCheckInSummary);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.getCheckInSummary()';
}


}




/// @nodoc


class _GetNewWord implements SummaryEvent {
  const _GetNewWord();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNewWord);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.getNewWord()';
}


}




/// @nodoc


class _GetLeaderboard implements SummaryEvent {
  const _GetLeaderboard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLeaderboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.getLeaderboard()';
}


}




/// @nodoc


class _GetLeaderboardMe implements SummaryEvent {
  const _GetLeaderboardMe();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLeaderboardMe);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.getLeaderboardMe()';
}


}




/// @nodoc


class _GetPointsRules implements SummaryEvent {
  const _GetPointsRules();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPointsRules);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.getPointsRules()';
}


}




/// @nodoc


class _PostCheckIn implements SummaryEvent {
  const _PostCheckIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostCheckIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.postCheckIn()';
}


}




/// @nodoc


class _ClearCheckInResult implements SummaryEvent {
  const _ClearCheckInResult();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearCheckInResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SummaryEvent.clearCheckInResult()';
}


}




/// @nodoc
mixin _$SummaryState {

 CheckInSummaryEntity? get checkInSummary; VocabEntity? get vocab; LeaderboardResponseEntity? get leaderboard; LeaderboardMeEntity? get leaderboardMe; PointsRulesEntity? get pointsRules; String? get errorMessage; bool get isLoading; bool get isCheckInLoading; CheckInResultEntity? get lastCheckInResult;
/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryStateCopyWith<SummaryState> get copyWith => _$SummaryStateCopyWithImpl<SummaryState>(this as SummaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryState&&(identical(other.checkInSummary, checkInSummary) || other.checkInSummary == checkInSummary)&&(identical(other.vocab, vocab) || other.vocab == vocab)&&(identical(other.leaderboard, leaderboard) || other.leaderboard == leaderboard)&&(identical(other.leaderboardMe, leaderboardMe) || other.leaderboardMe == leaderboardMe)&&(identical(other.pointsRules, pointsRules) || other.pointsRules == pointsRules)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCheckInLoading, isCheckInLoading) || other.isCheckInLoading == isCheckInLoading)&&(identical(other.lastCheckInResult, lastCheckInResult) || other.lastCheckInResult == lastCheckInResult));
}


@override
int get hashCode => Object.hash(runtimeType,checkInSummary,vocab,leaderboard,leaderboardMe,pointsRules,errorMessage,isLoading,isCheckInLoading,lastCheckInResult);

@override
String toString() {
  return 'SummaryState(checkInSummary: $checkInSummary, vocab: $vocab, leaderboard: $leaderboard, leaderboardMe: $leaderboardMe, pointsRules: $pointsRules, errorMessage: $errorMessage, isLoading: $isLoading, isCheckInLoading: $isCheckInLoading, lastCheckInResult: $lastCheckInResult)';
}


}

/// @nodoc
abstract mixin class $SummaryStateCopyWith<$Res>  {
  factory $SummaryStateCopyWith(SummaryState value, $Res Function(SummaryState) _then) = _$SummaryStateCopyWithImpl;
@useResult
$Res call({
 CheckInSummaryEntity? checkInSummary, VocabEntity? vocab, LeaderboardResponseEntity? leaderboard, LeaderboardMeEntity? leaderboardMe, PointsRulesEntity? pointsRules, String? errorMessage, bool isLoading, bool isCheckInLoading, CheckInResultEntity? lastCheckInResult
});




}
/// @nodoc
class _$SummaryStateCopyWithImpl<$Res>
    implements $SummaryStateCopyWith<$Res> {
  _$SummaryStateCopyWithImpl(this._self, this._then);

  final SummaryState _self;
  final $Res Function(SummaryState) _then;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkInSummary = freezed,Object? vocab = freezed,Object? leaderboard = freezed,Object? leaderboardMe = freezed,Object? pointsRules = freezed,Object? errorMessage = freezed,Object? isLoading = null,Object? isCheckInLoading = null,Object? lastCheckInResult = freezed,}) {
  return _then(_self.copyWith(
checkInSummary: freezed == checkInSummary ? _self.checkInSummary : checkInSummary // ignore: cast_nullable_to_non_nullable
as CheckInSummaryEntity?,vocab: freezed == vocab ? _self.vocab : vocab // ignore: cast_nullable_to_non_nullable
as VocabEntity?,leaderboard: freezed == leaderboard ? _self.leaderboard : leaderboard // ignore: cast_nullable_to_non_nullable
as LeaderboardResponseEntity?,leaderboardMe: freezed == leaderboardMe ? _self.leaderboardMe : leaderboardMe // ignore: cast_nullable_to_non_nullable
as LeaderboardMeEntity?,pointsRules: freezed == pointsRules ? _self.pointsRules : pointsRules // ignore: cast_nullable_to_non_nullable
as PointsRulesEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCheckInLoading: null == isCheckInLoading ? _self.isCheckInLoading : isCheckInLoading // ignore: cast_nullable_to_non_nullable
as bool,lastCheckInResult: freezed == lastCheckInResult ? _self.lastCheckInResult : lastCheckInResult // ignore: cast_nullable_to_non_nullable
as CheckInResultEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummaryState].
extension SummaryStatePatterns on SummaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryState value)  $default,){
final _that = this;
switch (_that) {
case _SummaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryState value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckInSummaryEntity? checkInSummary,  VocabEntity? vocab,  LeaderboardResponseEntity? leaderboard,  LeaderboardMeEntity? leaderboardMe,  PointsRulesEntity? pointsRules,  String? errorMessage,  bool isLoading,  bool isCheckInLoading,  CheckInResultEntity? lastCheckInResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
return $default(_that.checkInSummary,_that.vocab,_that.leaderboard,_that.leaderboardMe,_that.pointsRules,_that.errorMessage,_that.isLoading,_that.isCheckInLoading,_that.lastCheckInResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckInSummaryEntity? checkInSummary,  VocabEntity? vocab,  LeaderboardResponseEntity? leaderboard,  LeaderboardMeEntity? leaderboardMe,  PointsRulesEntity? pointsRules,  String? errorMessage,  bool isLoading,  bool isCheckInLoading,  CheckInResultEntity? lastCheckInResult)  $default,) {final _that = this;
switch (_that) {
case _SummaryState():
return $default(_that.checkInSummary,_that.vocab,_that.leaderboard,_that.leaderboardMe,_that.pointsRules,_that.errorMessage,_that.isLoading,_that.isCheckInLoading,_that.lastCheckInResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckInSummaryEntity? checkInSummary,  VocabEntity? vocab,  LeaderboardResponseEntity? leaderboard,  LeaderboardMeEntity? leaderboardMe,  PointsRulesEntity? pointsRules,  String? errorMessage,  bool isLoading,  bool isCheckInLoading,  CheckInResultEntity? lastCheckInResult)?  $default,) {final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
return $default(_that.checkInSummary,_that.vocab,_that.leaderboard,_that.leaderboardMe,_that.pointsRules,_that.errorMessage,_that.isLoading,_that.isCheckInLoading,_that.lastCheckInResult);case _:
  return null;

}
}

}

/// @nodoc


class _SummaryState implements SummaryState {
  const _SummaryState({this.checkInSummary, this.vocab, this.leaderboard, this.leaderboardMe, this.pointsRules, this.errorMessage, this.isLoading = false, this.isCheckInLoading = false, this.lastCheckInResult});
  

@override final  CheckInSummaryEntity? checkInSummary;
@override final  VocabEntity? vocab;
@override final  LeaderboardResponseEntity? leaderboard;
@override final  LeaderboardMeEntity? leaderboardMe;
@override final  PointsRulesEntity? pointsRules;
@override final  String? errorMessage;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCheckInLoading;
@override final  CheckInResultEntity? lastCheckInResult;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryStateCopyWith<_SummaryState> get copyWith => __$SummaryStateCopyWithImpl<_SummaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryState&&(identical(other.checkInSummary, checkInSummary) || other.checkInSummary == checkInSummary)&&(identical(other.vocab, vocab) || other.vocab == vocab)&&(identical(other.leaderboard, leaderboard) || other.leaderboard == leaderboard)&&(identical(other.leaderboardMe, leaderboardMe) || other.leaderboardMe == leaderboardMe)&&(identical(other.pointsRules, pointsRules) || other.pointsRules == pointsRules)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCheckInLoading, isCheckInLoading) || other.isCheckInLoading == isCheckInLoading)&&(identical(other.lastCheckInResult, lastCheckInResult) || other.lastCheckInResult == lastCheckInResult));
}


@override
int get hashCode => Object.hash(runtimeType,checkInSummary,vocab,leaderboard,leaderboardMe,pointsRules,errorMessage,isLoading,isCheckInLoading,lastCheckInResult);

@override
String toString() {
  return 'SummaryState(checkInSummary: $checkInSummary, vocab: $vocab, leaderboard: $leaderboard, leaderboardMe: $leaderboardMe, pointsRules: $pointsRules, errorMessage: $errorMessage, isLoading: $isLoading, isCheckInLoading: $isCheckInLoading, lastCheckInResult: $lastCheckInResult)';
}


}

/// @nodoc
abstract mixin class _$SummaryStateCopyWith<$Res> implements $SummaryStateCopyWith<$Res> {
  factory _$SummaryStateCopyWith(_SummaryState value, $Res Function(_SummaryState) _then) = __$SummaryStateCopyWithImpl;
@override @useResult
$Res call({
 CheckInSummaryEntity? checkInSummary, VocabEntity? vocab, LeaderboardResponseEntity? leaderboard, LeaderboardMeEntity? leaderboardMe, PointsRulesEntity? pointsRules, String? errorMessage, bool isLoading, bool isCheckInLoading, CheckInResultEntity? lastCheckInResult
});




}
/// @nodoc
class __$SummaryStateCopyWithImpl<$Res>
    implements _$SummaryStateCopyWith<$Res> {
  __$SummaryStateCopyWithImpl(this._self, this._then);

  final _SummaryState _self;
  final $Res Function(_SummaryState) _then;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkInSummary = freezed,Object? vocab = freezed,Object? leaderboard = freezed,Object? leaderboardMe = freezed,Object? pointsRules = freezed,Object? errorMessage = freezed,Object? isLoading = null,Object? isCheckInLoading = null,Object? lastCheckInResult = freezed,}) {
  return _then(_SummaryState(
checkInSummary: freezed == checkInSummary ? _self.checkInSummary : checkInSummary // ignore: cast_nullable_to_non_nullable
as CheckInSummaryEntity?,vocab: freezed == vocab ? _self.vocab : vocab // ignore: cast_nullable_to_non_nullable
as VocabEntity?,leaderboard: freezed == leaderboard ? _self.leaderboard : leaderboard // ignore: cast_nullable_to_non_nullable
as LeaderboardResponseEntity?,leaderboardMe: freezed == leaderboardMe ? _self.leaderboardMe : leaderboardMe // ignore: cast_nullable_to_non_nullable
as LeaderboardMeEntity?,pointsRules: freezed == pointsRules ? _self.pointsRules : pointsRules // ignore: cast_nullable_to_non_nullable
as PointsRulesEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCheckInLoading: null == isCheckInLoading ? _self.isCheckInLoading : isCheckInLoading // ignore: cast_nullable_to_non_nullable
as bool,lastCheckInResult: freezed == lastCheckInResult ? _self.lastCheckInResult : lastCheckInResult // ignore: cast_nullable_to_non_nullable
as CheckInResultEntity?,
  ));
}


}

// dart format on
