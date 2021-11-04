import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    //  if (verses.isEmpty)
    loadSuraDetails(args.suraIndex); //////////////////////////////////////
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              '${args.suraName}',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            child: verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => Text(
                      verses[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    itemCount: verses.length,
                  ),
          )),
    );
  }

  void loadSuraDetails(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    //  print('$fileContent');
    List<String> ayat = fileContent.split('/n');
    this.verses = ayat;
    setState(() {});
  }
}

class SuraDetailsArguments {
  String suraName;
  int suraIndex;

  SuraDetailsArguments(this.suraName, this.suraIndex);
}
