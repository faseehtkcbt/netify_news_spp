import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/utils/app_text.dart';
import '../../../../config/route/routes.dart';
import '../bloc/checkloggedin_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<CheckloggedinBloc>().add(IsLoggedIn());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CheckloggedinBloc, CheckloggedinState>(
        listener: (context, state) {
          if (state is CheckloggedinLoaded) {
            if (state.isLogged == true) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeScreen, (listen) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.signInPage, (listen) => false);
            }
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
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
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  text: Constants.appName,
                  fontWeight: FontWeight.w700,
                  textSize: 24,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
