import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/features/login/data/models/auth_result_model.dart';

abstract final class _AuthEndpoints {
  static const auth = '/auth';
  static const refresh = '/auth/refresh';
  static const logout = '/auth/logout';
}

abstract interface class AuthDataSource {
  Future<AuthResultModel> signInGoogle();
  Future<AuthResultModel> refreshSession(String refreshToken);
  Future<void> logout({String? refreshToken});
}

class AuthDataSourceImpl extends BaseDataSource implements AuthDataSource {
  AuthDataSourceImpl({Dio? dio}) : super(dio ?? networkDio);

  @override
  Future<AuthResultModel> signInGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(scopes: ['email', 'openid']);
      final account = await googleSignIn.signIn();
      if (account == null) {
        throw Exception('sign in with Google canceled');
      }

      final authentication = await account.authentication;
      final idToken = authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw Exception('Google ID token is missing');
      }

      final response = await dio.post(
        _AuthEndpoints.auth,
        data: {
          'provider': 'google',
          'id_token': idToken,
        },
      );

      final result = AuthResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      if (result.accessToken.isEmpty) {
        throw Exception('Auth response missing access token');
      }

      return result;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<AuthResultModel> refreshSession(String refreshToken) async {
    try {
      final response = await dio.post(
        _AuthEndpoints.refresh,
        data: {'refresh_token': refreshToken},
      );
      final result = AuthResultModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      if (result.accessToken.isEmpty) {
        throw Exception('Refresh response missing access token');
      }
      return result;
    } catch (e) {
      throw handleNetworkError(e);
    }
  }

  @override
  Future<void> logout({String? refreshToken}) async {
    try {
      await dio.post(
        _AuthEndpoints.logout,
        data: {
          if (refreshToken != null && refreshToken.isNotEmpty)
            'refresh_token': refreshToken,
        },
      );
    } catch (e) {
      throw handleNetworkError(e);
    }
  }
}
