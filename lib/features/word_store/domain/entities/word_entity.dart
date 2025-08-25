import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

class WordEntity extends Equatable {
  final String id;
  final String word;
  final String definition;
  final String example;
  final String type;

  const WordEntity({
    required this.id,
    required this.word,
    required this.definition,
    required this.example,
    required this.type,
  });

  @override
  List<Object?> get props => [
    id,
    word,
    definition,
    example,
    type,
  ];

  WordEntity copyWith({
    String? id,
    String? word,
    String? definition,
    String? example,
    String? type,
  }) {
    return WordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      type: type ?? this.type,
    );
  }

  static WordEntity fromModel(WordModel model) {
    return WordEntity(
      id: model.id,
      word: model.word,
      definition: model.definition,
      example: model.example,
      type: model.type,
    );
  }
}
