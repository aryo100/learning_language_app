import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/get_word_usecase.dart';

part 'word_event.dart';
part 'word_state.dart';
part 'word_bloc.freezed.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final GetWordUsecase _getWordUsecase;

  WordBloc(this._getWordUsecase) : super(_Initial()) {
    on<_GetWord>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await _getWordUsecase.call();
        result.fold((words) {
          print('words: $words');
          emit(_Success(words));
        }, (error) => emit(_Failure('Failed to get words: $error')));
      } catch (e) {
        emit(_Failure('Failed to get words: $e'));
      }
    });
  }
}
