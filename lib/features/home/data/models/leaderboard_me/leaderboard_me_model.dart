import 'package:learning_language_app/core/api/json_helpers.dart';

class LeaderboardMeModel {
  const LeaderboardMeModel({
    required this.pointsRank,
    required this.pointsScore,
    required this.attendanceRank,
    required this.attendanceScore,
  });

  final int pointsRank;
  final int pointsScore;
  final int attendanceRank;
  final int attendanceScore;

  factory LeaderboardMeModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardMeModel(
      pointsRank: jsonInt(json, 'points_rank', 'pointsRank'),
      pointsScore: jsonInt(json, 'points_score', 'pointsScore'),
      attendanceRank: jsonInt(json, 'attendance_rank', 'attendanceRank'),
      attendanceScore: jsonInt(json, 'attendance_score', 'attendanceScore'),
    );
  }
}
