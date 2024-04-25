import 'package:flutter/material.dart';

import 'app_text.dart';

void showAppSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: AppText(
      text: content,
      textColor: Colors.black87,
      textStyle: Theme.of(context).textTheme.bodyMedium,
    )));
}
