import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/theme.dart';
import 'package:news_app/core/bloc/providers/bloc_providers.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/splash/presentation/pages/splash_page.dart';
import 'package:news_app/init_dependancy.dart';
import 'config/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: BlocProviders.providers,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: AppTheme.lightTheme,
      routes: Routes.route,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
