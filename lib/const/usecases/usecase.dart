import 'package:fpdart/fpdart.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Type, Exception>> call(Params params);
}

/// **Type:** return type of call function.
abstract class UsecaseNoParam<Type> {
  Future<Either<Type, Exception>> call();
}