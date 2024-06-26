import 'package:flutter/material.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/features/auth/domain/entity/user_entity.dart';
import 'package:news_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:news_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:news_app/features/detailPage/presentation/pages/news_detail_page.dart';
import 'package:news_app/features/explore/domain/entity/source_detail_entity.dart';
import 'package:news_app/features/explore/presentation/pages/source_detail_page.dart';
import 'package:news_app/features/home/presentation/pages/home_page.dart';
import 'package:news_app/features/home/presentation/pages/latests.dart';
import 'package:news_app/features/home/presentation/pages/trendings.dart';
import 'package:news_app/features/profile/presentation/pages/country_select.dart';
import 'package:news_app/features/profile/presentation/pages/privacy_policy.dart';
import 'package:news_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:news_app/features/splash/presentation/pages/splash_page.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splash';
  static const String signUpPage = '/sign_up_page';
  static const String signInPage = '/sign_in_page';
  static const String homeScreen = '/home_screen';
  static const String trending = '/trending';
  static const String latest = '/latest';
  static const String detailPage = '/detail_page';
  static const String sourceDetailPage = '/source_detail_page';
  static const String selectCountryPage = '/select_country_page';
  static const String privacyPolicyPage = '/privacy_policy_page';
  static const String profilePage = '/profile_page';

  static final dynamic route = <String, WidgetBuilder>{
    splashScreen: (BuildContext context) => const SplashScreen(),
    signUpPage: (BuildContext context) => const SignUpPage(),
    signInPage: (BuildContext context) => const SignInPage(),
    homeScreen: (BuildContext context) => const HomePage(),
    trending: (BuildContext context) => const Trending(),
    latest: (BuildContext context) => const Latests(),
    privacyPolicyPage: (BuildContext context) => const PrivacyPolicyPage(),
    detailPage: (BuildContext context) {
      final result = ModalRoute.of(context)?.settings.arguments as NewsEntity;
      return NewsDetailPage(newsEntity: result);
    },
    sourceDetailPage: (BuildContext context) {
      final result =
          ModalRoute.of(context)?.settings.arguments as SourceDetailEntity;
      return SourceDetailPage(source: result);
    },
    selectCountryPage: (BuildContext context) => const CountrySelect(),
    profilePage: (BuildContext context) => const ProfileScreen(),
  };
}
