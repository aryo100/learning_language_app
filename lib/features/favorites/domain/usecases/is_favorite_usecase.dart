import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../repositories/favorite_word_repository.dart';

class IsFavoriteUsecase implements Usecase<bool, String> {
  IsFavoriteUsecase(this._repository);

  final FavoriteWordRepository _repository;

  @override
  Future<Either<bool, Exception>> call(String params) =>
      _repository.isFavorite(params);
}
