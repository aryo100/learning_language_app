import 'package:learning_language_app/core/api/json_helpers.dart';

class PuzzleDataModel {
  const PuzzleDataModel({
    required this.wordId,
    required this.answerLength,
    required this.letterGrid,
  });

  final String wordId;
  final int answerLength;
  final List<String> letterGrid;

  factory PuzzleDataModel.fromJson(Map<String, dynamic> json) {
    return PuzzleDataModel(
      wordId: jsonString(json, 'word_id', 'wordId'),
      answerLength: jsonInt(json, 'answer_length', 'answerLength'),
      letterGrid: jsonList(json, 'letter_grid', 'letterGrid').cast<String>(),
    );
  }
}

class PuzzleSessionModel {
  const PuzzleSessionModel({
    required this.sessionId,
    required this.currentIndex,
    required this.totalQuestions,
    required this.pointsPerWord,
    required this.puzzle,
  });

  final String sessionId;
  final int currentIndex;
  final int totalQuestions;
  final int pointsPerWord;
  final PuzzleDataModel puzzle;

  factory PuzzleSessionModel.fromJson(Map<String, dynamic> json) {
    return PuzzleSessionModel(
      sessionId: jsonString(json, 'session_id', 'sessionId'),
      currentIndex: jsonInt(json, 'current_index', 'currentIndex', fallback: 1),
      totalQuestions:
          jsonInt(json, 'total_questions', 'totalQuestions', fallback: 6),
      pointsPerWord:
          jsonInt(json, 'points_per_word', 'pointsPerWord', fallback: 15),
      puzzle: PuzzleDataModel.fromJson(
        jsonMap(json, 'puzzle', 'puzzle'),
      ),
    );
  }
}

class PuzzleSubmitResultModel {
  const PuzzleSubmitResultModel({
    required this.correct,
    required this.pointsEarned,
    required this.profilePoint,
    required this.scoreDelta,
    required this.totalScore,
    required this.completed,
    this.nextPuzzle,
    this.pointsAwarded,
  });

  final bool correct;
  final int pointsEarned;
  final int profilePoint;
  final int scoreDelta;
  final int totalScore;
  final bool completed;
  final PuzzleDataModel? nextPuzzle;
  final int? pointsAwarded;

  factory PuzzleSubmitResultModel.fromJson(Map<String, dynamic> json) {
    final next = jsonMap(json, 'next_puzzle', 'nextPuzzle');
    return PuzzleSubmitResultModel(
      correct: jsonBool(json, 'correct', 'correct'),
      pointsEarned: jsonInt(json, 'points_earned', 'pointsEarned'),
      profilePoint: jsonInt(json, 'profile_point', 'profilePoint'),
      scoreDelta: jsonInt(json, 'score_delta', 'scoreDelta'),
      totalScore: jsonInt(json, 'total_score', 'totalScore'),
      completed: jsonBool(json, 'completed', 'completed'),
      nextPuzzle: next.isEmpty ? null : PuzzleDataModel.fromJson(next),
      pointsAwarded: jsonField<int>(json, 'points_awarded', 'pointsAwarded'),
    );
  }
}
