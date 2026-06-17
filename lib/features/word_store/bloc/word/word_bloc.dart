import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/get_word_usecase.dart';

part 'word_event.dart';
part 'word_state.dart';
part 'word_bloc.freezed.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final GetWordUsecase _getWordUsecase;

  WordBloc(this._getWordUsecase) : super(const WordState.initial()) {
    on<_GetWord>((event, emit) async {
      emit(const WordState.loading());
      try {
        final result = await _getWordUsecase.call();
        result.fold(
          (catalog) => emit(
            WordState.success(words: catalog.words, total: catalog.total),
          ),
          (error) => emit(WordState.failure('Failed to load words: $error')),
        );
      } catch (e) {
        emit(WordState.failure('Failed to load words: $e'));
      }
    });
  }
}
