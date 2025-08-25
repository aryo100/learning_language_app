// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WordModel _$WordModelFromJson(Map<String, dynamic> json) => _WordModel(
  id: json['id'] as String,
  word: json['word'] as String,
  definition: json['definition'] as String,
  example: json['example'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$WordModelToJson(_WordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'definition': instance.definition,
      'example': instance.example,
      'type': instance.type,
    };
