import 'package:learning_language_app/core/api/json_helpers.dart';

class FlashcardCardModel {
  const FlashcardCardModel({
    required this.wordId,
    required this.word,
    required this.type,
    required this.definition,
    required this.example,
  });

  final String wordId;
  final String word;
  final String type;
  final String definition;
  final String example;

  factory FlashcardCardModel.fromJson(Map<String, dynamic> json) {
    return FlashcardCardModel(
      wordId: jsonString(json, 'word_id', 'wordId'),
      word: jsonString(json, 'word', 'word'),
      type: jsonString(json, 'type', 'type'),
      definition: jsonString(json, 'definition', 'definition'),
      example: jsonString(json, 'example', 'example'),
    );
  }
}

class FlashcardSessionModel {
  const FlashcardSessionModel({
    required this.sessionId,
    required this.pointsPerKnew,
    required this.cards,
    required this.currentIndex,
  });

  final String sessionId;
  final int pointsPerKnew;
  final List<FlashcardCardModel> cards;
  final int currentIndex;

  factory FlashcardSessionModel.fromJson(Map<String, dynamic> json) {
    return FlashcardSessionModel(
      sessionId: jsonString(json, 'session_id', 'sessionId'),
      pointsPerKnew:
          jsonInt(json, 'points_per_knew', 'pointsPerKnew', fallback: 5),
      cards: jsonList(json, 'cards', 'cards')
          .map((e) => FlashcardCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentIndex: jsonInt(json, 'current_index', 'currentIndex'),
    );
  }
}

class FlashcardSessionSummaryModel {
  const FlashcardSessionSummaryModel({
    required this.knewCount,
    required this.skipCount,
    required this.pointsAwarded,
    required this.profilePoint,
  });

  final int knewCount;
  final int skipCount;
  final int pointsAwarded;
  final int profilePoint;

  factory FlashcardSessionSummaryModel.fromJson(Map<String, dynamic> json) {
    return FlashcardSessionSummaryModel(
      knewCount: jsonInt(json, 'knew_count', 'knewCount'),
      skipCount: jsonInt(json, 'skip_count', 'skipCount'),
      pointsAwarded: jsonInt(json, 'points_awarded', 'pointsAwarded'),
      profilePoint: jsonInt(json, 'profile_point', 'profilePoint'),
    );
  }
}

class FlashcardReviewResultModel {
  const FlashcardReviewResultModel({
    required this.pointsEarned,
    required this.profilePoint,
    required this.nextIndex,
    required this.sessionComplete,
    this.sessionSummary,
  });

  final int pointsEarned;
  final int profilePoint;
  final int nextIndex;
  final bool sessionComplete;
  final FlashcardSessionSummaryModel? sessionSummary;

  factory FlashcardReviewResultModel.fromJson(Map<String, dynamic> json) {
    final summary = jsonMap(json, 'session_summary', 'sessionSummary');
    return FlashcardReviewResultModel(
      pointsEarned: jsonInt(json, 'points_earned', 'pointsEarned'),
      profilePoint: jsonInt(json, 'profile_point', 'profilePoint'),
      nextIndex: jsonInt(json, 'next_index', 'nextIndex'),
      sessionComplete: jsonBool(json, 'session_complete', 'sessionComplete'),
      sessionSummary: summary.isEmpty
          ? null
          : FlashcardSessionSummaryModel.fromJson(summary),
    );
  }
}
