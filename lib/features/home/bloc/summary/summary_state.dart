part of 'summary_bloc.dart';

@freezed
abstract class SummaryState with _$SummaryState {
  const factory SummaryState({
    CheckInSummaryEntity? checkInSummary,
    VocabEntity? vocab,
    Map<String, List<LeaderboardEntity>>? leaderboard,
    String? errorMessage,
    @Default(false) bool isLoading,
  }) = _SummaryState;
}
