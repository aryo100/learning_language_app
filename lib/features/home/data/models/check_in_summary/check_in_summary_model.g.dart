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
    );

Map<String, dynamic> _$CheckInSummaryModelToJson(
  _CheckInSummaryModel instance,
) => <String, dynamic>{
  'totalCheckInsPerWeek': instance.totalCheckInsPerWeek,
  'totalCheckInsPerMonth': instance.totalCheckInsPerMonth,
  'lastCheckInDate': instance.lastCheckInDate.toIso8601String(),
};
