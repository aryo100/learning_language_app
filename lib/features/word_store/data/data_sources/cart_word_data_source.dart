import 'dart:convert';
import 'package:learning_language_app/const/utils/shared_preferences.dart';
import 'package:learning_language_app/features/word_store/data/models/cart_word_model.dart';

abstract interface class CartWordDataSource {
  Future<List<CartWordModel>> getCartWords();
  Future<void> saveCartWords(List<CartWordModel> cartWords);
  Future<void> addCartWord(CartWordModel cartWord);
  Future<void> removeCartWord(String id);
  Future<void> toggleCartWord(String id);
}

class CartWordDataSourceImpl implements CartWordDataSource {
  final SharedPref _sharedPref;
  static const String _cartWordsKey = 'cart_words';

  CartWordDataSourceImpl(this._sharedPref);

  @override
  Future<List<CartWordModel>> getCartWords() async {
    try {
      final cartWordsJson = _sharedPref.getString(_cartWordsKey);
      if (cartWordsJson == null || cartWordsJson.isEmpty) {
        // Return default sample data if no data exists
        return _getDefaultCartWords();
      }
      
      final List<dynamic> jsonList = jsonDecode(cartWordsJson);
      return jsonList
          .map((item) => CartWordModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Return default data if parsing fails
      return _getDefaultCartWords();
    }
  }

  @override
  Future<void> saveCartWords(List<CartWordModel> cartWords) async {
    try {
      final jsonString = jsonEncode(cartWords.map((word) => word.toJson()).toList());
      await _sharedPref.setString(_cartWordsKey, jsonString);
    } catch (e) {
      throw Exception('Failed to save cart words: $e');
    }
  }

  @override
  Future<void> addCartWord(CartWordModel cartWord) async {
    try {
      final currentWords = await getCartWords();
      currentWords.add(cartWord);
      await saveCartWords(currentWords);
    } catch (e) {
      throw Exception('Failed to add cart word: $e');
    }
  }

  @override
  Future<void> removeCartWord(String id) async {
    try {
      final currentWords = await getCartWords();
      currentWords.removeWhere((word) => word.id == id);
      await saveCartWords(currentWords);
    } catch (e) {
      throw Exception('Failed to remove cart word: $e');
    }
  }

  @override
  Future<void> toggleCartWord(String id) async {
    try {
      final currentWords = await getCartWords();
      final wordIndex = currentWords.indexWhere((word) => word.id == id);
      if (wordIndex != -1) {
        final currentWord = currentWords[wordIndex];
        final updatedWord = CartWordModel(
          id: currentWord.id,
          word: currentWord.word,
          definition: currentWord.definition,
          example: currentWord.example,
          type: currentWord.type,
          isAdded: !currentWord.isAdded,
        );
        currentWords[wordIndex] = updatedWord;
        await saveCartWords(currentWords);
      }
    } catch (e) {
      throw Exception('Failed to toggle cart word: $e');
    }
  }

  // Default sample data for first time use
  List<CartWordModel> _getDefaultCartWords() {
    return [
      CartWordModel(
        id: "1",
        word: "Serendipity",
        definition: "The occurrence and development of events by chance in a happy or beneficial way",
        example: "Finding that perfect coffee shop was pure serendipity.",
        type: "noun",
        isAdded: true,
      ),
      CartWordModel(
        id: "2",
        word: "Ephemeral",
        definition: "Lasting for a very short time",
        example: "The beauty of cherry blossoms is ephemeral.",
        type: "adjective",
        isAdded: false,
      ),
      CartWordModel(
        id: "3",
        word: "Ubiquitous",
        definition: "Present, appearing, or found everywhere",
        example: "Smartphones have become ubiquitous in modern society.",
        type: "adjective",
        isAdded: true,
      ),
      CartWordModel(
        id: "4",
        word: "Serendipity",
        definition: "The occurrence and development of events by chance in a happy or beneficial way",
        example: "Finding that perfect coffee shop was pure serendipity.",
        type: "noun",
        isAdded: true,
      ),
    ];
  }
}
