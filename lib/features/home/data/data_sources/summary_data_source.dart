import 'dart:math';

import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/core/api/json_helpers.dart';
import 'package:learning_language_app/features/home/data/models/check_in_result/check_in_result_model.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';
import 'package:learning_language_app/features/home/data/models/vocab/vocab_model.dart';

import '../models/leaderboard_me/leaderboard_me_model.dart';
import '../models/leaderboard_response/leaderboard_response_model.dart';

abstract final class _SummaryEndpoints {
  static const checkIn = '/checkin';
  static const vocabDaily = '/vocab/daily';
  static const vocab = '/vocab';
  static const leaderboard = '/leaderboard';
  static const leaderboardMe = '/leaderboard/me';
}

abstract interface class SummaryDataSource {
  Future<CheckInSummaryModel> getCheckInSummary();
  Future<CheckInResultModel> postCheckIn();
  Future<VocabModel> getNewWord();
  Future<LeaderboardResponseModel> getLeaderboard();
  Future<LeaderboardMeModel> getLeaderboardMe();
}

class SummaryDataSourceImpl extends BaseDataSource
    implements SummaryDataSource {
  SummaryDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<CheckInSummaryModel> getCheckInSummary() async {
    try {
      final response = await dio.get(_SummaryEndpoints.checkIn);
      return CheckInSummaryModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<CheckInResultModel> postCheckIn() async {
    try {
      final response =
          await dio.post(_SummaryEndpoints.checkIn, data: {});
      return CheckInResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<VocabModel> getNewWord() async {
    try {
      final response = await dio.get(_SummaryEndpoints.vocabDaily);
      final data = response.data as Map<String, dynamic>;
      final wordJson = jsonMap(data, 'word', 'word');
      if (wordJson.isNotEmpty) {
        return VocabModel.fromJson(wordJson);
      }
      return VocabModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return _getRandomVocabFallback();
      }
      throw handleNetworkError(e);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  Future<VocabModel> _getRandomVocabFallback() async {
    final metaResponse = await dio.get(
      _SummaryEndpoints.vocab,
      queryParameters: {'limit': 1},
    );
    final total =
        (metaResponse.data as Map<String, dynamic>)['total'] as int? ?? 0;
    if (total == 0) {
      throw Exception('No vocabulary words available');
    }

    final offset = Random().nextInt(total);
    final response = await dio.get(
      _SummaryEndpoints.vocab,
      queryParameters: {'limit': 1, 'offset': offset},
    );
    final items =
        (response.data as Map<String, dynamic>)['items'] as List<dynamic>;
    if (items.isEmpty) {
      throw Exception('No vocabulary words available');
    }

    return VocabModel.fromJson(items.first as Map<String, dynamic>);
  }

  @override
  Future<LeaderboardResponseModel> getLeaderboard() async {
    try {
      final response = await dio.get(_SummaryEndpoints.leaderboard);
      return LeaderboardResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<LeaderboardMeModel> getLeaderboardMe() async {
    try {
      final response = await dio.get(_SummaryEndpoints.leaderboardMe);
      return LeaderboardMeModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
