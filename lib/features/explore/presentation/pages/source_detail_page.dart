import 'package:flutter/material.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';
import 'package:news_app/core/utils/app_text.dart';
import 'package:news_app/core/utils/get_fav_icon.dart';
import 'package:news_app/core/utils/network_icon.dart';
import 'package:news_app/features/explore/domain/entity/source_detail_entity.dart';
import 'package:news_app/features/explore/presentation/widgets/recent_news_widget.dart';

class SourceDetailPage extends StatefulWidget {
  final SourceDetailEntity source;
  const SourceDetailPage({super.key, required this.source});

  @override
  State<SourceDetailPage> createState() => _SourceDetailPageState();
}

class _SourceDetailPageState extends State<SourceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NetworkIcon(radius: 100, url: getFavIcon(widget.source.url)),
              const SizedBox(
                height: 10,
              ),
              AppText(
                  text: widget.source.name,
                  textColor: AppPellete.themeColor,
                  textStyle: Theme.of(context).textTheme.titleMedium),
              const SizedBox(
                height: 10,
              ),
              AppText(
                text: widget.source.description,
                textStyle: Theme.of(context).textTheme.bodyMedium,
                textColor: AppPellete.borderColor,
                fontWeight: FontWeight.w500,
                textSize: 14,
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              AppText(
                text: 'Recent News',
                textStyle: Theme.of(context).textTheme.titleMedium,
                textSize: 17,
              ),
              Expanded(
                flex: 0,
                child: RecentNewsWidget(
                  source: widget.source.id,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
