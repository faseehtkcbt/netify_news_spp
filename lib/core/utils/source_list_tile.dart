import 'package:flutter/material.dart';
import 'package:news_app/core/utils/get_fav_icon.dart';
import 'package:news_app/core/utils/network_icon.dart';
import 'package:news_app/features/explore/domain/entity/source_detail_entity.dart';

import '../../config/route/routes.dart';
import '../color_pallette/app_pallette.dart';
import 'app_text.dart';

class SourceListTile extends StatelessWidget {
  final SourceDetailEntity data;
  const SourceListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.sourceDetailPage, arguments: data);
      },
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NetworkIcon(radius: 60, url: getFavIcon(data.url)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  text: data.name,
                  textSize: 14,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  text: data.description,
                  textColor: AppPellete.borderColor,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w500,
                  textSize: 12,
                  maxLines: 2,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
