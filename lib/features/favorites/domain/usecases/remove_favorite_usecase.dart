import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../repositories/favorite_word_repository.dart';

class RemoveFavoriteUsecase implements Usecase<void, String> {
  RemoveFavoriteUsecase(this._repository);

  final FavoriteWordRepository _repository;

  @override
  Future<Either<void, Exception>> call(String params) =>
      _repository.removeFavorite(params);
}
