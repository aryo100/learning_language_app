import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import 'package:learning_language_app/features/home/domain/repositories/summary_repository.dart';

import '../entities/check_in_summary_entity.dart';

class GetCheckInSummaryUsecase extends UsecaseNoParam<CheckInSummaryEntity> {
  final SummaryRepository _repository;

  GetCheckInSummaryUsecase(this._repository);

  @override
  Future<Either<CheckInSummaryEntity, Exception>> call() {
    return _repository.getCheckInSummary();
  }
}
