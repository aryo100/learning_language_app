import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_summary_model.freezed.dart';
part 'check_in_summary_model.g.dart';

@freezed
abstract class CheckInSummaryModel with _$CheckInSummaryModel {

  factory CheckInSummaryModel({
    required int totalCheckInsPerWeek,
    required int totalCheckInsPerMonth,
    required DateTime lastCheckInDate,
  }) = _CheckInSummaryModel;

  factory CheckInSummaryModel.fromJson(Map<String, dynamic> json) => _$CheckInSummaryModelFromJson(json);
}