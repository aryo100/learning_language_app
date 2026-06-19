import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/home/data/models/check_in_result/check_in_result_model.dart';
import 'package:learning_language_app/features/home/domain/entities/check_in_summary_entity.dart';

class CheckInResultEntity extends Equatable {
  const CheckInResultEntity({
    required this.pointsEarned,
    required this.profilePoint,
    required this.streakDays,
    required this.summary,
  });

  final int pointsEarned;
  final int profilePoint;
  final int streakDays;
  final CheckInSummaryEntity summary;

  @override
  List<Object?> get props =>
      [pointsEarned, profilePoint, streakDays, summary];

  static CheckInResultEntity fromModel(CheckInResultModel model) {
    return CheckInResultEntity(
      pointsEarned: model.pointsEarned,
      profilePoint: model.profilePoint,
      streakDays: model.streakDays,
      summary: CheckInSummaryEntity.fromModel(model.summary),
    );
  }
}
