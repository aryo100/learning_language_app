import '../../data/models/leaderboard_response/leaderboard_response_model.dart';
import 'leaderboard_entity.dart';

class LeaderboardResponseEntity {
  final List<LeaderboardEntity> points;
  final List<LeaderboardEntity> attendance;

  const LeaderboardResponseEntity({
    required this.points,
    required this.attendance,
  });

  factory LeaderboardResponseEntity.fromModel(LeaderboardResponseModel model) {
    return LeaderboardResponseEntity(
      points:
          model.points
              .map((e) => LeaderboardEntity.fromModel(e))
              .toList(),
      attendance:
          model.attendance
              .map((e) => LeaderboardEntity.fromModel(e))
              .toList(),
    );
  }
}
