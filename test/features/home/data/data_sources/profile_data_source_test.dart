import 'package:flutter_test/flutter_test.dart';
import 'package:learning_language_app/features/home/data/data_sources/profile_data_source.dart';

import '../../../../helpers/fixture_loader.dart';
import '../../../../helpers/mock_dio.dart';

void main() {
  late ProfileDataSource dataSource;

  setUp(() async {
    final fixture = await FixtureLoader.asMap('profile.json');
    dataSource = ProfileDataSourceImpl(
      dio: createMockDio({
        '/profile': (_) => fixture,
      }),
    );
  });

  test('getProfile returns profile from fixture-backed mock API', () async {
    final profile = await dataSource.getProfile();

    expect(profile.email, 'user@example.com');
    expect(profile.name, 'John Doe');
    expect(profile.point, 100);
  });
}
