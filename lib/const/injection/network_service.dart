import 'package:dio/dio.dart';

// Network Constants
class NetworkConstants {
  // Base URL
  static const String baseUrl = 'http://192.168.88.103:8080';
  
  // API Endpoints
  static const String checkIn = '$baseUrl/checkin';
  static const String vocab = '$baseUrl/vocab';
  static const String leaderboard = '$baseUrl/leaderboard';
  static const String profile = '$baseUrl/profile';
  static const String auth = '$baseUrl/auth';
}

// Base Data Source with common network functionality
abstract class BaseDataSource {
  final Dio _dio;

  BaseDataSource(this._dio);

  Dio get dio => _dio;

  // Common error handling method
  Exception handleNetworkError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Exception('Connection timeout. Please check your internet connection.');
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

// Global Dio instance
class NetworkService {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  late final Dio dio;

  void initialize() {
    dio = Dio();
    _setupDio();
  }

  void _setupDio() {
    // Base configuration
    dio.options.baseUrl = NetworkConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);

    // Add interceptors for logging, error handling, etc.
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => print(obj),
    ));

    // Add error handling interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        // Handle common errors here
        print('Network Error: ${error.message}');
        handler.next(error);
      },
    ));
  }
}

// Getter untuk mengakses Dio instance
Dio get networkDio => NetworkService().dio;
