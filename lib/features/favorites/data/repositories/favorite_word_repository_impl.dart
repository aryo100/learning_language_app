import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/features/favorites/data/data_sources/favorite_word_data_source.dart';
import 'package:learning_language_app/features/favorites/domain/repositories/favorite_word_repository.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';

class FavoriteWordRepositoryImpl implements FavoriteWordRepository {
  FavoriteWordRepositoryImpl(this._dataSource);

  final FavoriteWordDataSource _dataSource;

  @override
  Future<Either<List<WordEntity>, Exception>> getFavorites() async {
    try {
      final models = await _dataSource.getFavorites();
      return Left(models.map(WordEntity.fromModel).toList());
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> addFavorite(WordEntity word) async {
    try {
      await _dataSource.addFavorite(_toModel(word));
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> removeFavorite(String id) async {
    try {
      await _dataSource.removeFavorite(id);
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<bool, Exception>> isFavorite(String id) async {
    try {
      final value = await _dataSource.isFavorite(id);
      return Left(value);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  WordModel _toModel(WordEntity entity) => WordModel(
    id: entity.id,
    word: entity.word,
    synonyms: entity.synonyms,
    antonyms: entity.antonyms,
    definition: entity.definition,
    example: entity.example,
    type: entity.type,
  );
}
