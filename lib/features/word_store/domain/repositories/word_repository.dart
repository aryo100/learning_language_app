import 'package:fpdart/fpdart.dart';
import '../entities/word_entity.dart';

abstract class WordRepository {
  Future<Either<List<WordEntity>, Exception>> getWords();
}
