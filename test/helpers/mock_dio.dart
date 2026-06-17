import 'dart:async';

import 'package:dio/dio.dart';
import 'package:learning_language_app/const/injection/network_service.dart';

typedef MockResponseBuilder = FutureOr<dynamic> Function(RequestOptions options);

/// Dio instance that resolves requests from [handlers] without network I/O.
Dio createMockDio(Map<String, MockResponseBuilder> handlers) {
  final dio = Dio(
    BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      validateStatus: (_) => true,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        for (final entry in handlers.entries) {
          if (_matchesPath(options, entry.key)) {
            final data = await entry.value(options);
            handler.resolve(
              Response(
                requestOptions: options,
                data: data,
                statusCode: 200,
              ),
            );
            return;
          }
        }

        handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.badResponse,
            response: Response(
              requestOptions: options,
              statusCode: 404,
              data: 'No mock handler for ${options.uri}',
            ),
          ),
        );
      },
    ),
  );

  return dio;
}

bool _matchesPath(RequestOptions options, String pathSuffix) {
  final normalized = pathSuffix.startsWith('/') ? pathSuffix : '/$pathSuffix';
  return options.uri.path == normalized ||
      options.uri.path.endsWith(normalized);
}
