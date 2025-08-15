import 'package:learning_language_app/const/utils/json_loader.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';
import 'package:learning_language_app/features/home/data/models/leaderboard/leaderboard_model.dart';
import 'package:learning_language_app/features/home/data/models/vocab/vocab_model.dart';

abstract interface class SummaryDataSource {
  Future<CheckInSummaryModel> getCheckInSummary();
  Future<VocabModel> getNewWord();
  Future<Map<String, List<LeaderboardModel>>> getLeaderboard();
}

class SummaryDataSourceImpl implements SummaryDataSource {
  @override
  Future<CheckInSummaryModel> getCheckInSummary() async {
    try {
      final result = await JsonLoader.load("assets/data/check_in_summary.json");
      return CheckInSummaryModel.fromJson(result as Map<String, dynamic>);
    } on UnimplementedError {
      rethrow;
    }
  }

  @override
  Future<VocabModel> getNewWord() async {
    try {
      final result = await JsonLoader.load("assets/data/vocab_words.json");
      final vocabList = result as List;
      vocabList.shuffle();
      final randomItem = vocabList.first;
      return VocabModel.fromJson(randomItem as Map<String, dynamic>);
    } on UnimplementedError {
      rethrow;
    }
  }

  @override
  Future<Map<String, List<LeaderboardModel>>> getLeaderboard() async {
    try {
      final result = await JsonLoader.load("assets/data/leaderboard.json");
      final Map<String, dynamic> jsonData = result as Map<String, dynamic>;
      
      final Map<String, List<LeaderboardModel>> leaderboard = {};
      
      // Parse points data
      if (jsonData['points'] != null) {
        final pointsList = jsonData['points'] as List;
        leaderboard['points'] = pointsList
            .map((item) => LeaderboardModel.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      
      // Parse attendance data
      if (jsonData['attendance'] != null) {
        final attendanceList = jsonData['attendance'] as List;
        leaderboard['attendance'] = attendanceList
            .map((item) => LeaderboardModel.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      
      return leaderboard;
    } on UnimplementedError {
      rethrow;
    }
  }
}
