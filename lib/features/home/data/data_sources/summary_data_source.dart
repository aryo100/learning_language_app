import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';
import 'package:learning_language_app/features/home/data/models/vocab/vocab_model.dart';

import '../models/leaderboard_response/leaderboard_response_model.dart';

abstract interface class SummaryDataSource {
  Future<CheckInSummaryModel> getCheckInSummary();
  Future<VocabModel> getNewWord();
  Future<LeaderboardResponseModel> getLeaderboard();
}

class SummaryDataSourceImpl extends BaseDataSource
    implements SummaryDataSource {
  SummaryDataSourceImpl() : super(networkDio);

  @override
  Future<CheckInSummaryModel> getCheckInSummary() async {
    try {
      final response = await dio.get(NetworkConstants.checkIn);
      return CheckInSummaryModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on UnimplementedError {
      rethrow;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<VocabModel> getNewWord() async {
    try {
      final response = await dio.get(NetworkConstants.vocab);
      final vocabList = response.data as List;
      vocabList.shuffle();
      final randomItem = vocabList.first;
      return VocabModel.fromJson(randomItem as Map<String, dynamic>);
    } on UnimplementedError {
      rethrow;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<LeaderboardResponseModel> getLeaderboard() async {
    try {
      final response = await dio.get(NetworkConstants.leaderboard);
      return LeaderboardResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on UnimplementedError {
      rethrow;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
