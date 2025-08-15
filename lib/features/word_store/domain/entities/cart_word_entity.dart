import 'package:equatable/equatable.dart';
import 'package:learning_language_app/features/word_store/data/models/cart_word_model.dart';

class CartWordEntity extends Equatable {
  final String id;
  final String word;
  final String definition;
  final String example;
  final String type;
  final bool isAdded;

  const CartWordEntity({
    required this.id,
    required this.word,
    required this.definition,
    required this.example,
    required this.type,
    required this.isAdded,
  });

  @override
  List<Object?> get props => [
    id,
    word,
    definition,
    example,
    type,
    isAdded,
  ];

  CartWordEntity copyWith({
    String? id,
    String? word,
    String? definition,
    String? example,
    String? type,
    bool? isAdded,
  }) {
    return CartWordEntity(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      type: type ?? this.type,
      isAdded: isAdded ?? this.isAdded,
    );
  }

  static CartWordEntity fromModel(CartWordModel model) {
    return CartWordEntity(
      id: model.id,
      word: model.word,
      definition: model.definition,
      example: model.example,
      type: model.type,
      isAdded: model.isAdded,
    );
  }
}
