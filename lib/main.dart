import 'package:flutter/material.dart';
import 'package:movies_app/core/movieassets/mainscreen.dart';
import 'core/colors.dart';
import 'core/movieassets/movies_view_model.dart';
import 'core/themes/dark_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesViewModel(),
      child: MaterialApp(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
        routes: {
      
        },
       home:MainScreen()
      ),
    );
  }
}


