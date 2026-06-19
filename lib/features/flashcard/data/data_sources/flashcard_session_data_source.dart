import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';

import '../models/flashcard_session_models.dart';

abstract final class _FlashcardEndpoints {
  static const sessions = '/flashcard/sessions';

  static String sessionReview(String sessionId) =>
      '/flashcard/sessions/$sessionId/review';
}

abstract interface class FlashcardSessionDataSource {
  Future<FlashcardSessionModel> startSession({
    int deckSize = 10,
    String source = 'random',
  });
  Future<FlashcardReviewResultModel> reviewCard({
    required String sessionId,
    required String wordId,
    required String result,
  });
}

class FlashcardSessionDataSourceImpl extends BaseDataSource
    implements FlashcardSessionDataSource {
  FlashcardSessionDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<FlashcardSessionModel> startSession({
    int deckSize = 10,
    String source = 'random',
  }) async {
    try {
      final response = await dio.post(
        _FlashcardEndpoints.sessions,
        data: {
          'deck_size': deckSize,
          'source': source,
        },
      );
      return FlashcardSessionModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<FlashcardReviewResultModel> reviewCard({
    required String sessionId,
    required String wordId,
    required String result,
  }) async {
    try {
      final response = await dio.post(
        _FlashcardEndpoints.sessionReview(sessionId),
        data: {
          'word_id': wordId,
          'result': result,
        },
      );
      return FlashcardReviewResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
