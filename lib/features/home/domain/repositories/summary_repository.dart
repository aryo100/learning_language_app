import 'package:fpdart/fpdart.dart';

import '../entities/check_in_result_entity.dart';
import '../entities/check_in_summary_entity.dart';
import '../entities/leaderboard_me_entity.dart';
import '../entities/leaderboard_response_entity.dart';
import '../entities/vocab_entity.dart';

abstract class SummaryRepository {
  Future<Either<CheckInSummaryEntity, Exception>> getCheckInSummary();
  Future<Either<CheckInResultEntity, Exception>> postCheckIn();
  Future<Either<VocabEntity, Exception>> getNewWord();
  Future<Either<LeaderboardResponseEntity, Exception>> getLeaderboard();
  Future<Either<LeaderboardMeEntity, Exception>> getLeaderboardMe();
}
