import 'package:fpdart/fpdart.dart';
import '../entities/cart_word_entity.dart';

abstract class CartWordRepository {
  Future<Either<List<CartWordEntity>, Exception>> getCartWords();
  Future<Either<void, Exception>> saveCartWords(List<CartWordEntity> cartWords);
  Future<Either<void, Exception>> addCartWord(CartWordEntity cartWord);
  Future<Either<void, Exception>> removeCartWord(String id);
  Future<Either<void, Exception>> toggleCartWord(String id);
}
