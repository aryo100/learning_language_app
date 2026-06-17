import 'package:flutter_test/flutter_test.dart';

import '../helpers/fixture_loader.dart';

void main() {
  group('FixtureLoader', () {
    test('loads profile.json', () async {
      final data = await FixtureLoader.asMap('profile.json');
      expect(data['email'], 'user@example.com');
      expect(data['name'], 'John Doe');
    });

    test('loads check_in_summary.json', () async {
      final data = await FixtureLoader.asMap('check_in_summary.json');
      expect(data['totalCheckInsPerWeek'], 3);
      expect(data['totalCheckInsPerMonth'], 12);
    });

    test('loads leaderboard.json', () async {
      final data = await FixtureLoader.asMap('leaderboard.json');
      expect(data['points'], isA<List>());
      expect(data['attendance'], isA<List>());
      expect((data['points'] as List).length, greaterThan(0));
    });

    test('wraps vocab_words.json into paginated API shape', () async {
      final data = await FixtureLoader.vocabListResponse(limit: 2, offset: 0);
      expect(data['total'], greaterThan(0));
      expect(data['limit'], 2);
      expect(data['offset'], 0);
      expect((data['items'] as List).length, 2);
    });
  });
}
