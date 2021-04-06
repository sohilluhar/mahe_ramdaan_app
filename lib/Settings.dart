import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
        body: Column(
          children: [
            _buildLangOption(),
            Divider(),
            _buildDateCorrectionOption(),
            Divider(),
            MaterialButton(onPressed: (){
              deleteOldData();
            },
                child:Text("Update Location"))


          ],
        ),

      );
  }

  Future<void> deleteOldData() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    DateTime now = DateTime. now();
    var month=now.month.toString();
    if(File('${directory.path}/'+month+'-timing.json').existsSync()){
      print("deleteing old data");
      File('${directory.path}/'+month+'-timing.json').deleteSync();
    }
  }
  // Select style enum from dropdown menu:
  Widget _buildLangOption() {
    final dropdown = DropdownButton<String>(
      value: lang_opt,
      onChanged: (new_lang_opt) {
        setState(()  {

          savelang_opt(new_lang_opt);
          lang_opt=new_lang_opt;
        });

      },
      items: [

        DropdownMenuItem(
          value: "Hin",
          child: Text("Hindi",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: "Guj",
          child: Text("Gujarati",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
      ],
    );

    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: Text("Language",textAlign: TextAlign.start,
    style: TextStyle(fontSize: 18,color: Colors.black,)),
      trailing: dropdown,
    );
  }

  Widget _buildDateCorrectionOption() {
    final dropdown = DropdownButton<String>(
      value: date_correction_value.toString(),
      onChanged: (new_val) {
        setState(()  {

          saveDateCorrection(new_val);
          date_correction_value=new_val;
        });

      },
      items: [

        DropdownMenuItem(
          value: "-2",
          child: Text("-2",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: "-1",
          child: Text("-1",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: "0",
          child: Text("0",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: "1",
          child: Text("+1",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: "2",
          child: Text("+2",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),

      ],
    );

    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: Text("Date Correction",textAlign: TextAlign.start,
    style: TextStyle(fontSize: 18,color: Colors.black,)),
      trailing: dropdown,
    );
  }

  Future<void> saveDateCorrection(String new_val) async {

    SharedPreferences  pref =await SharedPreferences.getInstance();

    pref.setString("date_correction", new_val);
    final Directory directory = await getApplicationDocumentsDirectory();

    DateTime now = DateTime. now();
    var month=now.month.toString();

    if(File('${directory.path}/'+month+'-timing.json').existsSync()){
      print("deleteing old data");
      File('${directory.path}/'+month+'-timing.json').deleteSync();
    }

  }

  Future<void> savelang_opt(String new_val) async {

    SharedPreferences  pref =await SharedPreferences.getInstance();

    pref.setString("lang", new_val);

  }
}




