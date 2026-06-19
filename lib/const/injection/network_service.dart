import 'package:dio/dio.dart';
import 'package:learning_language_app/core/api/api_config.dart';
import 'package:learning_language_app/core/api/auth_refresh_interceptor.dart';
import 'package:learning_language_app/core/api/auth_token_interceptor.dart';

export 'package:learning_language_app/core/api/api_config.dart' show ApiConfig;

/// Base class for remote data sources using the shared [Dio] client.
abstract class BaseDataSource {
  BaseDataSource(this._dio);

  final Dio _dio;

  Dio get dio => _dio;

  Exception handleNetworkError(dynamic error) {
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        final message = data['error'] ?? data['message'];
        if (message is String && message.isNotEmpty) {
          return Exception(message);
        }
      }
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Exception(
            'Connection timeout. Please check your internet connection.',
          );
        case DioExceptionType.badResponse:
          return Exception('Server error: ${error.response?.statusCode}');
        case DioExceptionType.cancel:
          return Exception('Request cancelled');
        case DioExceptionType.connectionError:
          return Exception('No internet connection');
        default:
          return Exception('Network error: ${error.message}');
      }
    }
    return Exception('Unexpected error: $error');
  }
}

class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  late final Dio dio;
  bool _authInterceptorAttached = false;
  bool _refreshInterceptorAttached = false;

  void initialize() {
    dio = Dio();
    _setupDio();
  }

  void attachAuthInterceptor(AccessTokenProvider tokenProvider) {
    if (_authInterceptorAttached) return;
    dio.interceptors.insert(0, AuthTokenInterceptor(tokenProvider));
    _authInterceptorAttached = true;
  }

  void attachTokenRefresh({
    required RefreshTokenProvider refreshTokenProvider,
    required OnTokensRefreshed onTokensRefreshed,
  }) {
    if (_refreshInterceptorAttached) return;
    dio.interceptors.add(
      AuthRefreshInterceptor(
        dio: dio,
        refreshTokenProvider: refreshTokenProvider,
        onTokensRefreshed: onTokensRefreshed,
      ),
    );
    _refreshInterceptorAttached = true;
  }

  void _setupDio() {
    dio.options.baseUrl = ApiConfig.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 8);
    dio.options.receiveTimeout = const Duration(seconds: 8);
    dio.options.sendTimeout = const Duration(seconds: 8);

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print(obj),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print('Network Error: ${error.message}');
          handler.next(error);
        },
      ),
    );
  }
}

Dio get networkDio => NetworkService().dio;
