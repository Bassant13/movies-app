import 'package:flutter/material.dart';
import 'package:movies_app/core/themes/text_theme.dart';

import '../colors.dart';

ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: const  AppBarTheme(
          backgroundColor:  AppColors.black,
          foregroundColor: AppColors.yellow,
          titleTextStyle: TextStyle(
              fontSize: 16,
              color: AppColors.yellow,
              fontWeight: FontWeight.w400,
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ))  ,
              textStyle: MaterialStateProperty.all(
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ))
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGray,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
            color:  AppColors.yellow,
            size: 30
        ),
        unselectedIconTheme: IconThemeData(
            color:  AppColors.white,
            size: 30
        ),
      ),
  textTheme: textTemeApp,

  );

