import 'package:fpdart/fpdart.dart';
import '../entities/word_catalog_entity.dart';
import '../entities/word_entity.dart';

abstract class WordRepository {
  Future<Either<WordCatalogEntity, Exception>> getWordCatalog();
  Future<Either<List<WordEntity>, Exception>> searchWords(String query);
  Future<Either<WordEntity, Exception>> getWordByWord(String word);
  Future<Either<List<WordEntity>, Exception>> getRandomWords(int count);
}
