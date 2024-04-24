import 'package:flutter/material.dart';
import 'package:news_app/config/theme/theme.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/splash/presentation/pages/splash_page.dart';
import 'package:news_app/init_dependancy.dart';
import 'config/route/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependancies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: AppTheme.lightTheme,
      routes: Routes.route,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
