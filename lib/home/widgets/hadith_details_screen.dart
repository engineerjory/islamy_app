import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/home/widgets/providers/app_config_provider.dart';
import 'package:islamy_app/main.dart';
import 'package:provider/provider.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'HadithDetailsScreen';

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  List<String> hadith = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args =
        ModalRoute.of(context)?.settings.arguments as HadithDetailsArguments;
    loadHadithDetails(args.hadithIndex);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              // 'assets/images/background.png',
              provider.imagePath,
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
          child: Container(
            // color: MyThemeData1.colorPrimary,
            child: hadith.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => Text(
                      hadith[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: MyThemeData1.colorPrimary,
                      ),
                    ),
                    itemCount: hadith.length,
                  ),
          ),
        ),
      ),
    );
  }

  void loadHadithDetails(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/h${index + 1}.txt');
    //  print('$fileContent');
    List<String> had = fileContent.split('/n');
    this.hadith = had;
    setState(() {});
  }
}

class HadithDetailsArguments {
  int hadithIndex;

  HadithDetailsArguments(this.hadithIndex);
}
