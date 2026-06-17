import 'package:flutter_test/flutter_test.dart';
import 'package:learning_language_app/features/home/data/data_sources/summary_data_source.dart';

import '../../../../helpers/fixture_loader.dart';
import '../../../../helpers/mock_dio.dart';

void main() {
  group('SummaryDataSourceImpl', () {
    test('getCheckInSummary returns fixture data', () async {
      final fixture = await FixtureLoader.asMap('check_in_summary.json');
      final dataSource = SummaryDataSourceImpl(
        dio: createMockDio({
          '/checkin': (_) => fixture,
        }),
      );

      final summary = await dataSource.getCheckInSummary();

      expect(summary.totalCheckInsPerWeek, 3);
      expect(summary.totalCheckInsPerMonth, 12);
    });

    test('getLeaderboard returns fixture data', () async {
      final fixture = await FixtureLoader.asMap('leaderboard.json');
      final dataSource = SummaryDataSourceImpl(
        dio: createMockDio({
          '/leaderboard': (_) => fixture,
        }),
      );

      final leaderboard = await dataSource.getLeaderboard();

      expect(leaderboard.points.first.name, 'Aryo');
      expect(leaderboard.attendance, isNotEmpty);
    });

    test('getNewWord picks a word from paginated vocab fixture', () async {
      final dataSource = SummaryDataSourceImpl(
        dio: createMockDio({
          '/vocab': (options) async {
            final limit = options.queryParameters['limit'];
            final offset = int.tryParse(
                  options.queryParameters['offset']?.toString() ?? '0',
                ) ??
                0;
            return FixtureLoader.vocabListResponse(
              limit: int.parse(limit.toString()),
              offset: offset,
            );
          },
        }),
      );

      final vocab = await dataSource.getNewWord();

      expect(vocab.word, isNotEmpty);
      expect(vocab.definition, isNotEmpty);
    });
  });
}
