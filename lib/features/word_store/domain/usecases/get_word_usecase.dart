import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/word_catalog_entity.dart';
import '../repositories/word_repository.dart';

class GetWordUsecase extends UsecaseNoParam<WordCatalogEntity> {
  final WordRepository _repository;

  GetWordUsecase(this._repository);

  @override
  Future<Either<WordCatalogEntity, Exception>> call() {
    return _repository.getWordCatalog();
  }
}
