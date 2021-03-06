import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'HadithDetailsScreen';

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  List<String> hadith = [];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as HadithDetailsArguments;
    loadHadithDetails(args.hadithIndex);
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
          ),
          body: Container(
            child: hadith.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) => Text(
                      hadith[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    itemCount: hadith.length,
                  ),
          )),
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
