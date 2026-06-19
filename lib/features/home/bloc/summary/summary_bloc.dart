import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_language_app/features/home/domain/entities/check_in_result_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/check_in_summary_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/leaderboard_me_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/leaderboard_response_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/vocab_entity.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_check_in_summary_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_leaderboard_me_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_leaderboard_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_new_word_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/post_check_in_usecase.dart';
import 'package:learning_language_app/features/points/domain/entities/points_entities.dart';
import 'package:learning_language_app/features/points/domain/usecases/points_usecases.dart';

part 'summary_event.dart';
part 'summary_state.dart';
part 'summary_bloc.freezed.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final GetCheckInSummaryUsecase getCheckInSummaryUsecase;
  final PostCheckInUsecase postCheckInUsecase;
  final GetNewWordUsecase getNewWordUsecase;
  final GetLeaderboardUsecase getLeaderboardUsecase;
  final GetLeaderboardMeUsecase getLeaderboardMeUsecase;
  final GetPointsRulesUsecase getPointsRulesUsecase;

  SummaryBloc(
    this.getCheckInSummaryUsecase,
    this.postCheckInUsecase,
    this.getNewWordUsecase,
    this.getLeaderboardUsecase,
    this.getLeaderboardMeUsecase,
    this.getPointsRulesUsecase,
  ) : super(const SummaryState()) {
    on<_GetCheckInSummary>((event, emit) async {
      try {
        final result = await getCheckInSummaryUsecase.call();
        result.fold(
          (checkInSummary) {
            emit(
              state.copyWith(
                checkInSummary: checkInSummary,
                errorMessage: null,
              ),
            );
          },
          (error) {
            emit(
              state.copyWith(
                errorMessage: 'Failed to get check-in summary: $error',
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: 'Failed to get check-in summary: $e',
          ),
        );
      }
    });

    on<_PostCheckIn>((event, emit) async {
      emit(state.copyWith(isCheckInLoading: true, errorMessage: null));
      try {
        final result = await postCheckInUsecase.call();
        result.fold(
          (checkInResult) {
            emit(
              state.copyWith(
                checkInSummary: checkInResult.summary,
                lastCheckInResult: checkInResult,
                isCheckInLoading: false,
                errorMessage: null,
              ),
            );
          },
          (error) {
            emit(
              state.copyWith(
                isCheckInLoading: false,
                errorMessage: 'Failed to check in: $error',
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            isCheckInLoading: false,
            errorMessage: 'Failed to check in: $e',
          ),
        );
      }
    });

    on<_ClearCheckInResult>((event, emit) async {
      emit(state.copyWith(lastCheckInResult: null));
    });

    on<_GetNewWord>((event, emit) async {
      try {
        final result = await getNewWordUsecase.call();
        result.fold(
          (newWord) {
            emit(state.copyWith(vocab: newWord, errorMessage: null));
          },
          (error) {
            emit(
              state.copyWith(errorMessage: 'Failed to get new word: $error'),
            );
          },
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: 'Failed to get new word: $e'));
      }
    });

    on<_GetLeaderboard>((event, emit) async {
      try {
        final result = await getLeaderboardUsecase.call();
        result.fold(
          (leaderboard) {
            emit(state.copyWith(leaderboard: leaderboard, errorMessage: null));
          },
          (error) {
            emit(
              state.copyWith(errorMessage: 'Failed to get leaderboard: $error'),
            );
          },
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: 'Failed to get leaderboard: $e'));
      }
    });

    on<_GetLeaderboardMe>((event, emit) async {
      try {
        final result = await getLeaderboardMeUsecase.call();
        result.fold(
          (leaderboardMe) {
            emit(state.copyWith(leaderboardMe: leaderboardMe, errorMessage: null));
          },
          (error) {
            emit(
              state.copyWith(
                errorMessage: 'Failed to get your leaderboard rank: $error',
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: 'Failed to get your leaderboard rank: $e',
          ),
        );
      }
    });

    on<_GetPointsRules>((event, emit) async {
      try {
        final result = await getPointsRulesUsecase.call();
        result.fold(
          (rules) => emit(state.copyWith(pointsRules: rules, errorMessage: null)),
          (error) => emit(
            state.copyWith(errorMessage: 'Failed to get points rules: $error'),
          ),
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: 'Failed to get points rules: $e'));
      }
    });
  }
}
