import 'package:flutter/material.dart';
import 'package:movies_app/core/colors.dart';

ThemeData get darkTheme{
  return ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const  AppBarTheme(
      backgroundColor:  AppColors.black,
      foregroundColor: AppColors.yellow,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.yellow
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
   textTheme: TextTheme(
     bodyMedium: TextStyle(
       color: AppColors.white,
       fontSize: 20,
       fontWeight: FontWeight.w400,
     ),
     bodySmall: TextStyle(
       color: AppColors.white,
       fontSize: 16,
       fontWeight: FontWeight.w400,
     ),
     labelLarge: TextStyle(
       color: AppColors.white,
       fontWeight: FontWeight.bold,
       fontSize: 30
   ),
     labelMedium: TextStyle(
         color: AppColors.white,
         fontWeight: FontWeight.bold,
         fontSize: 20
     ),
     labelSmall: TextStyle(
         color: AppColors.white,
         fontWeight: FontWeight.bold,
         fontSize: 18
     ),
   )
  );
}