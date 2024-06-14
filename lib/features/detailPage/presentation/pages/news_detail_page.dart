import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/get_fav_icon.dart';
import 'package:news_app/core/utils/launch_in_app.dart';
import 'package:news_app/core/utils/network_icon.dart';
import 'package:news_app/core/utils/network_image.dart';
import 'package:news_app/features/bookmark/presentation/cubit/bookmark_check_cubit.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsEntity newsEntity;
  const NewsDetailPage({super.key, required this.newsEntity});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  void initState() {
    context.read<BookmarkCheckCubit>().checkBookmark(widget.newsEntity);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_outlined)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NetworkIcon(
                      radius: 50, url: getFavIcon(widget.newsEntity.url ?? "")),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: widget.newsEntity.source.name ?? "",
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(
                          text: widget.newsEntity.publishedAt!.split('T').first,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          textSize: 13,
                          textColor: AppPellete.borderColor,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        await UrlLauncherMethods().launchInBrowserView(
                            Uri.parse(widget.newsEntity.url ?? ""));
                      },
                      icon: const Icon(Icons.open_in_browser_outlined)),
                  BlocConsumer<BookmarkCheckCubit, BookmarkCheckState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is BookmarkCheckLoaded) {
                        return state.check
                            ? IconButton(
                                onPressed: () async {
                                  context
                                      .read<BookmarkCheckCubit>()
                                      .removeBookmark(widget.newsEntity);
                                },
                                icon: const Icon(Icons.bookmark_outlined))
                            : IconButton(
                                onPressed: () async {
                                  context
                                      .read<BookmarkCheckCubit>()
                                      .insertBookmark(widget.newsEntity);
                                },
                                icon: const Icon(Icons.bookmark_outline));
                      } else if (state is BookmarkCheckFailure) {
                        return const Icon(
                          Icons.warning_rounded,
                          color: AppPellete.errorColor,
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              NetworkImageUrl(
                  url: widget.newsEntity.urlToImage ?? "",
                  height: 200,
                  width: double.infinity),
              const SizedBox(
                height: 5,
              ),
              AppText(
                text: widget.newsEntity.author ?? "",
                textColor: AppPellete.borderColor,
                textStyle: Theme.of(context).textTheme.bodyMedium,
                textSize: 15,
                fontWeight: FontWeight.w500,
              ),
              AppText(
                text: widget.newsEntity.title ?? "",
                textStyle: Theme.of(context).textTheme.titleMedium,
                fontWeight: FontWeight.w500,
                textSize: 20,
                maxLines: 4,
              ),
              const SizedBox(
                height: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              AppText(
                text: widget.newsEntity.description ?? "",
                textStyle: Theme.of(context).textTheme.bodyMedium,
                fontWeight: FontWeight.w500,
                textSize: 15,
                textColor: AppPellete.borderColor,
                maxLines: 10,
              ),
              AppText(
                text: widget.newsEntity.content ?? "",
                textStyle: Theme.of(context).textTheme.bodyMedium,
                fontWeight: FontWeight.w500,
                textSize: 15,
                textColor: AppPellete.borderColor,
                maxLines: 7,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
