import 'package:fpdart/fpdart.dart';
import '../../domain/entities/word_entity.dart';
import '../../domain/repositories/cart_word_repository.dart';
import '../data_sources/cart_word_data_source.dart';
import '../models/word_model.dart';

class CartWordRepositoryImpl implements CartWordRepository {
  final CartWordDataSource _dataSource;

  CartWordRepositoryImpl(this._dataSource);

  @override
  Future<Either<List<WordEntity>, Exception>> getCartWords() async {
    try {
      final cartWordModels = await _dataSource.getCartWords();

      // Convert CartWordModel to CartWordEntity
      final cartWordEntities =
          cartWordModels.map((model) => WordEntity.fromModel(model)).toList();

      return Left(cartWordEntities);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> saveCartWords(
    List<WordEntity> cartWords,
  ) async {
    try {
      // Convert CartWordEntity to CartWordModel
      final cartWordModels =
          cartWords
              .map(
                (entity) => WordModel(
                  id: entity.id,
                  word: entity.word,
                  definition: entity.definition,
                  example: entity.example,
                  type: entity.type,
                ),
              )
              .toList();

      await _dataSource.saveCartWords(cartWordModels);
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> addCartWord(WordEntity cartWord) async {
    try {
      final cartWordModel = WordModel(
        id: cartWord.id,
        word: cartWord.word,
        definition: cartWord.definition,
        example: cartWord.example,
        type: cartWord.type,
      );

      await _dataSource.addCartWord(cartWordModel);
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> removeCartWord(String id) async {
    try {
      await _dataSource.removeCartWord(id);
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }

  @override
  Future<Either<void, Exception>> toggleCartWord(String id) async {
    try {
      await _dataSource.toggleCartWord(id);
      return const Left(null);
    } catch (e) {
      return Right(Exception(e.toString()));
    }
  }
}
