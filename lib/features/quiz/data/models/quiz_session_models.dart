import 'package:learning_language_app/core/api/json_helpers.dart';

class QuizQuestionModel {
  const QuizQuestionModel({
    required this.id,
    required this.wordId,
    required this.type,
    required this.prompt,
    required this.options,
  });

  final String id;
  final String wordId;
  final String type;
  final String prompt;
  final List<String> options;

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionModel(
      id: jsonString(json, 'id', 'id'),
      wordId: jsonString(json, 'word_id', 'wordId'),
      type: jsonString(json, 'type', 'type'),
      prompt: jsonString(json, 'prompt', 'prompt'),
      options: jsonList(json, 'options', 'options').cast<String>(),
    );
  }
}

class QuizSessionModel {
  const QuizSessionModel({
    required this.sessionId,
    required this.pointsPerCorrect,
    required this.questions,
  });

  final String sessionId;
  final int pointsPerCorrect;
  final List<QuizQuestionModel> questions;

  factory QuizSessionModel.fromJson(Map<String, dynamic> json) {
    return QuizSessionModel(
      sessionId: jsonString(json, 'session_id', 'sessionId'),
      pointsPerCorrect:
          jsonInt(json, 'points_per_correct', 'pointsPerCorrect', fallback: 10),
      questions: jsonList(json, 'questions', 'questions')
          .map((e) => QuizQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class QuizAnswerResultModel {
  const QuizAnswerResultModel({
    required this.correct,
    required this.pointsEarned,
    required this.runningScore,
    required this.profilePoint,
  });

  final bool correct;
  final int pointsEarned;
  final int runningScore;
  final int profilePoint;

  factory QuizAnswerResultModel.fromJson(Map<String, dynamic> json) {
    return QuizAnswerResultModel(
      correct: jsonBool(json, 'correct', 'correct'),
      pointsEarned: jsonInt(json, 'points_earned', 'pointsEarned'),
      runningScore: jsonInt(json, 'running_score', 'runningScore'),
      profilePoint: jsonInt(json, 'profile_point', 'profilePoint'),
    );
  }
}

class QuizCompleteResultModel {
  const QuizCompleteResultModel({
    required this.sessionId,
    required this.correctCount,
    required this.questionCount,
    required this.score,
    required this.pointsAwarded,
    required this.profilePoint,
  });

  final String sessionId;
  final int correctCount;
  final int questionCount;
  final int score;
  final int pointsAwarded;
  final int profilePoint;

  factory QuizCompleteResultModel.fromJson(Map<String, dynamic> json) {
    return QuizCompleteResultModel(
      sessionId: jsonString(json, 'session_id', 'sessionId'),
      correctCount: jsonInt(json, 'correct_count', 'correctCount'),
      questionCount: jsonInt(json, 'question_count', 'questionCount'),
      score: jsonInt(json, 'score', 'score'),
      pointsAwarded: jsonInt(json, 'points_awarded', 'pointsAwarded'),
      profilePoint: jsonInt(json, 'profile_point', 'profilePoint'),
    );
  }
}
