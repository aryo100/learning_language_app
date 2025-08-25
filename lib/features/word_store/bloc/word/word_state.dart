part of 'word_bloc.dart';

@freezed
class WordState with _$WordState {
  const factory WordState.initial() = _Initial;
  const factory WordState.loading() = _Loading;
  const factory WordState.success(List<WordEntity> words) = _Success;
  const factory WordState.failure(String message) = _Failure;
}
