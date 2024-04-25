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

  static _border({Color color = AppPellete.borderColor}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: color, width: 2));

  static const TextStyle lightTitleTextStyle = TextStyle(
      fontFamily: 'Poppins',
      color: AppPellete.textBlackColor,
      fontWeight: FontWeight.w700,
      fontSize: 22,
      decoration: TextDecoration.none);

  static const TextTheme lighTextTheme = TextTheme(
      titleMedium: lightTitleTextStyle, bodyMedium: lightBodyTextStyle);

  static final InputDecorationTheme lightInputDecoration = InputDecorationTheme(
      contentPadding: const EdgeInsets.all(15),
      enabledBorder: _border(),
      errorBorder: _border(color: AppPellete.errorColor),
      focusedBorder: _border(
        color: AppPellete.themeColor,
      ));

  static dynamic lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      textTheme: lighTextTheme, inputDecorationTheme: lightInputDecoration);

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

  static final InputDecorationTheme darkInputDecoration = InputDecorationTheme(
      fillColor: AppPellete.darkFillColor,
      filled: true,
      contentPadding: const EdgeInsets.all(15),
      enabledBorder: _border(color: AppPellete.darkFillColor),
      errorBorder: _border(color: AppPellete.errorColor),
      focusedBorder: _border(color: AppPellete.themeColor));

  static dynamic darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: darkTextTheme, inputDecorationTheme: darkInputDecoration);
}
