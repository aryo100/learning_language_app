import 'package:dio/dio.dart';

typedef AccessTokenProvider = String? Function();

/// Attaches `Authorization: Bearer` when a token is available.
class AuthTokenInterceptor extends Interceptor {
  AuthTokenInterceptor(this._accessTokenProvider);

  final AccessTokenProvider _accessTokenProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _accessTokenProvider();
    if (token != null &&
        token.isNotEmpty &&
        !options.path.contains('/auth')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
