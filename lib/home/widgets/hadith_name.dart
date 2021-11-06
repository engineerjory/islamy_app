import 'package:flutter/material.dart';

import 'hadith_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithName extends StatelessWidget {
  int index;
  HadithName(this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadithDetailsScreen.ROUTE_NAME,
          arguments: HadithDetailsArguments(index),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          AppLocalizations.of(context)!.hadithnumber + "  ${index + 1}",
          style: TextStyle(
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
