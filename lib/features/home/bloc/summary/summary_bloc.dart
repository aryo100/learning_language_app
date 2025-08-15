import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_language_app/features/home/domain/entities/check_in_summary_entity.dart';
import 'package:learning_language_app/features/home/domain/entities/leaderboard_entity.dart';
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
      emit(state.copyWith(isLoading: true));
      print('_GetCheckInSummary');
      try {
        final result = await getCheckInSummaryUsecase.call();
        result.fold(
          (checkInSummary) {
            emit(
              state.copyWith(
                checkInSummary: checkInSummary,
                isLoading: false,
                errorMessage: null,
              ),
            );
          },
          (error) {
            emit(
              state.copyWith(
                errorMessage: 'Failed to get check-in summary: $error',
                isLoading: false,
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: 'Failed to get check-in summary: $e',
            isLoading: false,
          ),
        );
      }
    });

    on<_GetNewWord>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      print('_GetNewWord');
      try {
        final result = await getNewWordUsecase.call();
        result.fold(
          (newWord) {
            print('New word fetched: $newWord');
            emit(
              state.copyWith(
                vocab: newWord,
                isLoading: false,
                errorMessage: null,
              ),
            );
          },
          (error) {
            emit(
              state.copyWith(
                errorMessage: 'Failed to get new word: $error',
                isLoading: false,
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: 'Failed to get new word: $e',
            isLoading: false,
          ),
        );
      }
    });

    on<_GetLeaderboard>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      print('_GetLeaderboard');
      try {
        final result = await getLeaderboardUsecase.call();
        result.fold(
          (leaderboard) {
            print('Leaderboard fetched: ${leaderboard.length} categories');
            emit(
              state.copyWith(
                leaderboard: leaderboard,
                isLoading: false,
                errorMessage: null,
              ),
            );
          },
          (error) {
            emit(
              state.copyWith(
                errorMessage: 'Failed to get leaderboard: $error',
                isLoading: false,
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: 'Failed to get leaderboard: $e',
            isLoading: false,
          ),
        );
      }
    });
  }
}
