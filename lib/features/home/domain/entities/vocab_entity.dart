import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/home/data/models/vocab/vocab_model.dart';

class VocabEntity extends Equatable {
  final String word;
  final List<String> synonyms;
  final List<String> antonyms;
  final String definition;
  final String example;
  final String type;

  const VocabEntity({
    required this.word,
    required this.synonyms,
    required this.antonyms,
    required this.definition,
    required this.example,
    required this.type,
  });

  @override
  List<Object?> get props => [
    word,
    synonyms,
    antonyms,
    definition,
    example,
    type,
  ];

  VocabEntity copyWith({
    String? word,
    List<String>? synonyms,
    List<String>? antonyms,
    String? definition,
    String? example,
    String? type,
  }) {
    return VocabEntity(
      word: word ?? this.word,
      synonyms: synonyms ?? this.synonyms,
      antonyms: antonyms ?? this.antonyms,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      type: type ?? this.type,
    );
  }

  static VocabEntity fromModel(VocabModel model) {
    return VocabEntity(
      word: model.word,
      synonyms: model.synonyms,
      antonyms: model.antonyms,
      definition: model.definition,
      example: model.example,
      type: model.type,
    );
  }
}
