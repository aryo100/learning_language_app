import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

abstract interface class WordDataSource {
  Future<List<WordModel>> getWords();
  Future<int> getVocabTotal();
}

class WordDataSourceImpl extends BaseDataSource implements WordDataSource {
  WordDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<List<WordModel>> getWords() async {
    try {
      final response = await dio.get(
        NetworkConstants.vocab,
        queryParameters: {'limit': 100},
      );
      final data = response.data as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>;
      return items
          .map((item) => WordModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<int> getVocabTotal() async {
    try {
      final response = await dio.get(
        NetworkConstants.vocab,
        queryParameters: {'limit': 1},
      );
      final data = response.data as Map<String, dynamic>;
      return data['total'] as int? ?? 0;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
