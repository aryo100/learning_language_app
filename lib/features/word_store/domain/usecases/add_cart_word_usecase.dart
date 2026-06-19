import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_entity.dart';
import '../repositories/cart_word_repository.dart';

class AddCartWordUsecase implements Usecase<void, WordEntity> {
  final CartWordRepository _repository;

  AddCartWordUsecase(this._repository);

  @override
  Future<Either<void, Exception>> call(WordEntity params) {
    return _repository.addCartWord(params);
  }
}
