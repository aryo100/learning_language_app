import 'package:dio/dio.dart';
import 'package:learning_language_app/core/api/api_config.dart';
import 'package:learning_language_app/features/login/data/models/auth_result_model.dart';

typedef RefreshTokenProvider = String? Function();
typedef OnTokensRefreshed =
    Future<void> Function(String accessToken, String? refreshToken);

/// Retries failed requests once after refreshing JWT on 401.
class AuthRefreshInterceptor extends QueuedInterceptor {
  AuthRefreshInterceptor({
    required Dio dio,
    required RefreshTokenProvider refreshTokenProvider,
    required OnTokensRefreshed onTokensRefreshed,
  })  : _dio = dio,
        _refreshTokenProvider = refreshTokenProvider,
        _onTokensRefreshed = onTokensRefreshed,
        _refreshDio = Dio(
          BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: const Duration(seconds: 8),
            receiveTimeout: const Duration(seconds: 8),
          ),
        );

  final Dio _dio;
  final Dio _refreshDio;
  final RefreshTokenProvider _refreshTokenProvider;
  final OnTokensRefreshed _onTokensRefreshed;

  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})>
      _queue = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;
    final path = err.requestOptions.path;
    final isAuthPath = path.contains('/auth');

    if (status != 401 || isAuthPath) {
      return handler.next(err);
    }

    final refreshToken = _refreshTokenProvider();
    if (refreshToken == null || refreshToken.isEmpty) {
      return handler.next(err);
    }

    if (_isRefreshing) {
      _queue.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;
    try {
      final response = await _refreshDio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );
      final result = AuthResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      if (result.accessToken.isEmpty) {
        throw DioException(
          requestOptions: err.requestOptions,
          message: 'Refresh response missing access token',
        );
      }

      await _onTokensRefreshed(result.accessToken, result.refreshToken);

      final retryResponse = await _retry(err.requestOptions, result.accessToken);
      handler.resolve(retryResponse);

      for (final pending in _queue) {
        try {
          final retried = await _retry(
            pending.options,
            result.accessToken,
          );
          pending.handler.resolve(retried);
        } catch (e) {
          pending.handler.next(
            e is DioException
                ? e
                : DioException(
                    requestOptions: pending.options,
                    error: e,
                  ),
          );
        }
      }
    } catch (e) {
      handler.next(err);
      for (final pending in _queue) {
        pending.handler.next(err);
      }
    } finally {
      _queue.clear();
      _isRefreshing = false;
    }
  }

  Future<Response<dynamic>> _retry(
    RequestOptions options,
    String accessToken,
  ) {
    final headers = Map<String, dynamic>.from(options.headers);
    headers['Authorization'] = 'Bearer $accessToken';
    return _dio.fetch(
      options.copyWith(headers: headers),
    );
  }
}
