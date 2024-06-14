import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:news_app/features/bookmark/presentation/cubit/bookmark_check_cubit.dart';
import 'package:news_app/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:news_app/features/explore/presentation/bloc/source_bloc.dart';
import 'package:news_app/features/home/presentation/bloc/latest/news_bloc.dart';
import 'package:news_app/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:news_app/features/splash/presentation/bloc/checkloggedin_bloc.dart';
import 'package:news_app/init_dependancy.dart';

class BlocProviders {
  BlocProviders._();

  static final dynamic providers = [
    BlocProvider<AuthBloc>(create: (context) => serviceLocator<AuthBloc>()),
    BlocProvider<NewsBloc>(create: (_) => serviceLocator<NewsBloc>()),
    BlocProvider<TrendingBloc>(create: (_) => serviceLocator<TrendingBloc>()),
    BlocProvider<ExploreBloc>(create: (_) => serviceLocator<ExploreBloc>()),
    BlocProvider<SourceBloc>(create: (_) => serviceLocator<SourceBloc>()),
    BlocProvider<BookmarkBloc>(create: (_) => serviceLocator<BookmarkBloc>()),
    BlocProvider<BookmarkCheckCubit>(
        create: (_) => serviceLocator<BookmarkCheckCubit>()),
    BlocProvider<CheckloggedinBloc>(create: (_)=>serviceLocator<CheckloggedinBloc>())
  ];
}
