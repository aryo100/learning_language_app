import 'package:fpdart/fpdart.dart';

import '../entities/points_entities.dart';

abstract class PointsRepository {
  Future<Either<PointsRulesEntity, Exception>> getRules();
  Future<Either<PointsHistoryEntity, Exception>> getHistory({
    int limit = 20,
    int offset = 0,
    String? source,
  });
}
