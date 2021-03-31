import 'package:flutter/material.dart';
import 'components/card_ui.dart';
import 'constants.dart';

class Durood extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
            SizedBox(width: size.width,height: 24,),

          for(var key in duroodAll.keys)
           CardUI(title: key, content: duroodAll[key])
        ],
      ),
    );
  }
}



