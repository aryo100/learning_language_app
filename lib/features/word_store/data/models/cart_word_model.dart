class CartWordModel {
  final String id;
  final String word;
  final String definition;
  final String example;
  final String type;
  final bool isAdded;

  CartWordModel({
    required this.id,
    required this.word,
    required this.definition,
    required this.example,
    required this.type,
    required this.isAdded,
  });

  factory CartWordModel.fromJson(Map<String, dynamic> json) {
    return CartWordModel(
      id: json['id'] as String,
      word: json['word'] as String,
      definition: json['definition'] as String,
      example: json['example'] as String,
      type: json['type'] as String,
      isAdded: json['isAdded'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'definition': definition,
      'example': example,
      'type': type,
      'isAdded': isAdded,
    };
  }
}
