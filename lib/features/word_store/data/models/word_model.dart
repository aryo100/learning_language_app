import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
abstract class WordModel with _$WordModel {

  factory WordModel({
    required String id,
    required String word,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
    required String definition,
    required String example,
    required String type,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);
}