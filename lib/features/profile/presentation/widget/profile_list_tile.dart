import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_text.dart';

import '../../../../core/color_pallette/app_pallette.dart';

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String listTitle;
  final void Function() onTap;
  const ProfileListTile(
      {super.key,
      required this.icon,
      required this.listTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          size: 23,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppPellete.themeColor)),
        title: AppText(
          text: listTitle,
          textStyle: Theme.of(context).textTheme.bodyMedium,
          textSize: 15,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          size: 15,
        ),
      ),
    );
  }
}
