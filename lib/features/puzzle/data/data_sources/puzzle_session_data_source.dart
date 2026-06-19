import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';

import '../models/puzzle_session_models.dart';

abstract final class _PuzzleEndpoints {
  static const sessions = '/puzzle/sessions';

  static String sessionSubmit(String sessionId) =>
      '/puzzle/sessions/$sessionId/submit';
}

abstract interface class PuzzleSessionDataSource {
  Future<PuzzleSessionModel> startSession({
    int questionCount = 6,
    int minWordLength = 4,
    int maxWordLength = 6,
  });
  Future<PuzzleSubmitResultModel> submitAnswer({
    required String sessionId,
    required String answer,
    required int elapsedSeconds,
  });
}

class PuzzleSessionDataSourceImpl extends BaseDataSource
    implements PuzzleSessionDataSource {
  PuzzleSessionDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<PuzzleSessionModel> startSession({
    int questionCount = 6,
    int minWordLength = 4,
    int maxWordLength = 6,
  }) async {
    try {
      final response = await dio.post(
        _PuzzleEndpoints.sessions,
        data: {
          'question_count': questionCount,
          'min_word_length': minWordLength,
          'max_word_length': maxWordLength,
        },
      );
      return PuzzleSessionModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<PuzzleSubmitResultModel> submitAnswer({
    required String sessionId,
    required String answer,
    required int elapsedSeconds,
  }) async {
    try {
      final response = await dio.post(
        _PuzzleEndpoints.sessionSubmit(sessionId),
        data: {
          'answer': answer,
          'elapsed_seconds': elapsedSeconds,
        },
      );
      return PuzzleSubmitResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
