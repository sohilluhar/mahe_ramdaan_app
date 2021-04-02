import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/constants.dart';


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


          ],
        ),

      );
  }

  // Select style enum from dropdown menu:
  Widget _buildLangOption() {
    final dropdown = DropdownButton<String>(
      value: lang_opt,
      onChanged: (new_lang_opt) {
        setState(() {
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
    final dropdown = DropdownButton<int>(
      value: date_correction_value,
      onChanged: (new_val) {
        setState(() {
          date_correction_value=new_val;
        });

      },
      items: [

        DropdownMenuItem(
          value: -2,
          child: Text("-2",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: -1,
          child: Text("-1",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: 0,
          child: Text("0",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text("+1",textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,color: Colors.black,)),
        ),
        DropdownMenuItem(
          value: 2,
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
}




