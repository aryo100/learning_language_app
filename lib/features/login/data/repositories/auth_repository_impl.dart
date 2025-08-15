import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSources;

  AuthRepositoryImpl(this._dataSources);

  @override
  Future<Either<String, Exception>> signInGoogle() async {
    try {
      final email = await _dataSources.signInGoogle();
      return Left(email);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
