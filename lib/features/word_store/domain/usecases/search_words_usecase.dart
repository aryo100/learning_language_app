import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_entity.dart';
import '../repositories/word_repository.dart';

class SearchWordsUsecase implements Usecase<List<WordEntity>, String> {
  final WordRepository _repository;

  SearchWordsUsecase(this._repository);

  @override
  Future<Either<List<WordEntity>, Exception>> call(String params) {
    return _repository.searchWords(params);
  }
}
