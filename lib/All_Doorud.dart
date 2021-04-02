import 'package:flutter/material.dart';

import 'components/card_ui.dart';
import 'constants.dart';

class All_Doorud extends MaterialPageRoute<void> {
  All_Doorud()
      : super(builder: (BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:Text('Durood Sharif'),
        elevation: 1.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              SizedBox(width: size.width,height: 16,),
              for(var key in duroodAll.keys)
                CardUI_Long(title:key, content:duroodAll[key])

            ],
          ),
        ),
      ),
    );
  });
}