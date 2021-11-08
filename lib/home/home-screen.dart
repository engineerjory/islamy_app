import 'package:flutter/material.dart';
import 'package:islamy_app/home/quran_fragment.dart';
import 'package:islamy_app/home/radio_fragment.dart';
import 'package:islamy_app/home/tasbih_fragment.dart';
import 'package:islamy_app/home/widgets/providers/app_config_provider.dart';
import 'package:islamy_app/home/widgets/settings_fragment.dart';
import 'package:islamy_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
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
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              provider.imagePath,
              // 'assets/images/background.png',
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        //   backgroundColor: Colors.transparent,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).primaryColor,
          //   backgroundColor: Colors.transparent,
          //  elevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: getMainFragment(),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: MyThemeData1.colorPrimary),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            iconSize: 35,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            // selectedIconTheme: IconThemeData(color: MyThemeData1.colorAccent),
            // selectedItemColor: MyThemeData1.colorAccent,
            showSelectedLabels: true,
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
              BottomNavigationBarItem(
                label: AppLocalizations.of(context)!.settings,
                icon: Icon(
                  Icons.settings,
                ),
              ),
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
    } else if (selectedIndex == 3) {
      return RadioFraagment();
    } else {
      return Settings();
    }
  }
}
