import 'package:fpdart/fpdart.dart';

import '../../domain/entities/check_in_summary_entity.dart';
import '../../domain/entities/leaderboard_entity.dart';
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
      print('summaryModel: $summaryModel');
      return Left(VocabEntity.fromModel(summaryModel));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Map<String, List<LeaderboardEntity>>, Exception>> getLeaderboard() async {
    try {
      final leaderboardData = await _dataSources.getLeaderboard();
      
      // Convert LeaderboardModel to LeaderboardEntity
      final Map<String, List<LeaderboardEntity>> leaderboard = {};
      
      leaderboardData.forEach((key, value) {
        leaderboard[key] = value.map((model) => LeaderboardEntity.fromModel(model)).toList();
      });
      
      return Left(leaderboard);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
