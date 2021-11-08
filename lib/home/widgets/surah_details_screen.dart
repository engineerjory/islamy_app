import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/home/widgets/providers/app_config_provider.dart';
import 'package:islamy_app/main.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArguments;
    //  if (verses.isEmpty)
    loadSuraDetails(args.suraIndex); //////////////////////////////////////
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              provider.imagePath,
              //'assets/images/background.png',
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
              AppLocalizations.of(context)!.islami,
              style: TextStyle(
                // color: MyThemeData1.colorPrimary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
        body: Container(
          margin: EdgeInsets.all(18),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            children: [
              Text(
                args.suraName,
                style: TextStyle(
                  color: MyThemeData1.colorPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 2,
                color: MyThemeData1.colorPrimary,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemBuilder: (context, index) => Text(
                          verses[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: MyThemeData1.colorPrimary,
                          ),
                        ),
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ),
      ),
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
