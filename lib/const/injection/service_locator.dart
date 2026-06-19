import 'package:get_it/get_it.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/const/utils/shared_preferences.dart';
import 'package:learning_language_app/features/favorites/data/data_sources/favorite_word_data_source.dart';
import 'package:learning_language_app/features/favorites/data/repositories/favorite_word_repository_impl.dart';
import 'package:learning_language_app/features/favorites/domain/repositories/favorite_word_repository.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/is_favorite_usecase.dart';
import 'package:learning_language_app/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:learning_language_app/features/flashcard/data/data_sources/flashcard_session_data_source.dart';
import 'package:learning_language_app/features/home/bloc/profile/profile_bloc.dart';
import 'package:learning_language_app/features/home/bloc/summary/summary_bloc.dart';
import 'package:learning_language_app/features/home/data/data_sources/profile_data_source.dart';
import 'package:learning_language_app/features/home/data/data_sources/summary_data_source.dart';
import 'package:learning_language_app/features/home/data/repositories/profile_repository_impl.dart';
import 'package:learning_language_app/features/home/data/repositories/summary_repository_impl.dart';
import 'package:learning_language_app/features/home/domain/repositories/profile_repository.dart';
import 'package:learning_language_app/features/home/domain/repositories/summary_repository.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_check_in_summary_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_leaderboard_me_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_leaderboard_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_new_word_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_profile_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/post_check_in_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/update_profile_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/upload_image_usecase.dart';
import 'package:learning_language_app/features/login/bloc/login_bloc.dart';
import 'package:learning_language_app/features/login/data/data_sources/auth_data_source.dart';
import 'package:learning_language_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:learning_language_app/features/login/domain/repositories/auth_repository.dart';
import 'package:learning_language_app/features/login/domain/usecases/logout_usecase.dart';
import 'package:learning_language_app/features/login/domain/usecases/sign_in_google_usecase.dart';
import 'package:learning_language_app/features/points/data/data_sources/points_data_source.dart';
import 'package:learning_language_app/features/points/data/repositories/points_repository_impl.dart';
import 'package:learning_language_app/features/points/domain/repositories/points_repository.dart';
import 'package:learning_language_app/features/points/domain/usecases/points_usecases.dart';
import 'package:learning_language_app/features/puzzle/data/data_sources/puzzle_session_data_source.dart';
import 'package:learning_language_app/features/quiz/data/data_sources/quiz_session_data_source.dart';
import 'package:learning_language_app/features/settings/data/data_sources/settings_data_source.dart';
import 'package:learning_language_app/features/word_store/bloc/cart_word/cart_word_bloc.dart';
import 'package:learning_language_app/features/word_store/bloc/word/word_bloc.dart';
import 'package:learning_language_app/features/word_store/data/data_sources/cart_word_data_source.dart';
import 'package:learning_language_app/features/word_store/data/data_sources/word_data_source.dart';
import 'package:learning_language_app/features/word_store/data/repositories/cart_word_repository_impl.dart';
import 'package:learning_language_app/features/word_store/data/repositories/word_repository_impl.dart';
import 'package:learning_language_app/features/word_store/domain/repositories/cart_word_repository.dart';
import 'package:learning_language_app/features/word_store/domain/repositories/word_repository.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/add_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_random_words_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_word_by_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/remove_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/search_words_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  NetworkService().initialize();

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  sl.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl());
  sl.registerLazySingleton<SummaryDataSource>(() => SummaryDataSourceImpl());
  sl.registerLazySingleton<CartWordDataSource>(() => CartWordDataSourceImpl());
  sl.registerLazySingleton<FavoriteWordDataSource>(
    () => FavoriteWordDataSourceImpl(),
  );
  sl.registerLazySingleton<WordDataSource>(() => WordDataSourceImpl());
  sl.registerLazySingleton<QuizSessionDataSource>(
    () => QuizSessionDataSourceImpl(),
  );
  sl.registerLazySingleton<PuzzleSessionDataSource>(
    () => PuzzleSessionDataSourceImpl(),
  );
  sl.registerLazySingleton<FlashcardSessionDataSource>(
    () => FlashcardSessionDataSourceImpl(),
  );
  sl.registerLazySingleton<SettingsDataSource>(
    () => SettingsDataSourceImpl(),
  );
  sl.registerLazySingleton<PointsDataSource>(() => PointsDataSourceImpl());

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SummaryRepository>(
    () => SummaryRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<CartWordRepository>(
    () => CartWordRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<FavoriteWordRepository>(
    () => FavoriteWordRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<WordRepository>(() => WordRepositoryImpl(sl()));
  sl.registerLazySingleton<PointsRepository>(
    () => PointsRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => SignInGoogleUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => GetProfileUsecase(sl()));
  sl.registerLazySingleton(() => UploadImageUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(sl()));
  sl.registerLazySingleton(() => GetCheckInSummaryUsecase(sl()));
  sl.registerLazySingleton(() => PostCheckInUsecase(sl()));
  sl.registerLazySingleton(() => GetNewWordUsecase(sl()));
  sl.registerLazySingleton(() => GetLeaderboardUsecase(sl()));
  sl.registerLazySingleton(() => GetLeaderboardMeUsecase(sl()));
  sl.registerLazySingleton(() => GetPointsRulesUsecase(sl()));
  sl.registerLazySingleton(() => GetPointsHistoryUsecase(sl()));
  sl.registerLazySingleton(() => GetCartWordUsecase(sl()));
  sl.registerLazySingleton(() => GetWordUsecase(sl()));
  sl.registerLazySingleton(() => SearchWordsUsecase(sl()));
  sl.registerLazySingleton(() => GetWordByWordUsecase(sl()));
  sl.registerLazySingleton(() => GetRandomWordsUsecase(sl()));
  sl.registerLazySingleton(() => AddCartWordUsecase(sl()));
  sl.registerLazySingleton(() => RemoveCartWordUsecase(sl()));
  sl.registerLazySingleton(() => GetFavoritesUsecase(sl()));
  sl.registerLazySingleton(() => AddFavoriteUsecase(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUsecase(sl()));
  sl.registerLazySingleton(() => IsFavoriteUsecase(sl()));

  sl.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  await sl.isReady<SharedPreferences>();
  sl.registerLazySingleton(() => SharedPref(sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );

  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => ProfileBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SummaryBloc(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => CartWordBloc(sl(), sl(), sl()));
  sl.registerFactory(() => WordBloc(sl()));

  NetworkService().attachAuthInterceptor(() => sl<SharedPref>().accessToken);
  NetworkService().attachTokenRefresh(
    refreshTokenProvider: () => sl<SharedPref>().refreshToken,
    onTokensRefreshed: (accessToken, refreshToken) =>
        sl<SharedPref>().saveTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        ),
  );
}
