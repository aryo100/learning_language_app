// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocab_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VocabModel {

 String get word; List<String> get synonyms; List<String> get antonyms; String get definition; String get example; String get type;
/// Create a copy of VocabModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabModelCopyWith<VocabModel> get copyWith => _$VocabModelCopyWithImpl<VocabModel>(this as VocabModel, _$identity);

  /// Serializes this VocabModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabModel&&(identical(other.word, word) || other.word == word)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.antonyms, antonyms)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(antonyms),definition,example,type);

@override
String toString() {
  return 'VocabModel(word: $word, synonyms: $synonyms, antonyms: $antonyms, definition: $definition, example: $example, type: $type)';
}


}

/// @nodoc
abstract mixin class $VocabModelCopyWith<$Res>  {
  factory $VocabModelCopyWith(VocabModel value, $Res Function(VocabModel) _then) = _$VocabModelCopyWithImpl;
@useResult
$Res call({
 String word, List<String> synonyms, List<String> antonyms, String definition, String example, String type
});




}
/// @nodoc
class _$VocabModelCopyWithImpl<$Res>
    implements $VocabModelCopyWith<$Res> {
  _$VocabModelCopyWithImpl(this._self, this._then);

  final VocabModel _self;
  final $Res Function(VocabModel) _then;

/// Create a copy of VocabModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? synonyms = null,Object? antonyms = null,Object? definition = null,Object? example = null,Object? type = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,synonyms: null == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self.antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabModel].
extension VocabModelPatterns on VocabModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabModel value)  $default,){
final _that = this;
switch (_that) {
case _VocabModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabModel value)?  $default,){
final _that = this;
switch (_that) {
case _VocabModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  List<String> synonyms,  List<String> antonyms,  String definition,  String example,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabModel() when $default != null:
return $default(_that.word,_that.synonyms,_that.antonyms,_that.definition,_that.example,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  List<String> synonyms,  List<String> antonyms,  String definition,  String example,  String type)  $default,) {final _that = this;
switch (_that) {
case _VocabModel():
return $default(_that.word,_that.synonyms,_that.antonyms,_that.definition,_that.example,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  List<String> synonyms,  List<String> antonyms,  String definition,  String example,  String type)?  $default,) {final _that = this;
switch (_that) {
case _VocabModel() when $default != null:
return $default(_that.word,_that.synonyms,_that.antonyms,_that.definition,_that.example,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabModel implements VocabModel {
   _VocabModel(this.word, final  List<String> synonyms, final  List<String> antonyms, this.definition, this.example, this.type): _synonyms = synonyms,_antonyms = antonyms;
  factory _VocabModel.fromJson(Map<String, dynamic> json) => _$VocabModelFromJson(json);

@override final  String word;
 final  List<String> _synonyms;
@override List<String> get synonyms {
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_synonyms);
}

 final  List<String> _antonyms;
@override List<String> get antonyms {
  if (_antonyms is EqualUnmodifiableListView) return _antonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_antonyms);
}

@override final  String definition;
@override final  String example;
@override final  String type;

/// Create a copy of VocabModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabModelCopyWith<_VocabModel> get copyWith => __$VocabModelCopyWithImpl<_VocabModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabModel&&(identical(other.word, word) || other.word == word)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._antonyms, _antonyms)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_antonyms),definition,example,type);

@override
String toString() {
  return 'VocabModel(word: $word, synonyms: $synonyms, antonyms: $antonyms, definition: $definition, example: $example, type: $type)';
}


}

/// @nodoc
abstract mixin class _$VocabModelCopyWith<$Res> implements $VocabModelCopyWith<$Res> {
  factory _$VocabModelCopyWith(_VocabModel value, $Res Function(_VocabModel) _then) = __$VocabModelCopyWithImpl;
@override @useResult
$Res call({
 String word, List<String> synonyms, List<String> antonyms, String definition, String example, String type
});




}
/// @nodoc
class __$VocabModelCopyWithImpl<$Res>
    implements _$VocabModelCopyWith<$Res> {
  __$VocabModelCopyWithImpl(this._self, this._then);

  final _VocabModel _self;
  final $Res Function(_VocabModel) _then;

/// Create a copy of VocabModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? synonyms = null,Object? antonyms = null,Object? definition = null,Object? example = null,Object? type = null,}) {
  return _then(_VocabModel(
null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,null == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,null == antonyms ? _self._antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
