import 'package:learning_language_app/core/api/json_helpers.dart';

class PointsRuleCheckInModel {
  const PointsRuleCheckInModel({required this.points, required this.maxPerDay});

  final int points;
  final int maxPerDay;

  factory PointsRuleCheckInModel.fromJson(Map<String, dynamic> json) {
    return PointsRuleCheckInModel(
      points: jsonInt(json, 'points', 'points', fallback: 10),
      maxPerDay: jsonInt(json, 'max_per_day', 'maxPerDay', fallback: 1),
    );
  }
}

class PointsRuleQuizModel {
  const PointsRuleQuizModel({
    required this.pointsPerCorrect,
    required this.questionCount,
  });

  final int pointsPerCorrect;
  final int questionCount;

  factory PointsRuleQuizModel.fromJson(Map<String, dynamic> json) {
    return PointsRuleQuizModel(
      pointsPerCorrect:
          jsonInt(json, 'points_per_correct', 'pointsPerCorrect', fallback: 10),
      questionCount:
          jsonInt(json, 'question_count', 'questionCount', fallback: 6),
    );
  }
}

class PointsRulePuzzleModel {
  const PointsRulePuzzleModel({
    required this.pointsPerWord,
    required this.questionCount,
  });

  final int pointsPerWord;
  final int questionCount;

  factory PointsRulePuzzleModel.fromJson(Map<String, dynamic> json) {
    return PointsRulePuzzleModel(
      pointsPerWord:
          jsonInt(json, 'points_per_word', 'pointsPerWord', fallback: 15),
      questionCount:
          jsonInt(json, 'question_count', 'questionCount', fallback: 6),
    );
  }
}

class PointsRuleFlashcardModel {
  const PointsRuleFlashcardModel({
    required this.deckSize,
    required this.pointsPerKnew,
    required this.pointsPerSkip,
  });

  final int deckSize;
  final int pointsPerKnew;
  final int pointsPerSkip;

  factory PointsRuleFlashcardModel.fromJson(Map<String, dynamic> json) {
    return PointsRuleFlashcardModel(
      deckSize: jsonInt(json, 'deck_size', 'deckSize', fallback: 10),
      pointsPerKnew:
          jsonInt(json, 'points_per_knew', 'pointsPerKnew', fallback: 5),
      pointsPerSkip:
          jsonInt(json, 'points_per_skip', 'pointsPerSkip'),
    );
  }
}

class PointsRulesModel {
  const PointsRulesModel({
    required this.checkIn,
    required this.quiz,
    required this.puzzle,
    required this.flashcard,
  });

  final PointsRuleCheckInModel checkIn;
  final PointsRuleQuizModel quiz;
  final PointsRulePuzzleModel puzzle;
  final PointsRuleFlashcardModel flashcard;

  factory PointsRulesModel.fromJson(Map<String, dynamic> json) {
    return PointsRulesModel(
      checkIn: PointsRuleCheckInModel.fromJson(
        jsonMap(json, 'check_in', 'checkIn'),
      ),
      quiz: PointsRuleQuizModel.fromJson(jsonMap(json, 'quiz', 'quiz')),
      puzzle: PointsRulePuzzleModel.fromJson(jsonMap(json, 'puzzle', 'puzzle')),
      flashcard: PointsRuleFlashcardModel.fromJson(
        jsonMap(json, 'flashcard', 'flashcard'),
      ),
    );
  }
}

class PointTransactionModel {
  const PointTransactionModel({
    required this.id,
    required this.source,
    required this.amount,
    required this.description,
    required this.createdAt,
  });

  final String id;
  final String source;
  final int amount;
  final String description;
  final DateTime createdAt;

  factory PointTransactionModel.fromJson(Map<String, dynamic> json) {
    return PointTransactionModel(
      id: jsonString(json, 'id', 'id'),
      source: jsonString(json, 'source', 'source'),
      amount: jsonInt(json, 'amount', 'amount'),
      description: jsonString(json, 'description', 'description'),
      createdAt: DateTime.parse(
        jsonString(json, 'created_at', 'createdAt'),
      ),
    );
  }

  String get sourceLabel {
    switch (source) {
      case 'check_in':
        return 'Check-in';
      case 'quiz_answer':
        return 'Quiz';
      case 'quiz_complete':
        return 'Quiz bonus';
      case 'puzzle_word':
        return 'Puzzle';
      case 'flashcard_knew':
        return 'Flashcard';
      case 'flashcard_skip':
        return 'Flashcard skip';
      case 'admin_adjustment':
        return 'Adjustment';
      default:
        return source;
    }
  }
}

class PointsHistoryModel {
  const PointsHistoryModel({
    required this.items,
    required this.total,
  });

  final List<PointTransactionModel> items;
  final int total;

  factory PointsHistoryModel.fromJson(Map<String, dynamic> json) {
    return PointsHistoryModel(
      items: jsonList(json, 'items', 'items')
          .map((e) => PointTransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: jsonInt(json, 'total', 'total'),
    );
  }
}
