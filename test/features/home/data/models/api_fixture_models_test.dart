import 'package:flutter_test/flutter_test.dart';
import 'package:learning_language_app/features/home/data/models/check_in_summary/check_in_summary_model.dart';
import 'package:learning_language_app/features/home/data/models/leaderboard_response/leaderboard_response_model.dart';
import 'package:learning_language_app/features/home/data/models/profile/profile_model.dart';
import 'package:learning_language_app/features/home/data/models/vocab/vocab_model.dart';
import 'package:learning_language_app/features/word_store/data/models/word_model.dart';

import '../../../../helpers/fixture_loader.dart';

void main() {
  group('API fixture model parsing', () {
    test('ProfileModel parses profile.json', () async {
      final json = await FixtureLoader.asMap('profile.json');
      final model = ProfileModel.fromJson(json);

      expect(model.email, 'user@example.com');
      expect(model.name, 'John Doe');
      expect(model.point, 100);
    });

    test('CheckInSummaryModel parses check_in_summary.json', () async {
      final json = await FixtureLoader.asMap('check_in_summary.json');
      final model = CheckInSummaryModel.fromJson(json);

      expect(model.totalCheckInsPerWeek, 3);
      expect(model.totalCheckInsPerMonth, 12);
      expect(model.lastCheckInDate, DateTime(2025, 10, 1));
    });

    test('LeaderboardResponseModel parses leaderboard.json', () async {
      final json = await FixtureLoader.asMap('leaderboard.json');
      final model = LeaderboardResponseModel.fromJson(json);

      expect(model.points.first.name, 'Aryo');
      expect(model.attendance.first.rank, 1);
    });

    test('VocabModel parses first vocab_words.json entry', () async {
      final words = await FixtureLoader.asList('vocab_words.json');
      final model = VocabModel.fromJson(
        Map<String, dynamic>.from(words.first as Map),
      );

      expect(model.word, 'mono');
      expect(model.synonyms, contains('single'));
      expect(model.type, 'adjective');
    });

    test('WordModel parses vocab_words.json entries', () async {
      final words = await FixtureLoader.asList('vocab_words.json');
      final model = WordModel.fromJson(
        Map<String, dynamic>.from(words.first as Map),
      );

      expect(model.id, '1');
      expect(model.word, 'mono');
      expect(model.definition, isNotEmpty);
    });
  });
}
