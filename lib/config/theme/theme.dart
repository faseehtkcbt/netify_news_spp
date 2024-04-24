import 'package:flutter/material.dart';

import '../../core/color_pallette/app_pallette.dart';

class AppTheme {
  static const TextStyle lightTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textBlackColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      decoration: TextDecoration.none);
  static const TextTheme lighTextTheme = TextTheme(bodyMedium: lightTextStyle);
  static const TextStyle darkTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textWhiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      decoration: TextDecoration.none);
  static const TextTheme darkTextTheme = TextTheme(bodyMedium: darkTextStyle);

  // light theme
  static dynamic lightTheme =
      ThemeData.light(useMaterial3: true).copyWith(textTheme: lighTextTheme);
  // dark theme
  static dynamic darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(textTheme: darkTextTheme);
}
