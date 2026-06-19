import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/core/api/json_helpers.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

abstract final class _FavoriteWordEndpoints {
  static const userFavorites = '/user/favorites';

  static String userFavoriteById(String wordId) => '/user/favorites/$wordId';
}

abstract interface class FavoriteWordDataSource {
  Future<List<WordModel>> getFavorites();
  Future<void> addFavorite(WordModel word);
  Future<void> removeFavorite(String id);
  Future<bool> isFavorite(String id);
}

class FavoriteWordDataSourceImpl extends BaseDataSource
    implements FavoriteWordDataSource {
  FavoriteWordDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<List<WordModel>> getFavorites() async {
    try {
      final response = await dio.get(_FavoriteWordEndpoints.userFavorites);
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
  Future<void> addFavorite(WordModel word) async {
    try {
      await dio.post(
        _FavoriteWordEndpoints.userFavorites,
        data: {
          'word_id': word.id,
          'word': word.word,
        },
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    try {
      await dio.delete(_FavoriteWordEndpoints.userFavoriteById(id));
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<bool> isFavorite(String id) async {
    final favorites = await getFavorites();
    return favorites.any((w) => w.id == id);
  }
}
