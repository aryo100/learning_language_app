import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../repositories/favorite_word_repository.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';

class AddFavoriteUsecase implements Usecase<void, WordEntity> {
  AddFavoriteUsecase(this._repository);

  final FavoriteWordRepository _repository;

  @override
  Future<Either<void, Exception>> call(WordEntity params) =>
      _repository.addFavorite(params);
}
