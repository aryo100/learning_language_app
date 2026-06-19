class QuizResultArgs {
  const QuizResultArgs({
    required this.correctCount,
    required this.totalQuestions,
    required this.score,
    this.wrongWords = const [],
    this.timeSpentSeconds = 0,
  });

  final int correctCount;
  final int totalQuestions;
  final int score;
  final List<String> wrongWords;
  final int timeSpentSeconds;
}

class PuzzleResultArgs {
  const PuzzleResultArgs({
    required this.word,
    required this.puzzleIndex,
    required this.totalPuzzles,
    required this.scoreDelta,
    required this.isLastPuzzle,
    this.totalScore = 0,
  });

  final String word;
  final int puzzleIndex;
  final int totalPuzzles;
  final int scoreDelta;
  final bool isLastPuzzle;
  final int totalScore;
}

class FlashcardSummaryArgs {
  const FlashcardSummaryArgs({
    required this.knewCount,
    required this.skipCount,
    required this.totalCards,
    this.addedToBagCount = 0,
    this.pointsAwarded = 0,
  });

  final int knewCount;
  final int skipCount;
  final int totalCards;
  final int addedToBagCount;
  final int pointsAwarded;
}
