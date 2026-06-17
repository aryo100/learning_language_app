import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// Loads JSON bundled under [assets/data/] at runtime (e.g. widget tests).
///
/// Production data sources use the live API. For unit tests, prefer
/// [FixtureLoader] in `test/helpers/fixture_loader.dart`.
class JsonLoader {
  JsonLoader._();

  static Future<dynamic> load(String path) async {
    final stringData = await rootBundle.loadString(path);
    return jsonDecode(stringData);
  }
}