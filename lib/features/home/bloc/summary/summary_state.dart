part of 'summary_bloc.dart';

@freezed
abstract class SummaryState with _$SummaryState {
  const factory SummaryState({
    CheckInSummaryEntity? checkInSummary,
    VocabEntity? vocab,
    LeaderboardResponseEntity? leaderboard,
    LeaderboardMeEntity? leaderboardMe,
    PointsRulesEntity? pointsRules,
    String? errorMessage,
    @Default(false) bool isLoading,
    @Default(false) bool isCheckInLoading,
    CheckInResultEntity? lastCheckInResult,
  }) = _SummaryState;
}
