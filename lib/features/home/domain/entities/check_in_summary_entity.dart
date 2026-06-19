import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';

class CheckInSummaryEntity extends Equatable {
  final int totalCheckInsPerWeek;
  final int totalCheckInsPerMonth;
  final DateTime lastCheckInDate;
  final bool canCheckInToday;
  final int streakDays;
  final int pointsPerCheckIn;

  const CheckInSummaryEntity({
    required this.totalCheckInsPerWeek,
    required this.totalCheckInsPerMonth,
    required this.lastCheckInDate,
    this.canCheckInToday = true,
    this.streakDays = 0,
    this.pointsPerCheckIn = 10,
  });

  @override
  List<Object?> get props => [
        totalCheckInsPerWeek,
        totalCheckInsPerMonth,
        lastCheckInDate,
        canCheckInToday,
        streakDays,
        pointsPerCheckIn,
      ];

  CheckInSummaryEntity copyWith({
    int? totalCheckInsPerWeek,
    int? totalCheckInsPerMonth,
    DateTime? lastCheckInDate,
    bool? canCheckInToday,
    int? streakDays,
    int? pointsPerCheckIn,
  }) {
    return CheckInSummaryEntity(
      totalCheckInsPerWeek:
          totalCheckInsPerWeek ?? this.totalCheckInsPerWeek,
      totalCheckInsPerMonth:
          totalCheckInsPerMonth ?? this.totalCheckInsPerMonth,
      lastCheckInDate: lastCheckInDate ?? this.lastCheckInDate,
      canCheckInToday: canCheckInToday ?? this.canCheckInToday,
      streakDays: streakDays ?? this.streakDays,
      pointsPerCheckIn: pointsPerCheckIn ?? this.pointsPerCheckIn,
    );
  }

  static CheckInSummaryEntity fromModel(CheckInSummaryModel model) {
    return CheckInSummaryEntity(
      totalCheckInsPerWeek: model.totalCheckInsPerWeek,
      totalCheckInsPerMonth: model.totalCheckInsPerMonth,
      lastCheckInDate: model.lastCheckInDate,
      canCheckInToday: model.canCheckInToday,
      streakDays: model.streakDays,
      pointsPerCheckIn: model.pointsPerCheckIn,
    );
  }
}
