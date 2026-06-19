import 'dart:math';

import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

abstract final class _WordEndpoints {
  static const vocab = '/vocab';

  static String vocabByWord(String word) => '/vocab/$word';
}

abstract interface class WordDataSource {
  Future<List<WordModel>> getWords();
  Future<int> getVocabTotal();
  Future<List<WordModel>> searchWords(String query, {int limit = 20});
  Future<WordModel> getWordByWord(String word);
  Future<List<WordModel>> getRandomWords(int count);
}

class WordDataSourceImpl extends BaseDataSource implements WordDataSource {
  WordDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  List<WordModel> _parseVocabItems(dynamic data) {
    final items = (data as Map<String, dynamic>)['items'] as List<dynamic>;
    return items
        .map((item) => WordModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<WordModel>> getWords() async {
    try {
      final response = await dio.get(
        _WordEndpoints.vocab,
        queryParameters: {'limit': 100},
      );
      return _parseVocabItems(response.data);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<int> getVocabTotal() async {
    try {
      final response = await dio.get(
        _WordEndpoints.vocab,
        queryParameters: {'limit': 1},
      );
      final data = response.data as Map<String, dynamic>;
      return data['total'] as int? ?? 0;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<List<WordModel>> searchWords(String query, {int limit = 20}) async {
    try {
      final response = await dio.get(
        _WordEndpoints.vocab,
        queryParameters: {
          if (query.isNotEmpty) 'q': query,
          'limit': limit,
        },
      );
      return _parseVocabItems(response.data);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<WordModel> getWordByWord(String word) async {
    try {
      final response = await dio.get(_WordEndpoints.vocabByWord(word));
      return WordModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<List<WordModel>> getRandomWords(int count) async {
    try {
      final metaResponse = await dio.get(
        _WordEndpoints.vocab,
        queryParameters: {'limit': 1},
      );
      final total =
          (metaResponse.data as Map<String, dynamic>)['total'] as int? ?? 0;
      if (total == 0) {
        throw Exception('No vocabulary words available');
      }

      final safeCount = count.clamp(1, 100);
      final maxOffset = (total - safeCount).clamp(0, total - 1);
      final offset = maxOffset == 0 ? 0 : Random().nextInt(maxOffset + 1);

      final response = await dio.get(
        _WordEndpoints.vocab,
        queryParameters: {'limit': safeCount, 'offset': offset},
      );
      final words = _parseVocabItems(response.data);
      if (words.isEmpty) {
        throw Exception('No vocabulary words available');
      }
      return words;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
