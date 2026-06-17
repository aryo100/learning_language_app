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
  }) async {
    final words = await asList('vocab_words.json');
    final slice = words.skip(offset).take(limit).toList();
    return {
      'items': slice,
      'total': words.length,
      'limit': limit,
      'offset': offset,
    };
  }
}
