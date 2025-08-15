import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import 'package:learning_language_app/features/home/domain/repositories/summary_repository.dart';

import '../entities/vocab_entity.dart';

class GetNewWordUsecase extends UsecaseNoParam<VocabEntity> {
  final SummaryRepository _repository;

  GetNewWordUsecase(this._repository);

  @override
  Future<Either<VocabEntity, Exception>> call() {
    return _repository.getNewWord();
  }
}
