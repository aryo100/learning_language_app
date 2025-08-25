part of 'word_bloc.dart';

@freezed
class WordEvent with _$WordEvent {
  const factory WordEvent.started() = _Started;
  const factory WordEvent.getWord() = _GetWord;
}