import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';

abstract class FavoriteWordRepository {
  Future<Either<List<WordEntity>, Exception>> getFavorites();
  Future<Either<void, Exception>> addFavorite(WordEntity word);
  Future<Either<void, Exception>> removeFavorite(String id);
  Future<Either<bool, Exception>> isFavorite(String id);
}
