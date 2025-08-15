// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_word_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartWordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartWordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartWordEvent()';
}


}

/// @nodoc
class $CartWordEventCopyWith<$Res>  {
$CartWordEventCopyWith(CartWordEvent _, $Res Function(CartWordEvent) __);
}


/// Adds pattern-matching-related methods to [CartWordEvent].
extension CartWordEventPatterns on CartWordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _GetCartWord value)?  getCartWord,TResult Function( _AddCartWord value)?  addCartWord,TResult Function( _RemoveCartWord value)?  removeCartWord,TResult Function( _ToggleCartWord value)?  toggleCartWord,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCartWord() when getCartWord != null:
return getCartWord(_that);case _AddCartWord() when addCartWord != null:
return addCartWord(_that);case _RemoveCartWord() when removeCartWord != null:
return removeCartWord(_that);case _ToggleCartWord() when toggleCartWord != null:
return toggleCartWord(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _GetCartWord value)  getCartWord,required TResult Function( _AddCartWord value)  addCartWord,required TResult Function( _RemoveCartWord value)  removeCartWord,required TResult Function( _ToggleCartWord value)  toggleCartWord,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _GetCartWord():
return getCartWord(_that);case _AddCartWord():
return addCartWord(_that);case _RemoveCartWord():
return removeCartWord(_that);case _ToggleCartWord():
return toggleCartWord(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _GetCartWord value)?  getCartWord,TResult? Function( _AddCartWord value)?  addCartWord,TResult? Function( _RemoveCartWord value)?  removeCartWord,TResult? Function( _ToggleCartWord value)?  toggleCartWord,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _GetCartWord() when getCartWord != null:
return getCartWord(_that);case _AddCartWord() when addCartWord != null:
return addCartWord(_that);case _RemoveCartWord() when removeCartWord != null:
return removeCartWord(_that);case _ToggleCartWord() when toggleCartWord != null:
return toggleCartWord(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  getCartWord,TResult Function( CartWordEntity cartWord)?  addCartWord,TResult Function( String id)?  removeCartWord,TResult Function( String id)?  toggleCartWord,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCartWord() when getCartWord != null:
return getCartWord();case _AddCartWord() when addCartWord != null:
return addCartWord(_that.cartWord);case _RemoveCartWord() when removeCartWord != null:
return removeCartWord(_that.id);case _ToggleCartWord() when toggleCartWord != null:
return toggleCartWord(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  getCartWord,required TResult Function( CartWordEntity cartWord)  addCartWord,required TResult Function( String id)  removeCartWord,required TResult Function( String id)  toggleCartWord,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _GetCartWord():
return getCartWord();case _AddCartWord():
return addCartWord(_that.cartWord);case _RemoveCartWord():
return removeCartWord(_that.id);case _ToggleCartWord():
return toggleCartWord(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  getCartWord,TResult? Function( CartWordEntity cartWord)?  addCartWord,TResult? Function( String id)?  removeCartWord,TResult? Function( String id)?  toggleCartWord,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _GetCartWord() when getCartWord != null:
return getCartWord();case _AddCartWord() when addCartWord != null:
return addCartWord(_that.cartWord);case _RemoveCartWord() when removeCartWord != null:
return removeCartWord(_that.id);case _ToggleCartWord() when toggleCartWord != null:
return toggleCartWord(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CartWordEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartWordEvent.started()';
}


}




/// @nodoc


class _GetCartWord implements CartWordEvent {
  const _GetCartWord();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCartWord);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartWordEvent.getCartWord()';
}


}




/// @nodoc


class _AddCartWord implements CartWordEvent {
  const _AddCartWord(this.cartWord);
  

 final  CartWordEntity cartWord;

/// Create a copy of CartWordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCartWordCopyWith<_AddCartWord> get copyWith => __$AddCartWordCopyWithImpl<_AddCartWord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCartWord&&(identical(other.cartWord, cartWord) || other.cartWord == cartWord));
}


@override
int get hashCode => Object.hash(runtimeType,cartWord);

@override
String toString() {
  return 'CartWordEvent.addCartWord(cartWord: $cartWord)';
}


}

