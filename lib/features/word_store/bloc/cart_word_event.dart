part of 'cart_word_bloc.dart';

@freezed
class CartWordEvent with _$CartWordEvent {
  const factory CartWordEvent.started() = _Started;
  const factory CartWordEvent.getCartWord() = _GetCartWord;
  const factory CartWordEvent.addCartWord(CartWordEntity cartWord) = _AddCartWord;
  const factory CartWordEvent.removeCartWord(String id) = _RemoveCartWord;
  const factory CartWordEvent.toggleCartWord(String id) = _ToggleCartWord;
}