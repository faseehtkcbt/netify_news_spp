import 'package:flutter/material.dart';

import '../../../../core/color_pallette/app_pallette.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/utils/network_image.dart';

class CountryListTile extends StatelessWidget {
  final void Function() onTap;
  final String flagUrl;
  final bool selected;
  final String countryName;
  const CountryListTile(
      {super.key,
      required this.onTap,
      required this.flagUrl,
      required this.selected,
      required this.countryName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: selected ? AppPellete.themeColor : null,
      leading: NetworkImageUrl(url: flagUrl, height: 20, width: 30),
      title: AppText(
        text: countryName,
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
