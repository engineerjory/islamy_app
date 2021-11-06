import 'package:flutter/material.dart';
import 'package:islamy_app/home/quran_fragment.dart';
import 'package:islamy_app/home/radio_fragment.dart';
import 'package:islamy_app/home/tasbih_fragment.dart';
import 'package:islamy_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/hadith_fragment.dart';

class HomeScreen extends StatefulWidget {
  static final String ROUTE_NAME = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/background.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: getMainFragment(),
        bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: MyThemeData.colorPrimary),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            iconSize: 35,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            selectedIconTheme: IconThemeData(color: MyThemeData.colorAccent),
            //  selectedLabelStyle: TextStyle(color: MyThemeData.colorAccent),
            selectedItemColor: MyThemeData.colorAccent,
            showSelectedLabels: true,
            // showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.quran,
                  icon: ImageIcon(AssetImage('assets/images/moshaf_gold.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.ahadith,
                  icon: ImageIcon(AssetImage('assets/images/ahadeth.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.sebha,
                  icon: ImageIcon(AssetImage('assets/images/sebha.png'))),
              BottomNavigationBarItem(
                  label: AppLocalizations.of(context)!.radio,
                  icon: ImageIcon(AssetImage('assets/images/radio.png'))),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMainFragment() {
    if (selectedIndex == 0) {
      return QuranFragment();
    } else if (selectedIndex == 1) {
      return HadithFraagment();
    } else if (selectedIndex == 2) {
      return TasbihFragment();
    } else {
      return RadioFraagment();
    }
  }
}
