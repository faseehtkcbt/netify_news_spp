import 'package:flutter/material.dart';
import 'package:news_app/config/route/routes.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/features/home/presentation/widgets/get_latest_news_widget.dart';
import 'package:news_app/features/home/presentation/widgets/get_trending_news_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: Constants.appName,
          textStyle: Theme.of(context).textTheme.titleMedium,
          textColor: AppPellete.themeColor,
          textSize: 25,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Trending',
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.trending);
                    },
                    child: AppText(
                      text: 'See all',
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      textColor: AppPellete.themeColor,
                      textSize: 14,
                    ),
                  )
                ],
              ),
              const GetTrendingNewsWidget(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Latest',
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.latest);
                    },
                    child: AppText(
                      text: 'See all',
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      textColor: AppPellete.themeColor,
                      textSize: 14,
                    ),
                  )
                ],
              ),
              const GetLatestNewsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
