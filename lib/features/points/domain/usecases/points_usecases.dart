import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../entities/points_entities.dart';
import '../repositories/points_repository.dart';

class GetPointsRulesUsecase extends UsecaseNoParam<PointsRulesEntity> {
  GetPointsRulesUsecase(this._repository);

  final PointsRepository _repository;

  @override
  Future<Either<PointsRulesEntity, Exception>> call() => _repository.getRules();
}

class GetPointsHistoryUsecase
    implements Usecase<PointsHistoryEntity, GetPointsHistoryParams> {
  GetPointsHistoryUsecase(this._repository);

  final PointsRepository _repository;

  @override
  Future<Either<PointsHistoryEntity, Exception>> call(
    GetPointsHistoryParams params,
  ) =>
      _repository.getHistory(
        limit: params.limit,
        offset: params.offset,
        source: params.source,
      );
}

class GetPointsHistoryParams {
  const GetPointsHistoryParams({
    this.limit = 20,
    this.offset = 0,
    this.source,
  });

  final int limit;
  final int offset;
  final String? source;
}
