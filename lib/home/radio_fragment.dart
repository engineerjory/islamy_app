import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioFraagment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
              'assets/images/radioimage.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              AppLocalizations.of(context)!.quranRadio,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/backicon.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/playicon.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/nexticon.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
