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
}
