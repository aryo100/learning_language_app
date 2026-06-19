import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class GetRandomWordsUsecase implements Usecase<List<WordEntity>, int> {
  final WordRepository _repository;

  GetRandomWordsUsecase(this._repository);

  @override
  Future<Either<List<WordEntity>, Exception>> call(int params) {
    return _repository.getRandomWords(params);
  }
}
