import 'package:flutter/material.dart';

import 'components/card_ui.dart';
import 'constants.dart';

class Mahe_ramadaan_special_dua_guj extends MaterialPageRoute<void> {
  Mahe_ramadaan_special_dua_guj()
      : super(builder: (BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text('રમઝાન દુઆ'),
        elevation: 1.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              SizedBox(width: size.width,height: 16,),
              CardUI_Long(title:"રમઝાન દુઆ", content:mahe_ramadaan_special_dua_guj["રમઝાન દુઆ"])
            ],
          ),
        ),
      ),
    );
  });
}