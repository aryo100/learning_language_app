import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

class WordEntity extends Equatable {
  final String id;
  final String word;
  final List<String> synonyms;
  final List<String> antonyms;
  final String definition;
  final String example;
  final String type;

  const WordEntity({
    required this.id,
    required this.word,
    this.synonyms = const [],
    this.antonyms = const [],
    required this.definition,
    required this.example,
    required this.type,
  });

  @override
  List<Object?> get props => [
    id,
    word,
    synonyms,
    antonyms,
    definition,
    example,
    type,
  ];

  WordEntity copyWith({
    String? id,
    String? word,
    List<String>? synonyms,
    List<String>? antonyms,
    String? definition,
    String? example,
    String? type,
  }) {
    return WordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      synonyms: synonyms ?? this.synonyms,
      antonyms: antonyms ?? this.antonyms,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      type: type ?? this.type,
    );
  }

  static WordEntity fromModel(WordModel model) {
    return WordEntity(
      id: model.id,
      word: model.word,
      synonyms: model.synonyms,
      antonyms: model.antonyms,
      definition: model.definition,
      example: model.example,
      type: model.type,
    );
  }
}
