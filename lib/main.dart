import 'package:flutter/material.dart';
import 'package:islamy_app/home/home-screen.dart';
import 'package:islamy_app/home/widgets/container_item.dart';
import 'package:islamy_app/home/widgets/hadith_details_screen.dart';
import 'package:islamy_app/home/widgets/providers/app_config_provider.dart';
import 'package:islamy_app/home/widgets/surah_details_screen.dart';
import 'package:islamy_app/home/widgets/surah_name.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/splash-screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (BuildContext) {
          // we will use this object untill we close the app
          return AppConfigProvider();
        },
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // var language = 'en';
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
      locale: Locale(provider.appLanguage, ''),
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //       iconTheme: IconThemeData(
      //     color: Colors.black,
      //   )),
      //   primaryColor: MyThemeData1.colorPrimary,
      //   accentColor: MyThemeData1.colorAccent,
      //   progressIndicatorTheme: ProgressIndicatorThemeData(
      //     color: MyThemeData1.colorPrimary,
      //   ),
      // ),
      theme: MyThemeData1.lightTheme,
      // darkTheme: ThemeData(
      //   primaryColor: MyThemeData1.colorPrimaryDark,
      //   accentColor: MyThemeData1.colorAccentDark,
      //   progressIndicatorTheme: ProgressIndicatorThemeData(
      //     color: MyThemeData1.colorPrimaryDark,
      //   ),
      // ),
      darkTheme: MyThemeData1.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: provider.appTheme,
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

class MyThemeData1 {
  static Color colorPrimary = Color.fromRGBO(183, 147, 95, 1.0);
  static Color blackTh = Color.fromRGBO(112, 112, 112, 1.0);
  static Color whiteTh = Colors.white;
  static Color colorAccent = Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorPrimaryDark = Color.fromRGBO(20, 26, 46, 1.0);
  static Color colorAccentDark = Color.fromRGBO(250, 204, 29, 1.0);
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: MyThemeData1.colorPrimary,
    accentColor: MyThemeData1.colorAccent,
    backgroundColor: MyThemeData1.whiteTh,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: MyThemeData1.blackTh,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MyThemeData1.colorPrimary,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: MyThemeData1.colorPrimaryDark,
    accentColor: MyThemeData1.colorAccentDark,
    backgroundColor: MyThemeData1.blackTh,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: MyThemeData1.colorAccentDark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: MyThemeData1.colorAccentDark,
          size: 20,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: MyThemeData1.colorPrimaryDark,
      unselectedItemColor: MyThemeData1.colorAccentDark,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MyThemeData1.colorPrimaryDark,
    ),
  );
}
// class MyThemeData {
//   static const Color primaryColor = Color.fromARGB(255, 183, 147, 95) ;
//   static const Color primaryColorDark = Color.fromARGB(255, 20, 26, 46) ;
//   static const Color primaryColorDark2 = Color.fromARGB(255, 250, 204, 29) ;
//   static final ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: MyThemeData.primaryColor ,
//     scaffoldBackgroundColor: Colors.transparent ,
//     appBarTheme: AppBarTheme(
//       titleTextStyle: TextStyle(
//           color: Colors.black
//       ),
//       backgroundColor: Colors.transparent ,
//       elevation: 0 ,
//       iconTheme: IconThemeData(
//           color: Colors.black ,
//           size: 20
//       ),
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       selectedItemColor: Colors.black,
//       unselectedItemColor: Colors.white,
//     ),
//   ) ;
//   static final ThemeData darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: MyThemeData.primaryColorDark ,
//     scaffoldBackgroundColor: Colors.transparent ,
//     appBarTheme: AppBarTheme(
//       titleTextStyle: TextStyle(
//           color: Colors.white
//       ),
//       backgroundColor: Colors.transparent ,
//       elevation: 0 ,
//       iconTheme: IconThemeData(
//           color: Colors.white ,
//           size: 20
//       ),
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       selectedItemColor: MyThemeData.primaryColorDark2,
//       unselectedItemColor: Colors.white,
//     ),
//   ) ;
// }
