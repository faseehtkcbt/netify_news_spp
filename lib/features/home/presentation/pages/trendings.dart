import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/bloc/trending/trending_bloc.dart';
import 'package:news_app/features/home/presentation/widgets/get_trending_news.dart';

import '../../../../core/utils/app_text.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  void initState() {
    context.read<TrendingBloc>().add(GetTrendings());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Trendings',
          textStyle: Theme.of(context).textTheme.titleMedium,
          textSize: 20,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: const GetTrendingNewsList(),
      ),
    );
  }
}
