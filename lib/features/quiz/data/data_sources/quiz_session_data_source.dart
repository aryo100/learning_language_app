import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';

import '../models/quiz_session_models.dart';

abstract final class _QuizEndpoints {
  static const sessions = '/quiz/sessions';

  static String sessionAnswers(String sessionId) =>
      '/quiz/sessions/$sessionId/answers';

  static String sessionComplete(String sessionId) =>
      '/quiz/sessions/$sessionId/complete';
}

abstract interface class QuizSessionDataSource {
  Future<QuizSessionModel> startSession({int questionCount = 6});
  Future<QuizAnswerResultModel> submitAnswer({
    required String sessionId,
    required String questionId,
    required int selectedIndex,
    required int elapsedSeconds,
  });
  Future<QuizCompleteResultModel> completeSession(String sessionId);
}

class QuizSessionDataSourceImpl extends BaseDataSource
    implements QuizSessionDataSource {
  QuizSessionDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<QuizSessionModel> startSession({int questionCount = 6}) async {
    try {
      final response = await dio.post(
        _QuizEndpoints.sessions,
        data: {'question_count': questionCount},
      );
      return QuizSessionModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<QuizAnswerResultModel> submitAnswer({
    required String sessionId,
    required String questionId,
    required int selectedIndex,
    required int elapsedSeconds,
  }) async {
    try {
      final response = await dio.post(
        _QuizEndpoints.sessionAnswers(sessionId),
        data: {
          'question_id': questionId,
          'selected_index': selectedIndex,
          'elapsed_seconds': elapsedSeconds,
        },
      );
      return QuizAnswerResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<QuizCompleteResultModel> completeSession(String sessionId) async {
    try {
      final response = await dio.post(
        _QuizEndpoints.sessionComplete(sessionId),
      );
      return QuizCompleteResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
