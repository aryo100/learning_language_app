import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';

import '../entities/leaderboard_me_entity.dart';
import '../repositories/summary_repository.dart';

class GetLeaderboardMeUsecase extends UsecaseNoParam<LeaderboardMeEntity> {
  GetLeaderboardMeUsecase(this._repository);

  final SummaryRepository _repository;

  @override
  Future<Either<LeaderboardMeEntity, Exception>> call() =>
      _repository.getLeaderboardMe();
}
