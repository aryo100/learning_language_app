import 'dart:math';

import 'package:dio/dio.dart';
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
  SummaryDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<CheckInSummaryModel> getCheckInSummary() async {
    try {
      final response = await dio.get(NetworkConstants.checkIn);
      return CheckInSummaryModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<VocabModel> getNewWord() async {
    try {
      final metaResponse = await dio.get(
        NetworkConstants.vocab,
        queryParameters: {'limit': 1},
      );
      final total =
          (metaResponse.data as Map<String, dynamic>)['total'] as int? ?? 0;
      if (total == 0) {
        throw Exception('No vocabulary words available');
      }

      final offset = Random().nextInt(total);
      final response = await dio.get(
        NetworkConstants.vocab,
        queryParameters: {'limit': 1, 'offset': offset},
      );
      final items =
          (response.data as Map<String, dynamic>)['items'] as List<dynamic>;
      if (items.isEmpty) {
        throw Exception('No vocabulary words available');
      }

      return VocabModel.fromJson(items.first as Map<String, dynamic>);
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
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
