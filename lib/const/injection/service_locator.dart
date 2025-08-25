import 'package:get_it/get_it.dart';
import 'package:learning_language_app/const/injection/network_service.dart';
import 'package:learning_language_app/const/utils/shared_preferences.dart';
import 'package:learning_language_app/features/home/bloc/profile/profile_bloc.dart';
import 'package:learning_language_app/features/home/bloc/summary/summary_bloc.dart';
import 'package:learning_language_app/features/home/data/data_sources/profile_data_source.dart';
import 'package:learning_language_app/features/home/data/data_sources/summary_data_source.dart';
import 'package:learning_language_app/features/home/data/repositories/profile_repository_impl.dart';
import 'package:learning_language_app/features/home/data/repositories/summary_repository_impl.dart';
import 'package:learning_language_app/features/home/domain/repositories/profile_repository.dart';
import 'package:learning_language_app/features/home/domain/repositories/summary_repository.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_check_in_summary_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_leaderboard_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_new_word_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/get_profile_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/update_profile_usecase.dart';
import 'package:learning_language_app/features/home/domain/usecases/upload_image_usecase.dart';
import 'package:learning_language_app/features/login/bloc/login_bloc.dart';
import 'package:learning_language_app/features/login/data/data_sources/auth_data_source.dart';
import 'package:learning_language_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:learning_language_app/features/login/domain/repositories/auth_repository.dart';
import 'package:learning_language_app/features/login/domain/usecases/sign_in_google_usecase.dart';
import 'package:learning_language_app/features/word_store/bloc/cart_word/cart_word_bloc.dart';
import 'package:learning_language_app/features/word_store/bloc/word/word_bloc.dart';
import 'package:learning_language_app/features/word_store/data/data_sources/cart_word_data_source.dart';
import 'package:learning_language_app/features/word_store/data/data_sources/word_data_source.dart';
import 'package:learning_language_app/features/word_store/data/repositories/cart_word_repository_impl.dart';
import 'package:learning_language_app/features/word_store/data/repositories/word_repository_impl.dart';
import 'package:learning_language_app/features/word_store/domain/repositories/cart_word_repository.dart';
import 'package:learning_language_app/features/word_store/domain/repositories/word_repository.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_cart_word_usecase.dart';
import 'package:learning_language_app/features/word_store/domain/usecases/get_word_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  // Initialize Network Service
  NetworkService().initialize();

  // Data Sources
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  sl.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl());
  sl.registerLazySingleton<SummaryDataSource>(() => SummaryDataSourceImpl());
  sl.registerLazySingleton<CartWordDataSource>(() => CartWordDataSourceImpl(sl()));
  sl.registerLazySingleton<WordDataSource>(() => WordDataSourceImpl());

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SummaryRepository>(
    () => SummaryRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<CartWordRepository>(
    () => CartWordRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<WordRepository>(
    () => WordRepositoryImpl(sl()),
  );

  // Usecase
  sl.registerLazySingleton(() => SignInGoogleUsecase(sl()));
  sl.registerLazySingleton(() => GetProfileUsecase(sl()));
  sl.registerLazySingleton(() => UploadImageUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(sl()));
  sl.registerLazySingleton(() => GetCheckInSummaryUsecase(sl()));
  sl.registerLazySingleton(() => GetNewWordUsecase(sl()));
  sl.registerLazySingleton(() => GetLeaderboardUsecase(sl()));
  sl.registerLazySingleton(() => GetCartWordUsecase(sl()));
  sl.registerLazySingleton(() => GetWordUsecase(sl()));

  // BLoCs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => ProfileBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SummaryBloc(sl(), sl(), sl()));
  sl.registerFactory(() => CartWordBloc(sl()));
  sl.registerFactory(() => WordBloc(sl()));

  // Utils
  sl.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );
  await sl.isReady<SharedPreferences>();
  sl.registerLazySingleton(() => SharedPref(sl()));
}
