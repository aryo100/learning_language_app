import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class GetWordUsecase extends UsecaseNoParam<List<WordEntity>> {
  final WordRepository _repository;

  GetWordUsecase(this._repository);

  @override
  Future<Either<List<WordEntity>, Exception>> call() {
    return _repository.getWords();
  }
}
