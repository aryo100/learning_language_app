// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocab_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VocabModel _$VocabModelFromJson(Map<String, dynamic> json) => _VocabModel(
  json['word'] as String,
  (json['synonyms'] as List<dynamic>).map((e) => e as String).toList(),
  (json['antonyms'] as List<dynamic>).map((e) => e as String).toList(),
  json['definition'] as String,
  json['example'] as String,
  json['type'] as String,
);

Map<String, dynamic> _$VocabModelToJson(_VocabModel instance) =>
    <String, dynamic>{
      'word': instance.word,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'definition': instance.definition,
      'example': instance.example,
      'type': instance.type,
    };
