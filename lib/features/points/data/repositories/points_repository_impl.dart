import 'package:fpdart/fpdart.dart';

import '../../domain/entities/points_entities.dart';
import '../../domain/repositories/points_repository.dart';
import '../data_sources/points_data_source.dart';

class PointsRepositoryImpl implements PointsRepository {
  PointsRepositoryImpl(this._dataSource);

  final PointsDataSource _dataSource;

  @override
  Future<Either<PointsRulesEntity, Exception>> getRules() async {
    try {
      final model = await _dataSource.getRules();
      return Left(PointsRulesEntity.fromModel(model));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<PointsHistoryEntity, Exception>> getHistory({
    int limit = 20,
    int offset = 0,
    String? source,
  }) async {
    try {
      final model = await _dataSource.getHistory(
        limit: limit,
        offset: offset,
        source: source,
      );
      return Left(PointsHistoryEntity.fromModel(model));
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
