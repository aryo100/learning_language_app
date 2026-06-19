import 'package:equatable/equatable.dart';

class AuthSessionEntity extends Equatable {
  const AuthSessionEntity({
    required this.email,
    required this.accessToken,
    this.refreshToken,
    this.name = '',
  });

  final String email;
  final String accessToken;
  final String? refreshToken;
  final String name;

  @override
  List<Object?> get props => [email, accessToken, refreshToken, name];
}
