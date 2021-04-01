import 'package:flutter/material.dart';
import 'components/card_ui.dart';
import 'constants.dart';

class Guj_test extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
            SizedBox(width: size.width,height: 24,),
            RaisedButton(onPressed: (){
              if(lang_opt=="Guj"){
//                lang_opt="Hin";
              }
            },)
        ],
      ),
    );
  }
}



