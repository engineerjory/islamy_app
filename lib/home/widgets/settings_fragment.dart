import 'package:flutter/material.dart';
import 'package:islamy_app/home/widgets/providers/app_config_provider.dart';
import 'package:islamy_app/main.dart';
import 'package:provider/provider.dart';

import 'container_item.dart';

class Settings extends StatefulWidget {
  // const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
  //var model = Provider.of<Model>(context);
}

class _SettingsState extends State<Settings> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    //  var model = Provider.of<Model>(context);
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyThemeData1.colorPrimary,
              border: Border.all(color: MyThemeData1.colorPrimary),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
                onPressed: () {
                  provider.changeLanguage('ar');
                },
                child: Text(
                  'Arabic',
                  style:
                      TextStyle(fontSize: 20, color: MyThemeData1.colorAccent),
                )),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyThemeData1.colorPrimary,
              border: Border.all(color: MyThemeData1.colorPrimary),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
                onPressed: () {
                  provider.changeLanguage('en');
                  // provider.changeLanguage('ar');
                },
                child: Text(
                  'English',
                  style:
                      TextStyle(fontSize: 20, color: MyThemeData1.colorAccent),
                )),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyThemeData1.colorPrimary,
              border: Border.all(color: MyThemeData1.colorPrimary),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
                onPressed: () {
                  provider.changeTheme(ThemeMode.dark);
                },
                child: Text(
                  'Dark Theme',
                  style:
                      TextStyle(fontSize: 20, color: MyThemeData1.colorAccent),
                )),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyThemeData1.colorPrimary,
              border: Border.all(color: MyThemeData1.colorPrimary),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
                onPressed: () {
                  provider.changeThemeLight(ThemeMode.light);
                },
                child: Text(
                  'Light Theme',
                  style:
                      TextStyle(fontSize: 20, color: MyThemeData1.colorAccent),
                )),
          ),
        ],
      ),
    );
  }
}
