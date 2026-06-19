import 'package:fpdart/fpdart.dart';
import '../../domain/entities/word_catalog_entity.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/word_repository.dart';
import '../data_sources/word_data_source.dart';

class WordRepositoryImpl implements WordRepository {
  final WordDataSource _dataSource;

  WordRepositoryImpl(this._dataSource);

  @override
  Future<Either<WordCatalogEntity, Exception>> getWordCatalog() async {
    try {
      final wordModels = await _dataSource.getWords();
      final total = await _dataSource.getVocabTotal();
      final wordEntities =
          wordModels.map((model) => WordEntity.fromModel(model)).toList();

      return Left(WordCatalogEntity(words: wordEntities, total: total));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<WordEntity>, Exception>> searchWords(String query) async {
    try {
      final models = await _dataSource.searchWords(query);
      return Left(models.map(WordEntity.fromModel).toList());
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<WordEntity, Exception>> getWordByWord(String word) async {
    try {
      final model = await _dataSource.getWordByWord(word);
      return Left(WordEntity.fromModel(model));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<List<WordEntity>, Exception>> getRandomWords(int count) async {
    try {
      final models = await _dataSource.getRandomWords(count);
      return Left(models.map(WordEntity.fromModel).toList());
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
