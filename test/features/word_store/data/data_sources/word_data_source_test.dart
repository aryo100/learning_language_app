import 'package:flutter_test/flutter_test.dart';
import 'package:learning_language_app/features/word_store/data/data_sources/word_data_source.dart';

import '../../../../helpers/fixture_loader.dart';
import '../../../../helpers/mock_dio.dart';

void main() {
  late WordDataSource dataSource;

  setUp(() async {
    dataSource = WordDataSourceImpl(
      dio: createMockDio({
        '/vocab': (options) async {
          final limit = int.parse(
            options.queryParameters['limit']?.toString() ?? '100',
          );
          final offset = int.tryParse(
                options.queryParameters['offset']?.toString() ?? '0',
              ) ??
              0;
          return FixtureLoader.vocabListResponse(
            limit: limit,
            offset: offset,
          );
        },
      }),
    );
  });

  test('getWords returns words from vocab fixture', () async {
    final words = await dataSource.getWords();

    expect(words, isNotEmpty);
    expect(words.first.word, 'mono');
    expect(words.first.id, '1');
  });

  test('getVocabTotal returns total from vocab fixture', () async {
    final total = await dataSource.getVocabTotal();
    final words = await FixtureLoader.asList('vocab_words.json');

    expect(total, words.length);
  });
}
