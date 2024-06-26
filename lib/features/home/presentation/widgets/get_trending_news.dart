import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/snackbar.dart';
import 'package:news_app/features/home/presentation/bloc/trending/trending_bloc.dart';

import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/loader.dart';
import '../../../../core/utils/news_card.dart';

class GetTrendingNewsList extends StatefulWidget {
  const GetTrendingNewsList({super.key});

  @override
  State<GetTrendingNewsList> createState() => _GetTrendingNewsListState();
}

class _GetTrendingNewsListState extends State<GetTrendingNewsList> {
  @override
  void initState() {
    context.read<TrendingBloc>().add(GetTrendings());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingBloc, TrendingState>(
      builder: (BuildContext context, newsState) {
        if (newsState is TrendingFailure) {
          return Center(
              child: AppText(
                  text: 'Something went wrong',
                  textStyle: Theme.of(context).textTheme.bodyMedium));
        } else if (newsState is TrendingLoaded) {
          return newsState.news.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) =>
                      NewsCard(newsState.news[index]),
                  itemCount: newsState.news.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                )
              : Center(
                  child: AppText(
                      text: 'No Trending newses',
                      textStyle: Theme.of(context).textTheme.bodyMedium));
        } else {
          return const Center(
            child: Loader(),
          );
        }
      },
      listener: (BuildContext context, Object? state) {
        if (state is TrendingFailure) {
          showAppSnackBar(context, state.failure.message);
        }
      },
    );
  }
}
