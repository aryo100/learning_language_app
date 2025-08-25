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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetCheckInSummary value)?  getCheckInSummary,TResult Function( _GetNewWord value)?  getNewWord,TResult Function( _GetLeaderboard value)?  getLeaderboard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary(_that);case _GetNewWord() when getNewWord != null:
return getNewWord(_that);case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetCheckInSummary value)  getCheckInSummary,required TResult Function( _GetNewWord value)  getNewWord,required TResult Function( _GetLeaderboard value)  getLeaderboard,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetCheckInSummary():
return getCheckInSummary(_that);case _GetNewWord():
return getNewWord(_that);case _GetLeaderboard():
return getLeaderboard(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetCheckInSummary value)?  getCheckInSummary,TResult? Function( _GetNewWord value)?  getNewWord,TResult? Function( _GetLeaderboard value)?  getLeaderboard,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary(_that);case _GetNewWord() when getNewWord != null:
return getNewWord(_that);case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getCheckInSummary,TResult Function()?  getNewWord,TResult Function()?  getLeaderboard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary();case _GetNewWord() when getNewWord != null:
return getNewWord();case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getCheckInSummary,required TResult Function()  getNewWord,required TResult Function()  getLeaderboard,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetCheckInSummary():
return getCheckInSummary();case _GetNewWord():
return getNewWord();case _GetLeaderboard():
return getLeaderboard();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getCheckInSummary,TResult? Function()?  getNewWord,TResult? Function()?  getLeaderboard,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCheckInSummary() when getCheckInSummary != null:
return getCheckInSummary();case _GetNewWord() when getNewWord != null:
return getNewWord();case _GetLeaderboard() when getLeaderboard != null:
return getLeaderboard();case _:
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
mixin _$SummaryState {

 CheckInSummaryEntity? get checkInSummary; VocabEntity? get vocab; LeaderboardResponseEntity? get leaderboard; String? get errorMessage; bool get isLoading;
/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryStateCopyWith<SummaryState> get copyWith => _$SummaryStateCopyWithImpl<SummaryState>(this as SummaryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryState&&(identical(other.checkInSummary, checkInSummary) || other.checkInSummary == checkInSummary)&&(identical(other.vocab, vocab) || other.vocab == vocab)&&(identical(other.leaderboard, leaderboard) || other.leaderboard == leaderboard)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,checkInSummary,vocab,leaderboard,errorMessage,isLoading);

@override
String toString() {
  return 'SummaryState(checkInSummary: $checkInSummary, vocab: $vocab, leaderboard: $leaderboard, errorMessage: $errorMessage, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SummaryStateCopyWith<$Res>  {
  factory $SummaryStateCopyWith(SummaryState value, $Res Function(SummaryState) _then) = _$SummaryStateCopyWithImpl;
@useResult
$Res call({
 CheckInSummaryEntity? checkInSummary, VocabEntity? vocab, LeaderboardResponseEntity? leaderboard, String? errorMessage, bool isLoading
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
@pragma('vm:prefer-inline') @override $Res call({Object? checkInSummary = freezed,Object? vocab = freezed,Object? leaderboard = freezed,Object? errorMessage = freezed,Object? isLoading = null,}) {
  return _then(_self.copyWith(
checkInSummary: freezed == checkInSummary ? _self.checkInSummary : checkInSummary // ignore: cast_nullable_to_non_nullable
as CheckInSummaryEntity?,vocab: freezed == vocab ? _self.vocab : vocab // ignore: cast_nullable_to_non_nullable
as VocabEntity?,leaderboard: freezed == leaderboard ? _self.leaderboard : leaderboard // ignore: cast_nullable_to_non_nullable
as LeaderboardResponseEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckInSummaryEntity? checkInSummary,  VocabEntity? vocab,  LeaderboardResponseEntity? leaderboard,  String? errorMessage,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
return $default(_that.checkInSummary,_that.vocab,_that.leaderboard,_that.errorMessage,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckInSummaryEntity? checkInSummary,  VocabEntity? vocab,  LeaderboardResponseEntity? leaderboard,  String? errorMessage,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _SummaryState():
return $default(_that.checkInSummary,_that.vocab,_that.leaderboard,_that.errorMessage,_that.isLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckInSummaryEntity? checkInSummary,  VocabEntity? vocab,  LeaderboardResponseEntity? leaderboard,  String? errorMessage,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _SummaryState() when $default != null:
return $default(_that.checkInSummary,_that.vocab,_that.leaderboard,_that.errorMessage,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _SummaryState implements SummaryState {
  const _SummaryState({this.checkInSummary, this.vocab, this.leaderboard, this.errorMessage, this.isLoading = false});
  

@override final  CheckInSummaryEntity? checkInSummary;
@override final  VocabEntity? vocab;
@override final  LeaderboardResponseEntity? leaderboard;
@override final  String? errorMessage;
@override@JsonKey() final  bool isLoading;

/// Create a copy of SummaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryStateCopyWith<_SummaryState> get copyWith => __$SummaryStateCopyWithImpl<_SummaryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryState&&(identical(other.checkInSummary, checkInSummary) || other.checkInSummary == checkInSummary)&&(identical(other.vocab, vocab) || other.vocab == vocab)&&(identical(other.leaderboard, leaderboard) || other.leaderboard == leaderboard)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,checkInSummary,vocab,leaderboard,errorMessage,isLoading);

@override
String toString() {
  return 'SummaryState(checkInSummary: $checkInSummary, vocab: $vocab, leaderboard: $leaderboard, errorMessage: $errorMessage, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$SummaryStateCopyWith<$Res> implements $SummaryStateCopyWith<$Res> {
  factory _$SummaryStateCopyWith(_SummaryState value, $Res Function(_SummaryState) _then) = __$SummaryStateCopyWithImpl;
@override @useResult
$Res call({
 CheckInSummaryEntity? checkInSummary, VocabEntity? vocab, LeaderboardResponseEntity? leaderboard, String? errorMessage, bool isLoading
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
@override @pragma('vm:prefer-inline') $Res call({Object? checkInSummary = freezed,Object? vocab = freezed,Object? leaderboard = freezed,Object? errorMessage = freezed,Object? isLoading = null,}) {
  return _then(_SummaryState(
checkInSummary: freezed == checkInSummary ? _self.checkInSummary : checkInSummary // ignore: cast_nullable_to_non_nullable
as CheckInSummaryEntity?,vocab: freezed == vocab ? _self.vocab : vocab // ignore: cast_nullable_to_non_nullable
as VocabEntity?,leaderboard: freezed == leaderboard ? _self.leaderboard : leaderboard // ignore: cast_nullable_to_non_nullable
as LeaderboardResponseEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