/// @nodoc
abstract mixin class _$AddCartWordCopyWith<$Res> implements $CartWordEventCopyWith<$Res> {
  factory _$AddCartWordCopyWith(_AddCartWord value, $Res Function(_AddCartWord) _then) = __$AddCartWordCopyWithImpl;
@useResult
$Res call({
 CartWordEntity cartWord
});




}
/// @nodoc
class __$AddCartWordCopyWithImpl<$Res>
    implements _$AddCartWordCopyWith<$Res> {
  __$AddCartWordCopyWithImpl(this._self, this._then);

  final _AddCartWord _self;
  final $Res Function(_AddCartWord) _then;

/// Create a copy of CartWordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartWord = null,}) {
  return _then(_AddCartWord(
null == cartWord ? _self.cartWord : cartWord // ignore: cast_nullable_to_non_nullable
as CartWordEntity,
  ));
}


}

/// @nodoc


class _RemoveCartWord implements CartWordEvent {
  const _RemoveCartWord(this.id);
  

 final  String id;

/// Create a copy of CartWordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCartWordCopyWith<_RemoveCartWord> get copyWith => __$RemoveCartWordCopyWithImpl<_RemoveCartWord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveCartWord&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CartWordEvent.removeCartWord(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RemoveCartWordCopyWith<$Res> implements $CartWordEventCopyWith<$Res> {
  factory _$RemoveCartWordCopyWith(_RemoveCartWord value, $Res Function(_RemoveCartWord) _then) = __$RemoveCartWordCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$RemoveCartWordCopyWithImpl<$Res>
    implements _$RemoveCartWordCopyWith<$Res> {
  __$RemoveCartWordCopyWithImpl(this._self, this._then);

  final _RemoveCartWord _self;
  final $Res Function(_RemoveCartWord) _then;

/// Create a copy of CartWordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_RemoveCartWord(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ToggleCartWord implements CartWordEvent {
  const _ToggleCartWord(this.id);
  

 final  String id;

/// Create a copy of CartWordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleCartWordCopyWith<_ToggleCartWord> get copyWith => __$ToggleCartWordCopyWithImpl<_ToggleCartWord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleCartWord&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CartWordEvent.toggleCartWord(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ToggleCartWordCopyWith<$Res> implements $CartWordEventCopyWith<$Res> {
  factory _$ToggleCartWordCopyWith(_ToggleCartWord value, $Res Function(_ToggleCartWord) _then) = __$ToggleCartWordCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$ToggleCartWordCopyWithImpl<$Res>
    implements _$ToggleCartWordCopyWith<$Res> {
  __$ToggleCartWordCopyWithImpl(this._self, this._then);

  final _ToggleCartWord _self;
  final $Res Function(_ToggleCartWord) _then;

/// Create a copy of CartWordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ToggleCartWord(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CartWordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartWordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartWordState()';
}


}

/// @nodoc
class $CartWordStateCopyWith<$Res>  {
$CartWordStateCopyWith(CartWordState _, $Res Function(CartWordState) __);
}


/// Adds pattern-matching-related methods to [CartWordState].
extension CartWordStatePatterns on CartWordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CartWordEntity> cartWords)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.cartWords);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CartWordEntity> cartWords)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.cartWords);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CartWordEntity> cartWords)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.cartWords);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartWordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartWordState.initial()';
}


}




/// @nodoc


class _Loading implements CartWordState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartWordState.loading()';
}


}




/// @nodoc


class _Success implements CartWordState {
  const _Success(final  List<CartWordEntity> cartWords): _cartWords = cartWords;
  

 final  List<CartWordEntity> _cartWords;
 List<CartWordEntity> get cartWords {
  if (_cartWords is EqualUnmodifiableListView) return _cartWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cartWords);
}


/// Create a copy of CartWordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._cartWords, _cartWords));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cartWords));

@override
String toString() {
  return 'CartWordState.success(cartWords: $cartWords)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $CartWordStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<CartWordEntity> cartWords
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of CartWordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartWords = null,}) {
  return _then(_Success(
null == cartWords ? _self._cartWords : cartWords // ignore: cast_nullable_to_non_nullable
as List<CartWordEntity>,
  ));
}


}

/// @nodoc


class _Failure implements CartWordState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of CartWordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CartWordState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $CartWordStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of CartWordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
