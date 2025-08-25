import 'package:fpdart/fpdart.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/word_repository.dart';
import '../data_sources/word_data_source.dart';

class WordRepositoryImpl implements WordRepository {
  final WordDataSource _dataSource;

  WordRepositoryImpl(this._dataSource);

  @override
  Future<Either<List<WordEntity>, Exception>> getWords() async {
    try {
      final wordModels = await _dataSource.getWords();

      // Convert CartWordModel to CartWordEntity
      final wordEntities =
          wordModels.map((model) => WordEntity.fromModel(model)).toList();


      return Left(wordEntities);
    } catch (e) {
      print('error word repository: $e');
      return Right(Exception(e.toString()));
    }
  }
}
