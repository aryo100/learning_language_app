part of 'summary_bloc.dart';

@freezed
class SummaryEvent with _$SummaryEvent {
  const factory SummaryEvent.started() = _Started;
  const factory SummaryEvent.getCheckInSummary() = _GetCheckInSummary;
  const factory SummaryEvent.getNewWord() = _GetNewWord;
  const factory SummaryEvent.getLeaderboard() = _GetLeaderboard;
}
