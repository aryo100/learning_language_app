// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInSummaryModel _$CheckInSummaryModelFromJson(Map<String, dynamic> json) =>
    _CheckInSummaryModel(
      totalCheckInsPerWeek: (json['totalCheckInsPerWeek'] as num).toInt(),
      totalCheckInsPerMonth: (json['totalCheckInsPerMonth'] as num).toInt(),
      lastCheckInDate: DateTime.parse(json['lastCheckInDate'] as String),
      canCheckInToday: json['canCheckInToday'] as bool? ?? true,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      pointsPerCheckIn: (json['pointsPerCheckIn'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$CheckInSummaryModelToJson(
  _CheckInSummaryModel instance,
) => <String, dynamic>{
  'totalCheckInsPerWeek': instance.totalCheckInsPerWeek,
  'totalCheckInsPerMonth': instance.totalCheckInsPerMonth,
  'lastCheckInDate': instance.lastCheckInDate.toIso8601String(),
  'canCheckInToday': instance.canCheckInToday,
  'streakDays': instance.streakDays,
  'pointsPerCheckIn': instance.pointsPerCheckIn,
};
