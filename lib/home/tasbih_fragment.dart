import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamy_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbihFragment extends StatefulWidget {
  @override
  State<TasbihFragment> createState() => _TasbihFragmentState();
}

class _TasbihFragmentState extends State<TasbihFragment> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  //
  // List<String> zekr = [
  //   AppLocalizations.of(context )!.sobhanAllah,
  //   AppLocalizations.of(context)!.alhamdoLelah,
  //   AppLocalizations.of(context)!.allahoAkbar,
  // ];

  @override
  Widget build(BuildContext context) {
    List<String> zekr = [
      AppLocalizations.of(context)!.sobhanAllah,
      AppLocalizations.of(context)!.alhamdoLelah,
      AppLocalizations.of(context)!.allahoAkbar,
    ];
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: InkWell(
                  onTap: () {
                    tasbeihFun();
                  },
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      'assets/images/sebhaimage.png',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.09,
                ),
                child: Image.asset(
                  'assets/images/headofseb7a.png',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              AppLocalizations.of(context)!.numOfTsbih,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 30),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(183, 147, 95, 1.0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '$counter',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromRGBO(183, 147, 95, 1.0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '${zekr[index]}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  void tasbeihFun() {
    counter++;
    if (counter % 33 == 0) {
      index++;
      if (index == 3) {
        index = 0;
      }
    }

    setState(() {
      angle += 20;
    });
  }
}
