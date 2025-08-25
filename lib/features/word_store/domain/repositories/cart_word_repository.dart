import 'package:fpdart/fpdart.dart';
import '../entities/word_entity.dart';

abstract class CartWordRepository {
  Future<Either<List<WordEntity>, Exception>> getCartWords();
  Future<Either<void, Exception>> saveCartWords(List<WordEntity> cartWords);
  Future<Either<void, Exception>> addCartWord(WordEntity cartWord);
  Future<Either<void, Exception>> removeCartWord(String id);
  Future<Either<void, Exception>> toggleCartWord(String id);
}
