import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/loader.dart';
import 'package:news_app/core/utils/news_list_tile.dart';
import 'package:news_app/core/utils/snackbar.dart';
import 'package:news_app/features/explore/presentation/bloc/explore_bloc.dart';

import '../../../../core/utils/app_text.dart';

class RecentNewsWidget extends StatefulWidget {
  final String source;
  const RecentNewsWidget({super.key, required this.source});

  @override
  State<RecentNewsWidget> createState() => _RecentNewsWidgetState();
}

class _RecentNewsWidgetState extends State<RecentNewsWidget> {
  @override
  void initState() {
    context.read<ExploreBloc>().add(RecentNews(widget.source));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreBloc, ExploreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ExploreFailure) {
          return Center(
              child: AppText(
                  text: 'Something went wrong',
                  textStyle: Theme.of(context).textTheme.bodyMedium));
        } else if (state is ExploreLoaded) {
          return state.data.isNotEmpty
              ? ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      NewsListTile(newsEntity: state.data[index]))
              : Center(
                  child: AppText(
                      text: 'No updates on this source',
                      textStyle: Theme.of(context).textTheme.bodyMedium));
        } else {
          return const Center(
            child: Loader(),
          );
        }
      },
    );
  }
}
