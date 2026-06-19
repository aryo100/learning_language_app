import 'package:learning_language_app/core/api/json_helpers.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';

class CheckInResultModel {
  const CheckInResultModel({
    required this.pointsEarned,
    required this.profilePoint,
    required this.streakDays,
    required this.summary,
  });

  final int pointsEarned;
  final int profilePoint;
  final int streakDays;
  final CheckInSummaryModel summary;

  factory CheckInResultModel.fromJson(Map<String, dynamic> json) {
    return CheckInResultModel(
      pointsEarned: jsonInt(json, 'points_earned', 'pointsEarned'),
      profilePoint: jsonInt(json, 'profile_point', 'profilePoint'),
      streakDays: jsonInt(json, 'streak_days', 'streakDays'),
      summary: CheckInSummaryModel.fromJson(
        jsonMap(json, 'summary', 'summary').isNotEmpty
            ? jsonMap(json, 'summary', 'summary')
            : json,
      ),
    );
  }
}
