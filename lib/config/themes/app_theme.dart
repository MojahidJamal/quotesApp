import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        height: 1.3,
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      button: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
    ),
  );
}
