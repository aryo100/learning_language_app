import 'package:fpdart/fpdart.dart';
import 'package:learning_language_app/const/usecases/usecase.dart';
import '../entities/leaderboard_entity.dart';
import '../repositories/summary_repository.dart';

class GetLeaderboardUsecase
    extends UsecaseNoParam<Map<String, List<LeaderboardEntity>>> {
  final SummaryRepository _repository;

  GetLeaderboardUsecase(this._repository);

  @override
  Future<Either<Map<String, List<LeaderboardEntity>>, Exception>> call() {
    return _repository.getLeaderboard();
  }
}
