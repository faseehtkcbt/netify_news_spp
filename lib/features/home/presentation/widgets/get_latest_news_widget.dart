import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/loader.dart';
import '../../../../core/utils/news_list_tile.dart';
import '../bloc/latest/news_bloc.dart';

class GetLatestNewsWidget extends StatefulWidget {
  const GetLatestNewsWidget({super.key});

  @override
  State<GetLatestNewsWidget> createState() => _GetLatestNewsWidgetState();
}

class _GetLatestNewsWidgetState extends State<GetLatestNewsWidget> {
  @override
  void initState() {
    context.read<NewsBloc>().add(GetLatest(""));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      builder: (BuildContext context, newsState) {
        if (newsState is NewsFailure) {
          return Center(
              child: AppText(
                  text: 'ERROR',
                  textStyle: Theme.of(context).textTheme.bodyMedium));
        } else if (newsState is NewsLoaded) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsListTile(newsEntity: newsState.news[index]);
            },
            shrinkWrap: true,
            itemCount: newsState.news.length,
          );
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
