import 'package:flutter/material.dart';
import 'package:islamy_app/home/home-screen.dart';

class SplashScreen extends StatelessWidget {
  static final String routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) {
    navigateToHome(context, HomeScreen.ROUTE_NAME);
    return Scaffold(
      appBar: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context, String screenName) {
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Navigator.pushNamed(context, screenName);
    });
  }
}
