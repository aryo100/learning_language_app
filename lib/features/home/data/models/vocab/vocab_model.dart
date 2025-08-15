import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocab_model.freezed.dart';
part 'vocab_model.g.dart';

@freezed
abstract class VocabModel with _$VocabModel {
  factory VocabModel(
    String word,
    List<String> synonyms,
    List<String> antonyms,
    String definition,
    String example,
    String type,
  ) = _VocabModel;

  factory VocabModel.fromJson(Map<String, dynamic> json) =>
      _$VocabModelFromJson(json);
}
