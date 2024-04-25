import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:news_app/features/auth/domain/usecase/register_usecase.dart';
import 'package:news_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app/init_dependancy.dart';

class BlocProviders {
  BlocProviders._();

  static final dynamic providers = [
    BlocProvider(
        create: (context) => AuthBloc(
            registerUseCase: serviceLocator<RegisterUseCase>(),
            loginUseCase: serviceLocator<LoginUseCase>()))
  ];
}
