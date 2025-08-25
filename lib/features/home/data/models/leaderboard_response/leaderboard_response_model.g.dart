// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardResponseModel _$LeaderboardResponseModelFromJson(
  Map<String, dynamic> json,
) => _LeaderboardResponseModel(
  points:
      (json['points'] as List<dynamic>)
          .map((e) => LeaderboardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  attendance:
      (json['attendance'] as List<dynamic>)
          .map((e) => LeaderboardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$LeaderboardResponseModelToJson(
  _LeaderboardResponseModel instance,
) => <String, dynamic>{
  'points': instance.points,
  'attendance': instance.attendance,
};
