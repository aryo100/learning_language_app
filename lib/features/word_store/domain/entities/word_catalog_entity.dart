import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';

class WordCatalogEntity extends Equatable {
  final List<WordEntity> words;
  final int total;

  const WordCatalogEntity({
    required this.words,
    required this.total,
  });

  @override
  List<Object?> get props => [words, total];
}
