import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/core/internet/connection_checker.dart';
import 'package:news_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:news_app/features/auth/data/datasource/local_auth_datasource.dart';
import 'package:news_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';
import 'package:news_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:news_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:news_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app/features/bookmark/data/datasource/local_bookmark_data_source.dart';
import 'package:news_app/features/bookmark/data/repository_imp/bookmark_repo_impl.dart';
import 'package:news_app/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:news_app/features/bookmark/domain/useCase/check_bookmark_useCase.dart';
import 'package:news_app/features/bookmark/domain/usecase/get_bookmark_usecase.dart';
import 'package:news_app/features/bookmark/domain/usecase/insert_bookmark_usecase.dart';
import 'package:news_app/features/bookmark/domain/usecase/remove_bookmark_usecase.dart';
import 'package:news_app/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:news_app/features/bookmark/presentation/cubit/bookmark_check_cubit.dart';
import 'package:news_app/features/explore/data/datasource/explore_datasource.dart';
import 'package:news_app/features/explore/data/repository_impl/explore_repository_impl.dart';
import 'package:news_app/features/explore/domain/repository/explore_repository.dart';
import 'package:news_app/features/explore/domain/usecase/get_query_news.dart';
import 'package:news_app/features/explore/domain/usecase/get_recent_news.dart';
import 'package:news_app/features/explore/domain/usecase/get_sources.dart';
import 'package:news_app/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:news_app/features/explore/presentation/bloc/source_bloc.dart';
import 'package:news_app/features/home/data/datasource/datasource.dart';
import 'package:news_app/features/home/data/repo_impl/news_repo_impl.dart';
import 'package:news_app/features/home/domain/repository/news_repository.dart';
import 'package:news_app/features/home/domain/usecase/get_trending_news.dart';
import 'package:news_app/features/home/domain/usecase/get_latest.dart';
import 'package:news_app/features/home/presentation/bloc/latest/news_bloc.dart';
import 'package:news_app/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:news_app/features/splash/data/repo_impl/splash_repository_impl.dart';
import 'package:news_app/features/splash/domain/repository/splash_repository.dart';
import 'package:news_app/features/splash/domain/usecase/is_logged_in_usecase.dart';
import 'package:news_app/features/splash/presentation/bloc/checkloggedin_bloc.dart';
import 'package:news_app/firebase_options.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'features/splash/data/datasource/local_splash_datasource.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initNews();
  _initAuth();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  final Database database = await _initDatabase();
  serviceLocator
    ..registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instanceFor(app: firebaseApp))
    ..registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instanceFor(app: firebaseApp))
    ..registerLazySingleton<Database>(() => database)
    ..registerLazySingleton<SharedPreferences>(() => pref);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthDataSource>(() => AuthDatasourceImpl(
        serviceLocator<FirebaseAuth>(),
        serviceLocator<FirebaseFirestore>(),
        serviceLocator<ConnectionChecker>()))
    ..registerFactory<LocalAuthDatasource>(
        () => LocalAuthDatasourceImpl(serviceLocator<SharedPreferences>()))
    ..registerFactory<AuthRepository>(() => AuthRepositoryImplementation(
        serviceLocator<AuthDataSource>(),
        serviceLocator<LocalAuthDatasource>()))
    ..registerFactory<RegisterUseCase>(
        () => RegisterUseCase(serviceLocator<AuthRepository>()))
    ..registerFactory<LoginUseCase>(
        () => LoginUseCase(serviceLocator<AuthRepository>()))
    ..registerLazySingleton<AuthBloc>(() => AuthBloc(
        registerUseCase: serviceLocator<RegisterUseCase>(),
        loginUseCase: serviceLocator<LoginUseCase>()))
    ..registerFactory<LocalSplashDatasource>(
        () => LocalSplashDatasourceImpl(serviceLocator<SharedPreferences>()))
    ..registerFactory<SplashRepository>(
        () => SplashRepositoryImpl(serviceLocator<LocalSplashDatasource>()))
    ..registerFactory<IsLoggedInUsecase>(
        () => IsLoggedInUsecase(serviceLocator<SplashRepository>()))
    ..registerLazySingleton<CheckloggedinBloc>(
        () => CheckloggedinBloc(serviceLocator<IsLoggedInUsecase>()));
}

