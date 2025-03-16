
import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/edit_profile_screen.dart';
import 'package:movies_app/ui/screens/home/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/ui/screens/home/tabs/profile_tab/profile_tab.dart';
import 'core/themes/dark_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      routes: {
        ProfileTab.routeName: (context) =>  ProfileTab(),
        EditProfileScreen.routeName: (context) =>   EditProfileScreen(),
        BrowseTab.routeName: (context) =>   BrowseTab(),

      },
     initialRoute: ProfileTab.routeName,
    );
  }
}


