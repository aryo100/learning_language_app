import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../entities/check_in_result_entity.dart';
import '../repositories/summary_repository.dart';

class PostCheckInUsecase extends UsecaseNoParam<CheckInResultEntity> {
  PostCheckInUsecase(this._repository);

  final SummaryRepository _repository;

  @override
  Future<Either<CheckInResultEntity, Exception>> call() =>
      _repository.postCheckIn();
}
