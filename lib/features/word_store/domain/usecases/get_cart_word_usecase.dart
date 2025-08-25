import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_entity.dart';
import '../repositories/cart_word_repository.dart';

class GetCartWordUsecase extends UsecaseNoParam<List<WordEntity>> {
  final CartWordRepository _repository;

  GetCartWordUsecase(this._repository);

  @override
  Future<Either<List<WordEntity>, Exception>> call() {
    return _repository.getCartWords();
  }
}
