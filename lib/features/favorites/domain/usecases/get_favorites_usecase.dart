import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../repositories/favorite_word_repository.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';

class GetFavoritesUsecase extends UsecaseNoParam<List<WordEntity>> {
  GetFavoritesUsecase(this._repository);

  final FavoriteWordRepository _repository;

  @override
  Future<Either<List<WordEntity>, Exception>> call() =>
      _repository.getFavorites();
}
