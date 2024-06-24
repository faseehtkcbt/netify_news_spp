import 'package:flutter/material.dart';
import 'package:news_app/core/color_pallette/app_pallette.dart';

import 'app_text.dart';

void showAppSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      backgroundColor:AppPellete.themeColor ,
        content: AppText(
      text: content,
      textStyle: Theme.of(context).textTheme.bodyMedium,
          textColor: Colors.white,
    )));
}
