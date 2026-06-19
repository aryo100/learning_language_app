part of 'summary_bloc.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.started() = _Started;
  const factory SummaryEvent.getCheckInSummary() = _GetCheckInSummary;
  const factory SummaryEvent.getNewWord() = _GetNewWord;
  const factory SummaryEvent.getLeaderboard() = _GetLeaderboard;
  const factory SummaryEvent.getLeaderboardMe() = _GetLeaderboardMe;
  const factory SummaryEvent.getPointsRules() = _GetPointsRules;
  const factory SummaryEvent.postCheckIn() = _PostCheckIn;
  const factory SummaryEvent.clearCheckInResult() = _ClearCheckInResult;
}
