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

  static const TextTheme lightTextTheme = TextTheme(
      titleMedium: lightTitleTextStyle, bodyMedium: lightBodyTextStyle);

  static final ElevatedButtonThemeData lightButtonThemeData =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPellete.themeColor,
              fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))));

  static final InputDecorationTheme lightInputDecoration = InputDecorationTheme(
      contentPadding: const EdgeInsets.all(15),
      enabledBorder: _border(),
      errorBorder: _border(color: AppPellete.errorColor),
      focusedBorder: _border(
        color: AppPellete.themeColor,
      ));

  static dynamic lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      textTheme: lightTextTheme,
      appBarTheme: const AppBarTheme().copyWith(
        titleTextStyle: lightTitleTextStyle,
      ),
      inputDecorationTheme: lightInputDecoration,
      elevatedButtonTheme: lightButtonThemeData);

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

  static final ElevatedButtonThemeData darkButtonThemeData =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPellete.themeColor,
              fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))));

  static final InputDecorationTheme darkInputDecoration = InputDecorationTheme(
      fillColor: AppPellete.darkFillColor,
      filled: true,
      contentPadding: const EdgeInsets.all(15),
      enabledBorder: _border(color: AppPellete.darkFillColor),
      errorBorder: _border(color: AppPellete.errorColor),
      focusedBorder: _border(color: AppPellete.themeColor));

  static dynamic darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
      textTheme: darkTextTheme,
      appBarTheme: const AppBarTheme().copyWith(
        titleTextStyle: darkTitleTextStyle,
      ),
      inputDecorationTheme: darkInputDecoration,
      elevatedButtonTheme: darkButtonThemeData);
}
