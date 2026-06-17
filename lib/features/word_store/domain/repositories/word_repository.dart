import 'package:fpdart/fpdart.dart';
import '../entities/word_catalog_entity.dart';

abstract class WordRepository {
  Future<Either<WordCatalogEntity, Exception>> getWordCatalog();
}
