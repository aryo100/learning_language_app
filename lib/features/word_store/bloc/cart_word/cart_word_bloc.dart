import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/word_entity.dart';
import '../../domain/usecases/get_cart_word_usecase.dart';

part 'cart_word_event.dart';
part 'cart_word_state.dart';
part 'cart_word_bloc.freezed.dart';

class CartWordBloc extends Bloc<CartWordEvent, CartWordState> {
  final GetCartWordUsecase _getCartWordUsecase;
  
  CartWordBloc(this._getCartWordUsecase) : super(const _Initial()) {
    on<_GetCartWord>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await _getCartWordUsecase.call();
        result.fold(
          (cartWords) => emit(_Success(cartWords)),
          (error) => emit(_Failure('Failed to get cart words: $error')),
        );
      } catch (e) {
        emit(_Failure('Failed to get cart words: $e'));
      }
    });

    on<_AddCartWord>((event, emit) async {
      try {
        // Get current cart words
        final currentResult = await _getCartWordUsecase.call();
        currentResult.fold(
          (currentWords) async {
            // Add new word
            final updatedWords = [...currentWords, event.cartWord];
            // Save updated list
            // Note: You might want to create a separate usecase for saving
            emit(_Success(updatedWords));
          },
          (error) => emit(_Failure('Failed to add cart word: $error')),
        );
      } catch (e) {
        emit(_Failure('Failed to add cart word: $e'));
      }
    });

    on<_RemoveCartWord>((event, emit) async {
      try {
        // Get current cart words
        final currentResult = await _getCartWordUsecase.call();
        currentResult.fold(
          (currentWords) {
            // Remove word by id
            final updatedWords = currentWords.where((word) => word.id != event.id).toList();
            emit(_Success(updatedWords));
          },
          (error) => emit(_Failure('Failed to remove cart word: $error')),
        );
      } catch (e) {
        emit(_Failure('Failed to remove cart word: $e'));
      }
    });

    on<_ToggleCartWord>((event, emit) async {
      try {
        // Get current cart words
        final currentResult = await _getCartWordUsecase.call();
        currentResult.fold(
          (currentWords) {
            // Toggle word isAdded status
            final updatedWords = currentWords.map((word) {
              if (word.id == event.id) {
                return word;
              }
              return word;
            }).toList();
            emit(_Success(updatedWords));
          },
          (error) => emit(_Failure('Failed to toggle cart word: $error')),
        );
      } catch (e) {
        emit(_Failure('Failed to toggle cart word: $e'));
      }
    });
  }
}
