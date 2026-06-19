import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_language_app/features/word_store/domain/entities/word_entity.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/add_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/remove_cart_word_usecase.dart';

part 'cart_word_event.dart';
part 'cart_word_state.dart';
part 'cart_word_bloc.freezed.dart';

class CartWordBloc extends Bloc<CartWordEvent, CartWordState> {
  CartWordBloc(
    this._getCartWordUsecase,
    this._addCartWordUsecase,
    this._removeCartWordUsecase,
  ) : super(const _Initial()) {
    on<_GetCartWord>(_onGetCartWord);
    on<_AddCartWord>(_onAddCartWord);
    on<_RemoveCartWord>(_onRemoveCartWord);
  }

  final GetCartWordUsecase _getCartWordUsecase;
  final AddCartWordUsecase _addCartWordUsecase;
  final RemoveCartWordUsecase _removeCartWordUsecase;

  Future<void> _onGetCartWord(
    _GetCartWord event,
    Emitter<CartWordState> emit,
  ) async {
    emit(const CartWordState.loading());
    final result = await _getCartWordUsecase.call();
    result.fold(
      (cartWords) => emit(CartWordState.success(cartWords)),
      (error) => emit(CartWordState.failure('Failed to load cart words: $error')),
    );
  }

  Future<void> _onAddCartWord(
    _AddCartWord event,
    Emitter<CartWordState> emit,
  ) async {
    final result = await _addCartWordUsecase.call(event.cartWord);
    result.fold(
      (_) => add(const CartWordEvent.getCartWord()),
      (error) => emit(CartWordState.failure('Failed to add cart word: $error')),
    );
  }

  Future<void> _onRemoveCartWord(
    _RemoveCartWord event,
    Emitter<CartWordState> emit,
  ) async {
    final result = await _removeCartWordUsecase.call(event.id);
    result.fold(
      (_) => add(const CartWordEvent.getCartWord()),
      (error) =>
          emit(CartWordState.failure('Failed to remove cart word: $error')),
    );
  }
}
