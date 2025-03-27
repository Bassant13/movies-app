
import 'package:flutter/material.dart';
import 'package:movies_app/core/movieassets/mainscreen.dart';
import 'package:movies_app/ui/screens/edit_profile_screen.dart';
import 'package:movies_app/ui/screens/forget_password.dart';
import 'package:movies_app/ui/screens/home/tabs/bottomNavigatorBarScreen.dart';
import 'package:movies_app/ui/screens/home/tabs/home_tab/home_tab.dart';
import 'package:movies_app/ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'package:movies_app/ui/screens/login_screen.dart';
import 'package:movies_app/ui/screens/onboarding.dart';
import 'package:movies_app/ui/screens/register_screen.dart';
import 'package:movies_app/ui/screens/res_pass.dart';
import 'core/class/app_rout.dart';

Map<String, Widget Function(BuildContext)> routs = {
  AppRouts.onBoarding: (context) => const OnBoarding(),
  AppRouts.login: (context) => LoginScreen(),
  AppRouts.register: (context) => const RegisterScreen(),
  AppRouts.forgetPass: (context) => const ForgetPasswordScreen(),
  AppRouts.restPass: (context) => const RestPass(),
  AppRouts.bottonNavigator: (context) => const BottomNavigationBarScreen(),
  AppRouts.home: (context) =>  HomeScreen(),
  AppRouts.editProfile: (context) =>  EditProfileScreen(),
  AppRouts.profile: (context) =>  ProfileTab(),
  AppRouts.mainScreen: (context) => MainScreen()


};
