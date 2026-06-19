import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';

import '../models/points_models.dart';

abstract final class _PointsEndpoints {
  static const rules = '/points/rules';
  static const history = '/points/history';
}

abstract interface class PointsDataSource {
  Future<PointsRulesModel> getRules();
  Future<PointsHistoryModel> getHistory({
    int limit = 20,
    int offset = 0,
    String? source,
  });
}

class PointsDataSourceImpl extends BaseDataSource implements PointsDataSource {
  PointsDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<PointsRulesModel> getRules() async {
    try {
      final response = await dio.get(_PointsEndpoints.rules);
      return PointsRulesModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<PointsHistoryModel> getHistory({
    int limit = 20,
    int offset = 0,
    String? source,
  }) async {
    try {
      final response = await dio.get(
        _PointsEndpoints.history,
        queryParameters: {
          'limit': limit,
          'offset': offset,
          if (source != null && source.isNotEmpty) 'source': source,
        },
      );
      return PointsHistoryModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