void _initNews() {
  serviceLocator
    ..registerFactory<InternetConnection>(() => InternetConnection())
    ..registerFactory<ConnectionChecker>(
        () => ConnectionCheckerImpl(serviceLocator<InternetConnection>()))
    ..registerFactory<HomeDataSource>(
        () => HomeDataSourceImpl(serviceLocator<ConnectionChecker>()))
    ..registerFactory<NewsRepository>(
        () => NewsRepositoryImpl(serviceLocator<HomeDataSource>()))
    ..registerFactory<GetTrendingNews>(
        () => GetTrendingNews(serviceLocator<NewsRepository>()))
    ..registerFactory<GetLatestNews>(
        () => GetLatestNews(serviceLocator<NewsRepository>()))
    ..registerLazySingleton<NewsBloc>(
        () => NewsBloc(serviceLocator<GetLatestNews>()))
    ..registerLazySingleton<TrendingBloc>(
        () => TrendingBloc(serviceLocator<GetTrendingNews>()))
    ..registerFactory<ExploreDatasource>(
        () => ExploreDataSourceImpl(serviceLocator<ConnectionChecker>()))
    ..registerFactory<ExploreRepository>(
        () => ExploreRepositoryImpl(serviceLocator<ExploreDatasource>()))
    ..registerFactory<GetQueryNews>(
        () => GetQueryNews(serviceLocator<ExploreRepository>()))
    ..registerFactory<GetSourcesDetails>(
        () => GetSourcesDetails(serviceLocator<ExploreRepository>()))
    ..registerFactory<GetRecentNewses>(
        () => GetRecentNewses(serviceLocator<ExploreRepository>()))
    ..registerLazySingleton<ExploreBloc>(() => ExploreBloc(
        getQueryNews: serviceLocator<GetQueryNews>(),
        getRecentNewses: serviceLocator<GetRecentNewses>()))
    ..registerLazySingleton<SourceBloc>(() =>
        SourceBloc(getSourcesDetails: serviceLocator<GetSourcesDetails>()))
    ..registerFactory<LocalBookmarkDataSource>(
        () => LocalBookmarkDataSourceImpl(serviceLocator<Database>()))
    ..registerFactory<BookmarkRepository>(
        () => BookmarkRepoImpl(serviceLocator<LocalBookmarkDataSource>()))
    ..registerFactory<InsertBookmarkUsecase>(
        () => InsertBookmarkUsecase(serviceLocator<BookmarkRepository>()))
    ..registerFactory<CheckBookmarkUsecase>(
        () => CheckBookmarkUsecase(serviceLocator<BookmarkRepository>()))
    ..registerFactory<GetBookmarkUsecase>(
        () => GetBookmarkUsecase(serviceLocator<BookmarkRepository>()))
    ..registerFactory<RemoveBookmarkUsecase>(
        () => RemoveBookmarkUsecase(serviceLocator<BookmarkRepository>()))
    ..registerLazySingleton<BookmarkBloc>(
        () => BookmarkBloc(serviceLocator<GetBookmarkUsecase>()))
    ..registerLazySingleton<BookmarkCheckCubit>(() => BookmarkCheckCubit(
        serviceLocator<CheckBookmarkUsecase>(),
        serviceLocator<InsertBookmarkUsecase>(),
        serviceLocator<RemoveBookmarkUsecase>()));
}

Future<Database> _initDatabase() async {
  String path = join(await getDatabasesPath(), 'news_database.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );
}

Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
      CREATE TABLE news (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sourceId TEXT,
        sourceName TEXT,
        author TEXT,
        title TEXT,
        description TEXT,
        url TEXT,
        urlToImage TEXT,
        publishedAt TEXT,
        content TEXT
      )
    ''');
}
