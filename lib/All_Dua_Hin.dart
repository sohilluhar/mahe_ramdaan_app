import 'package:flutter/material.dart';

import 'components/card_ui.dart';
import 'constants.dart';

class All_Dua_Hin extends MaterialPageRoute<void> {
  All_Dua_Hin()
      : super(builder: (BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text('Mahe Ramadaan Duaa'),
        elevation: 1.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              SizedBox(width: size.width,height: 16,),
              for(var key in dua_small.keys)
                CardUI_Long(title:key, content:dua_small[key]+"\n\n"+dua_small_hindi[key])

            ],
          ),
        ),
      ),
    );
  });
}