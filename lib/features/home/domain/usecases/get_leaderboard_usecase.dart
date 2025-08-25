import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/leaderboard_response_entity.dart';
import '../repositories/summary_repository.dart';

class GetLeaderboardUsecase extends UsecaseNoParam<LeaderboardResponseEntity> {
  final SummaryRepository _repository;

  GetLeaderboardUsecase(this._repository);

  @override
  Future<Either<LeaderboardResponseEntity, Exception>> call() {
    return _repository.getLeaderboard();
  }
}
