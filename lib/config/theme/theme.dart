import 'package:flutter/material.dart';

import '../../core/color_pallette/app_pallette.dart';

class AppTheme {
  // light theme

  static const TextStyle lightBodyTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textBlackColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      decoration: TextDecoration.none);

  static const TextStyle lightTitleTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textBlackColor,
      fontWeight: FontWeight.w700,
      fontSize: 22,
      decoration: TextDecoration.none);

  static const TextTheme lighTextTheme = TextTheme(
      titleMedium: lightTitleTextStyle, bodyMedium: lightBodyTextStyle);

  static const InputDecoration lightInputDecoration = InputDecoration();

  static dynamic lightTheme =
      ThemeData.light(useMaterial3: true).copyWith(textTheme: lighTextTheme);

  // dark theme
  static const TextStyle darkBodyTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textWhiteColor,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      decoration: TextDecoration.none);

  static const TextStyle darkTitleTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textWhiteColor,
      fontWeight: FontWeight.w700,
      fontSize: 22,
      decoration: TextDecoration.none);

  static const TextTheme darkTextTheme =
      TextTheme(titleMedium: darkTitleTextStyle, bodyMedium: darkBodyTextStyle);

  static dynamic darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(textTheme: darkTextTheme);
}
