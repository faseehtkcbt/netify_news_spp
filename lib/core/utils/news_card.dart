import 'package:flutter/material.dart';
import 'package:news_app/config/route/routes.dart';
import 'package:news_app/core/entity/news_entity.dart';
import 'package:news_app/core/utils/get_fav_icon.dart';
import 'package:news_app/core/utils/network_icon.dart';

import '../color_pallette/app_pallette.dart';
import 'app_text.dart';
import 'network_image.dart';

class NewsCard extends StatelessWidget {
  final NewsEntity newsEntity;
  const NewsCard(this.newsEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailPage, arguments: newsEntity);
      },
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageUrl(
              height: 180,
              width: 500,
              radius: 5,
              url: newsEntity.urlToImage ??
                  "https://img.freepik.com/premium-vector/breaking-news-template-with-3d-red-blue-badge-breaking-news-text-dark-blue-with-earth-world-map-background_34645-1113.jpg?w=740",
            ),
            const SizedBox(
              height: 5,
            ),
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
              textSize: 14,
              maxLines: 2,
              fontWeight: FontWeight.w500,
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
                  radius: 25,
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
      ),
    );
  }
}
