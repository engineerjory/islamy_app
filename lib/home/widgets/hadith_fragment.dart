import 'package:flutter/material.dart';
import 'package:islamy_app/home/widgets/hadith_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class HadithFraagment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            'assets/images/hadith.png',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyThemeData1.colorPrimary,
              width: 2,
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.ahadith,
            style: TextStyle(
              //color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 7,
          child: ListView.separated(
            itemCount: 50,
            itemBuilder: (context, index) {
              return HadithName(index);
            },
            separatorBuilder: (context, index) {
              return Container(
                width: 1,
                height: 2,
                color: MyThemeData1.colorPrimary,
              );
            },
          ),
        )
      ],
    ));
  }
}
