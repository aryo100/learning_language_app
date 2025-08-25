import 'package:fpdart/fpdart.dart';

import '../../domain/entities/check_in_summary_entity.dart';
import '../../domain/entities/leaderboard_response_entity.dart';
import '../../domain/entities/vocab_entity.dart';
import '../../domain/repositories/summary_repository.dart';
import '../data_sources/summary_data_source.dart';

class SummaryRepositoryImpl implements SummaryRepository {
  final SummaryDataSource _dataSources;

  SummaryRepositoryImpl(this._dataSources);

  @override
  Future<Either<CheckInSummaryEntity, Exception>> getCheckInSummary() async {
    try {
      final summaryModel = await _dataSources.getCheckInSummary();
      return Left(CheckInSummaryEntity.fromModel(summaryModel));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
  
  @override
  Future<Either<VocabEntity, Exception>> getNewWord() async {
    try {
      final summaryModel = await _dataSources.getNewWord();
      return Left(VocabEntity.fromModel(summaryModel));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<LeaderboardResponseEntity, Exception>> getLeaderboard() async {
    try {
      final leaderboardModel = await _dataSources.getLeaderboard();

      return Left(LeaderboardResponseEntity.fromModel(leaderboardModel));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
