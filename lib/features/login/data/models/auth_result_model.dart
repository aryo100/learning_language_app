import 'package:learning_language_app/core/api/json_helpers.dart';

class AuthResultModel {
  const AuthResultModel({
    required this.accessToken,
    required this.email,
    required this.name,
    this.refreshToken,
    this.photoUrl,
    this.expiresIn = 3600,
  });

  final String accessToken;
  final String? refreshToken;
  final int expiresIn;
  final String email;
  final String name;
  final String? photoUrl;

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    final user = jsonMap(json, 'user', 'user');
    return AuthResultModel(
      accessToken: jsonString(json, 'access_token', 'accessToken'),
      refreshToken: jsonField<String>(json, 'refresh_token', 'refreshToken'),
      expiresIn: jsonInt(json, 'expires_in', 'expiresIn', fallback: 3600),
      email: jsonString(user, 'email', 'email'),
      name: jsonString(user, 'name', 'name'),
      photoUrl: jsonField<String>(user, 'photo_url', 'photoUrl'),
    );
  }
}
