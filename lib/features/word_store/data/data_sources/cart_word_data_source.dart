import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/core/api/json_helpers.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

abstract final class _CartWordEndpoints {
  static const userWords = '/user/words';

  static String userWordById(String wordId) => '/user/words/$wordId';
}

abstract interface class CartWordDataSource {
  Future<List<WordModel>> getCartWords();
  Future<void> saveCartWords(List<WordModel> cartWords);
  Future<void> addCartWord(WordModel cartWord);
  Future<void> removeCartWord(String id);
  Future<void> toggleCartWord(String id);
}

class CartWordDataSourceImpl extends BaseDataSource
    implements CartWordDataSource {
  CartWordDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<List<WordModel>> getCartWords() async {
    try {
      final response = await dio.get(_CartWordEndpoints.userWords);
      final items = jsonList(
        response.data as Map<String, dynamic>,
        'items',
        'items',
      );
      return items
          .map((e) => WordModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<void> saveCartWords(List<WordModel> cartWords) async {
    for (final word in cartWords) {
      await addCartWord(word);
    }
  }

  @override
  Future<void> addCartWord(WordModel cartWord) async {
    try {
      await dio.post(
        _CartWordEndpoints.userWords,
        data: {
          'word_id': cartWord.id,
          'word': cartWord.word,
        },
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<void> removeCartWord(String id) async {
    try {
      await dio.delete(_CartWordEndpoints.userWordById(id));
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<void> toggleCartWord(String id) async {
    // No server toggle — no-op for API-backed bag.
  }
}
