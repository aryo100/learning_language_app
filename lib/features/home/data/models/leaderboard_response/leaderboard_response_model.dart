import 'package:freezed_annotation/freezed_annotation.dart';

import '../leaderboard/leaderboard_model.dart';

part 'leaderboard_response_model.freezed.dart';
part 'leaderboard_response_model.g.dart';

@freezed
abstract class LeaderboardResponseModel with _$LeaderboardResponseModel {
  factory LeaderboardResponseModel({
    required List<LeaderboardModel> points,
    required List<LeaderboardModel> attendance,
  }) = _LeaderboardResponseModel;

  factory LeaderboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardResponseModelFromJson(json);
}
