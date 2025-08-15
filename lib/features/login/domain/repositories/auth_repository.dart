import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<String, Exception>> signInGoogle();
}
