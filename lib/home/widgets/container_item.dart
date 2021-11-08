import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../main.dart';

class ContainerItem extends StatelessWidget {
  String text;
  Function changeState;

  ContainerItem(this.text, this.changeState);

  @override
  Widget build(BuildContext context) {
    // var model = Provider.of<Model>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyThemeData1.colorPrimary,
        border: Border.all(color: MyThemeData1.colorPrimary),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
          onPressed: () {
            changeState;
          },
          child: Text(
            '$text',
            style: TextStyle(fontSize: 20, color: MyThemeData1.colorAccent),
          )),
    );
  }
}
