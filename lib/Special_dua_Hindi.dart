import 'package:flutter/material.dart';

import 'components/card_ui.dart';
import 'constants.dart';

class Mahe_ramadaan_special_dua_hindi extends MaterialPageRoute<void> {
  Mahe_ramadaan_special_dua_hindi()
      : super(builder: (BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text('Mahe Ramadaan Dua'),
        elevation: 1.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              SizedBox(width: size.width,height: 16,),
                CardUI_Long(title:"Mahe Ramadaan Special Dua", content:mahe_ramadaan_special_dua["Ramadaan Dua"])
            ],
          ),
        ),
      ),
    );
  });
}