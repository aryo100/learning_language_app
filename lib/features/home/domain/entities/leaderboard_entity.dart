import '../../data/models/leaderboard/leaderboard_model.dart';

class LeaderboardEntity {
  final String id;
  final String name;
  final String photoUrl;
  final int rank;
  final int score;
  final String achievement;
  final DateTime lastActive;

  const LeaderboardEntity({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.rank,
    required this.score,
    required this.achievement,
    required this.lastActive,
  });

  factory LeaderboardEntity.fromModel(LeaderboardModel model) {
    return LeaderboardEntity(
      id: model.id,
      name: model.name,
      photoUrl: model.photoUrl,
      rank: model.rank,
      score: model.score,
      achievement: model.achievement,
      lastActive: model.lastActive,
    );
  }
}
