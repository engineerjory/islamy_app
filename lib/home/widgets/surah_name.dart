import 'package:flutter/material.dart';
import 'package:islamy_app/home/widgets/surah_details_screen.dart';

class SuraName extends StatelessWidget {
  // static const String ROUTE_NAME = 'SuraName';
  String surahName;
  int index;

  SuraName(this.surahName, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.ROUTE_NAME,
          arguments: SuraDetailsArguments(surahName, index),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          surahName,
          style: TextStyle(
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
