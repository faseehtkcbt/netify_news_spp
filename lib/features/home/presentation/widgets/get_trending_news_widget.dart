import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/bloc/trending/trending_bloc.dart';

import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/loader.dart';
import '../../../../core/utils/news_card.dart';

class GetTrendingNewsWidget extends StatefulWidget {
  const GetTrendingNewsWidget({super.key});

  @override
  State<GetTrendingNewsWidget> createState() => _GetTrendingNewsWidgetState();
}

class _GetTrendingNewsWidgetState extends State<GetTrendingNewsWidget> {
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
                  text: 'ERROR',
                  textStyle: Theme.of(context).textTheme.bodyMedium));
        } else if (newsState is TrendingLoaded) {
          return NewsCard(newsState.news[0]);
        } else {
          return const Center(
            child: Loader(),
          );
        }
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
