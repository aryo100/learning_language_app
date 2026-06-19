import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/points/data/models/points_models.dart';

class PointsRulesEntity extends Equatable {
  const PointsRulesEntity({
    required this.checkInPoints,
    required this.quizPointsPerCorrect,
    required this.quizQuestionCount,
    required this.puzzlePointsPerWord,
    required this.flashcardPointsPerKnew,
    required this.flashcardDeckSize,
  });

  final int checkInPoints;
  final int quizPointsPerCorrect;
  final int quizQuestionCount;
  final int puzzlePointsPerWord;
  final int flashcardPointsPerKnew;
  final int flashcardDeckSize;

  @override
  List<Object?> get props => [
        checkInPoints,
        quizPointsPerCorrect,
        quizQuestionCount,
        puzzlePointsPerWord,
        flashcardPointsPerKnew,
        flashcardDeckSize,
      ];

  static PointsRulesEntity fromModel(PointsRulesModel model) {
    return PointsRulesEntity(
      checkInPoints: model.checkIn.points,
      quizPointsPerCorrect: model.quiz.pointsPerCorrect,
      quizQuestionCount: model.quiz.questionCount,
      puzzlePointsPerWord: model.puzzle.pointsPerWord,
      flashcardPointsPerKnew: model.flashcard.pointsPerKnew,
      flashcardDeckSize: model.flashcard.deckSize,
    );
  }
}

class PointTransactionEntity extends Equatable {
  const PointTransactionEntity({
    required this.id,
    required this.source,
    required this.amount,
    required this.description,
    required this.createdAt,
    required this.sourceLabel,
  });

  final String id;
  final String source;
  final int amount;
  final String description;
  final DateTime createdAt;
  final String sourceLabel;

  @override
  List<Object?> get props => [id, source, amount, description, createdAt];

  static PointTransactionEntity fromModel(PointTransactionModel model) {
    return PointTransactionEntity(
      id: model.id,
      source: model.source,
      amount: model.amount,
      description: model.description,
      createdAt: model.createdAt,
      sourceLabel: model.sourceLabel,
    );
  }
}

class PointsHistoryEntity extends Equatable {
  const PointsHistoryEntity({
    required this.items,
    required this.total,
  });

  final List<PointTransactionEntity> items;
  final int total;

  @override
  List<Object?> get props => [items, total];

  static PointsHistoryEntity fromModel(PointsHistoryModel model) {
    return PointsHistoryEntity(
      items: model.items.map(PointTransactionEntity.fromModel).toList(),
      total: model.total,
    );
  }
}
