import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';

class CheckInSummaryEntity extends Equatable {
  final int totalCheckInsPerWeek;
  final int totalCheckInsPerMonth;
  final DateTime lastCheckInDate;

  const CheckInSummaryEntity({
    required this.totalCheckInsPerWeek,
    required this.totalCheckInsPerMonth,
    required this.lastCheckInDate,
  });

  @override
  List<Object?> get props => [
    totalCheckInsPerWeek,
    totalCheckInsPerMonth,
    lastCheckInDate,
  ];

  copyWith({
    int? totalCheckInsPerWeek,
    int? totalCheckInsPerMonth,
    DateTime? lastCheckInDate,
  }) {
    return CheckInSummaryEntity(
      totalCheckInsPerWeek: totalCheckInsPerWeek ?? this.totalCheckInsPerWeek,
      totalCheckInsPerMonth: totalCheckInsPerMonth ?? this.totalCheckInsPerMonth,
      lastCheckInDate: lastCheckInDate ?? this.lastCheckInDate,
    );
  }

  static CheckInSummaryEntity fromModel(CheckInSummaryModel model) {
    return CheckInSummaryEntity(
      totalCheckInsPerWeek: model.totalCheckInsPerWeek,
      totalCheckInsPerMonth: model.totalCheckInsPerMonth,
      lastCheckInDate: model.lastCheckInDate,
    );
  }

}
