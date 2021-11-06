import 'package:flutter/material.dart';
import 'package:islamy_app/home/home-screen.dart';
import 'package:islamy_app/home/widgets/hadith_details_screen.dart';
import 'package:islamy_app/home/widgets/surah_details_screen.dart';
import 'package:islamy_app/home/widgets/surah_name.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/splash-screen.dart';

class MyThemeData {
  static Color colorPrimary = Color.fromRGBO(183, 147, 95, 1.0);
  static Color colorAccent = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorPrimaryDark = Color.fromRGBO(20, 26, 46, 1.0);
  static Color colorAccentDark = Color.fromRGBO(250, 204, 29, 1.0);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],
      locale: Locale('ar', ''),
      theme: ThemeData(
        primaryColor: MyThemeData.colorPrimary,
        accentColor: MyThemeData.colorAccent,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: MyThemeData.colorPrimary,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: MyThemeData.colorPrimaryDark,
        accentColor: MyThemeData.colorAccentDark,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: MyThemeData.colorPrimaryDark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
        SuraDetailsScreen.ROUTE_NAME: (context) => SuraDetailsScreen(),
        HadithDetailsScreen.ROUTE_NAME: (context) => HadithDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
