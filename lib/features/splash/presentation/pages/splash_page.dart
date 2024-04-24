import 'package:flutter/material.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/utils/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/app_icon.png',
                height: 125,
                width: 125,
                fit: BoxFit.cover,
              ),
            ),
            AppText(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              text: Constants.appName,
              fontWeight: FontWeight.w700,
              textSize: 24,
            )
          ],
        ),
      ),
    );
  }
}
