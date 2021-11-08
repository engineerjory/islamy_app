import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/main.dart';

// this class has more than listener to allaw alot os classes to access its data
class AppConfigProvider with ChangeNotifier {
  String appLanguage = 'en';
  //assets/images/darkbackground.png
  String imagePath = "assets/images/background.png";
  String splashPath = 'assets/images/splash.png';

  // var themeMode = ThemeMode.light;
  ThemeMode appTheme = ThemeMode.light;
  ThemeMode appThemeDark = ThemeMode.dark;

  void changeLanguage(String languageCode) {
    if (appLanguage == languageCode) {
      return;
    }
    appLanguage = languageCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    imagePath = "assets/images/darkbackground.png";
    splashPath = "assets/images/darksplashg.png";
    notifyListeners();
  }

  void changeThemeLight(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    imagePath = imagePath = "assets/images/background.png";
    splashPath = 'assets/images/splash.png';
    notifyListeners();
  }
}
