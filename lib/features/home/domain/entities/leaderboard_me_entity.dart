import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/home/data/models/leaderboard_me/leaderboard_me_model.dart';

class LeaderboardMeEntity extends Equatable {
  const LeaderboardMeEntity({
    required this.pointsRank,
    required this.pointsScore,
    required this.attendanceRank,
    required this.attendanceScore,
  });

  final int pointsRank;
  final int pointsScore;
  final int attendanceRank;
  final int attendanceScore;

  @override
  List<Object?> get props =>
      [pointsRank, pointsScore, attendanceRank, attendanceScore];

  static LeaderboardMeEntity fromModel(LeaderboardMeModel model) {
    return LeaderboardMeEntity(
      pointsRank: model.pointsRank,
      pointsScore: model.pointsScore,
      attendanceRank: model.attendanceRank,
      attendanceScore: model.attendanceScore,
    );
  }
}
