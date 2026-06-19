import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../repositories/cart_word_repository.dart';

class RemoveCartWordUsecase implements Usecase<void, String> {
  final CartWordRepository _repository;

  RemoveCartWordUsecase(this._repository);

  @override
  Future<Either<void, Exception>> call(String params) {
    return _repository.removeCartWord(params);
  }
}
