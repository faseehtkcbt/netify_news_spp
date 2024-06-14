import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/loader.dart';
import '../../../../core/utils/news_list_tile.dart';
import '../bloc/bookmark_bloc.dart';

class GetBookmark extends StatelessWidget {
  const GetBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkBloc, BookmarkState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is BookmarkLoaded) {
          return state.news.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsListTile(newsEntity: state.news[index]);
                  },
                  itemCount: state.news.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                )
              : Center(
                  child: AppText(
                      text: 'No bookmarked subjects',
                      textStyle: Theme.of(context).textTheme.bodyMedium));
        } else if (state is BookmarkError) {
          return Center(
              child: AppText(
                  text: 'ERROR',
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
