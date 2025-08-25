import 'package:learning_language_app/const/utils/json_loader.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

abstract interface class WordDataSource {
  Future<List<WordModel>> getWords();
}

class WordDataSourceImpl implements WordDataSource {
  WordDataSourceImpl();

  @override
  Future<List<WordModel>> getWords() async {
    try {
      final result = await JsonLoader.load("assets/data/vocab_words.json");
      print('result: $result');
      final List<dynamic> jsonList = result as List;
      return jsonList
          .map((item) => WordModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } on UnimplementedError {
      rethrow;
    }
  }
}
