import 'package:flutter/material.dart';

import 'components/card_ui.dart';
import 'constants.dart';

class All_Dua_Guj extends MaterialPageRoute<void> {
  All_Dua_Guj()
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
              for(var key in dua_small_guj.keys)
                CardUI_Long(title:dua_small_guj[key][0], content:dua_small[key]+"\n\n"+dua_small_guj[key][1])

            ],
          ),
        ),
      ),
    );
  });
}