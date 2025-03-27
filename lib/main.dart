import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/routs.dart';
import 'core/class/app_rout.dart';
import 'core/themes/dark_theme.dart';
import 'firebase_options.dart';
import 'function/check_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final auth = await CheckAuth.init();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      EasyLocalization(
    supportedLocales: [
      Locale("en"),
      Locale("ar"),
    ],
    path: "assets/translations",
    fallbackLocale: Locale("en"),
    child: MyApp(
      auth: auth,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final CheckAuth auth;
  const MyApp({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MoviesViewModel(),
//       child: MaterialApp(
//         title: 'Movies App',
//         debugShowCheckedModeBanner: false,
//         darkTheme: darkTheme,
//         themeMode: ThemeMode.dark,
//         localizationsDelegates: AppLocalizations.localizationsDelegates,
//         supportedLocales: AppLocalizations.supportedLocales,
//         locale: Locale('en'),
//         routes: {
      
//         },
//        home:MainScreen()
//       ),
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: auth.skipOnBoarding == false
          ? AppRouts.onBoarding
          : auth.isLogin == false
          ? AppRouts.login
          : AppRouts.bottonNavigator,
      routes: routs,
    );
  }
}