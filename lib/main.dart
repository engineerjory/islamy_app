import 'package:flutter/material.dart';
import 'package:islamy_app/home/home-screen.dart';
import 'package:islamy_app/splash-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
