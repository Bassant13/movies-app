import 'package:flutter/material.dart';
import 'package:movies_app/core/themes/text_theme.dart';

import '../colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primary,
  textTheme: textTemeApp,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      )),
  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.button),
      iconTheme: IconThemeData(
        color: AppColors.button,
      )),
);
