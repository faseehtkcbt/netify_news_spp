import 'package:get_it/get_it.dart';
import 'package:news_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:news_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:news_app/features/auth/domain/repository/auth_repository.dart';
import 'package:news_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:news_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:news_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/credentials/credentials.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supaBase = await Supabase.initialize(
      url: Credentials.url, anonKey: Credentials.annonKey);
  serviceLocator.registerLazySingleton<SupabaseClient>(() => supaBase.client);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthDataSource>(
        () => AuthDatasouceImpl(serviceLocator<SupabaseClient>()))
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImplementation(serviceLocator<AuthDataSource>()))
    ..registerFactory<RegisterUseCase>(
        () => RegisterUseCase(serviceLocator<AuthRepository>()))
    ..registerFactory<LoginUseCase>(
        () => LoginUseCase(serviceLocator<AuthRepository>()))
    ..registerLazySingleton<AuthBloc>(() => AuthBloc(
        registerUseCase: serviceLocator<RegisterUseCase>(),
        loginUseCase: serviceLocator<LoginUseCase>()));
}
