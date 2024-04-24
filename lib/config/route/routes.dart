import 'package:flutter/material.dart';
import 'package:news_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:news_app/features/splash/presentation/pages/splash_page.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splash';
  static const String signUpPage = '/sign_up_page';

  static final dynamic route = <String, WidgetBuilder>{
    splashScreen: (BuildContext context) => const SplashScreen(),
    signUpPage: (BuildContext context) => const SignUpPage()
  };
}
