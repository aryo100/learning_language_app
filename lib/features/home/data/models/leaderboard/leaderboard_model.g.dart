// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardModel _$LeaderboardModelFromJson(Map<String, dynamic> json) =>
    _LeaderboardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      rank: (json['rank'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      achievement: json['achievement'] as String,
      lastActive: DateTime.parse(json['lastActive'] as String),
    );

Map<String, dynamic> _$LeaderboardModelToJson(_LeaderboardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'rank': instance.rank,
      'score': instance.score,
      'achievement': instance.achievement,
      'lastActive': instance.lastActive.toIso8601String(),
    };
