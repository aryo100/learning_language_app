import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_language_app/features/home/domain/entities/check_in_summary_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/leaderboard_response_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/vocab_entity.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_check_in_summary_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_leaderboard_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_new_word_usecase.dart';

part 'summary_event.dart';
part 'summary_state.dart';
part 'summary_bloc.freezed.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final GetCheckInSummaryUsecase getCheckInSummaryUsecase;
  final GetNewWordUsecase getNewWordUsecase;
  final GetLeaderboardUsecase getLeaderboardUsecase;

  SummaryBloc(
    this.getCheckInSummaryUsecase,
    this.getNewWordUsecase,
    this.getLeaderboardUsecase,
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
  }
}
