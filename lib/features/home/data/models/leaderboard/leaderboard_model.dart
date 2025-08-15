import 'package:learning_language_app/features/home/domain/entities/leaderboard_entity.dart';

class LeaderboardModel extends LeaderboardEntity {
  const LeaderboardModel({
    required super.id,
    required super.name,
    required super.photoUrl,
    required super.rank,
    required super.score,
    required super.achievement,
    required super.lastActive,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      rank: json['rank'] as int,
      score: json['score'] as int,
      achievement: json['achievement'] as String,
      lastActive: DateTime.parse(json['lastActive'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'rank': rank,
      'score': score,
      'achievement': achievement,
      'lastActive': lastActive.toIso8601String(),
    };
  }
}
