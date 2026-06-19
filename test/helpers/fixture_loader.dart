import 'dart:convert';
import 'dart:io';

/// Loads JSON fixtures from [assets/data/] for unit tests.
///
/// Runtime app code uses the live API; these files are kept as stable
/// test fixtures that mirror Vocaday API response shapes.
class FixtureLoader {
  FixtureLoader._();

  static const _assetDataDir = 'assets/data';

  static Future<dynamic> load(String fileName) async {
    final file = File('$_assetDataDir/$fileName');
    if (!file.existsSync()) {
      throw StateError('Fixture not found: ${file.path}');
    }
    return jsonDecode(await file.readAsString());
  }

  static Future<Map<String, dynamic>> asMap(String fileName) async {
    final data = await load(fileName);
    return Map<String, dynamic>.from(data as Map);
  }

  static Future<List<dynamic>> asList(String fileName) async {
    final data = await load(fileName);
    return List<dynamic>.from(data as List);
  }

  /// Wraps [vocab_words.json] into the paginated `/vocab` API shape.
  static Future<Map<String, dynamic>> vocabListResponse({
    int limit = 100,
    int offset = 0,
    String? q,
  }) async {
    final words = await asList('vocab_words.json');
    final filtered = q == null || q.isEmpty
        ? words
        : words.where((item) {
            final map = Map<String, dynamic>.from(item as Map);
            final word = (map['word'] as String).toLowerCase();
            final definition = (map['definition'] as String).toLowerCase();
            final query = q.toLowerCase();
            return word.contains(query) || definition.contains(query);
          }).toList();
    final slice = filtered.skip(offset).take(limit).toList();
    return {
      'items': slice,
      'total': filtered.length,
      'limit': limit,
      'offset': offset,
    };
  }

  static Future<Map<String, dynamic>> vocabByWord(String word) async {
    final words = await asList('vocab_words.json');
    final match = words.cast<Map<String, dynamic>>().firstWhere(
      (item) =>
          (item['word'] as String).toLowerCase() == word.toLowerCase(),
      orElse: () => words.first as Map<String, dynamic>,
    );
    return Map<String, dynamic>.from(match);
  }
}
