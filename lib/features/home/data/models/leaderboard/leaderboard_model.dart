import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_model.freezed.dart';
part 'leaderboard_model.g.dart';

@freezed
abstract class LeaderboardModel with _$LeaderboardModel {
  factory LeaderboardModel({
    required String id,
    required String name,
    required String photoUrl,
    required int rank,
    required int score,
    required String achievement,
    required DateTime lastActive,
  }) = _LeaderboardModel;

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) => _$LeaderboardModelFromJson(json);
}
