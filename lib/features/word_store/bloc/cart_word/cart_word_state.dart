part of 'cart_word_bloc.dart';

@freezed
class CartWordState with _$CartWordState {
  const factory CartWordState.initial() = _Initial;
  const factory CartWordState.loading() = _Loading;
  const factory CartWordState.success(List<WordEntity> cartWords) = _Success;
  const factory CartWordState.failure(String message) = _Failure;
}
