import 'package:flutter/material.dart';
import 'package:news_app/core/entity/news_entity.dart';

import '../../config/route/routes.dart';
import '../color_pallette/app_pallette.dart';
import 'app_text.dart';
import 'get_fav_icon.dart';
import 'network_icon.dart';
import 'network_image.dart';

class NewsListTile extends StatelessWidget {
  final NewsEntity newsEntity;
  const NewsListTile({super.key, required this.newsEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailPage, arguments: newsEntity);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 110,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NetworkImageUrl(
              url: newsEntity.urlToImage ??
                  "https://img.freepik.com/premium-vector/breaking-news-template-with-3d-red-blue-badge-breaking-news-text-dark-blue-with-earth-world-map-background_34645-1113.jpg?w=740",
              height: 80,
              width: 80,
              radius: 5,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: newsEntity.author ?? "",
                    textColor: AppPellete.borderColor,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    textSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  AppText(
                    text: newsEntity.title ?? "",
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    fontWeight: FontWeight.w500,
                    textSize: 14,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NetworkIcon(
                        url: getFavIcon(newsEntity.url ?? ""),
                        radius: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppText(
                        text: newsEntity.source.name ?? "",
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        textSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText(
                        text: newsEntity.publishedAt!.split('T').first,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        textSize: 12,
                        fontWeight: FontWeight.w500,
                        textColor: AppPellete.borderColor,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
