import 'dart:math';

import
'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/constants.dart';
import 'components/card_ui.dart';
import 'components/title_with_more_bbtn.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    final DateTime now = DateTime. now();
    var random_durood=duroodAll.keys.elementAt(new Random().nextInt(duroodAll.length));
    var c_day=now.weekday;
    if(now.weekday==4)
      random_durood='Durood e Shab e Jummah';
    else if(now.weekday==5)
      random_durood='Durood e Jummah';

    var c_time=now.hour;
    var saheritime=4.20;
    var iftartime=7.0;
    var now_dua_key;
    print(c_day);

    if(c_time<saheritime+1 && c_time>saheritime-1)
      now_dua_key=dua_key[0];
    else if(c_time<iftartime+1 && c_time>iftartime-1)
      now_dua_key=dua_key[1];
    else
      now_dua_key=dua_key[2];

    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Dua", press: () {}),
          SizedBox(height: 8),
          if(now_dua_key=='Ramadaan Dua')
            CardUI_Long(title:now_dua_key,content:dua_small[now_dua_key]),
          if(now_dua_key!='Ramadaan Dua')

            CardUI(title:now_dua_key,content:dua_small[now_dua_key]),

          if(now_dua_key=='Iftaar')
            CardUI_Long(title:'Ramadaan Dua',content:dua_small['Ramadaan Dua']),

          TitleWithMoreBtn(title: "Ashrah dua", press: () {}),
          SizedBox(height: 8),
          CardUI(title:"Rehamat Ashra",content:"يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغيثُ"),
//          FeaturedPlants(),
         // RecomendsPlants(),
          TitleWithMoreBtn(title: "Durood Sharif", press: () {

          }),
          SizedBox(height: 8),
          CardUI(title:random_durood,content:duroodAll[random_durood]),
          //RecomendsPlants(),


        ],
      ),
    );
  }
}
