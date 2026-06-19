import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class GetWordByWordUsecase implements Usecase<WordEntity, String> {
  final WordRepository _repository;

  GetWordByWordUsecase(this._repository);

  @override
  Future<Either<WordEntity, Exception>> call(String params) {
    return _repository.getWordByWord(params);
  }
}
