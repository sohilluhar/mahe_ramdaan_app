import 'dart:math';
import 'dart:ui';

import
'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mahe_ramdaan_app/constants.dart';
import 'Special_dua_Gujarati.dart';
import 'Special_dua_Hindi.dart';
import 'api_response.dart';
import 'components/card_ui.dart';
import 'components/title_with_more_bbtn.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime. now();

  var random_durood=duroodAll.keys.elementAt(new Random().nextInt(duroodAll.length));

  var saheritime=5.20;

  var iftartime=7.0;

  var now_dua_key;

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    var size_wi=size.width*0.9;
    var c_day=now.weekday;
    if(now.weekday==4)
      random_durood='Durood e Shab e Jummah';
    else if(now.weekday==5)
      random_durood='Durood e Jummah';

    var c_time_hr=now.hour;
    print(c_day);

    if(c_time_hr<saheritime+1 && c_time_hr>saheritime-1)
      now_dua_key=dua_key[0];
    else
//      (c_time<iftartime+1 && c_time>iftartime-1)
      now_dua_key=dua_key[1];
//    else
//      now_dua_key=dua_key[2];
//    var df = ;

    String cTime=new  DateFormat('hh:mm a').format(now).toString();
    String cDate=new  DateFormat('EEE, d MMMM y').format(now).toString();
    var today_hijri = new HijriCalendar.now();

    var timeMaghrib= makeGetRequest();

    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(height: 8),

          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(16),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child: Column(children: [
//              Text(cTime,textAlign: TextAlign.justify,
//              style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold)),
//             SizedBox(height: 8,),
              Text(cDate,textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18,color: Colors.black,),
            ), SizedBox(height: 8,),
              Text(today_hijri.toFormat("dd MMMM yyyy").toString(),textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18,color: Colors.black,),
              ), SizedBox(height: 8,),
              Text(timeMaghrib.toString(),textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18,color: Colors.black,),
              )
            ])
        ),


        TitleWithMoreBtn(title: "Dua", press: () {}),
          SizedBox(height: 8),

         return_dua(),


            Card(
color: kPrimaryColor,
              margin: EdgeInsets.only(left:size_wi*0.05,right:size_wi*0.05 ),
            child: InkWell(

              splashColor: kPrimaryColor.withOpacity(0.1),
              onTap: () {
if(lang_opt!='Guj')
  Navigator.of(context).push(Mahe_ramadaan_special_dua_hindi());
  else
  Navigator.of(context).push(Mahe_ramadaan_special_dua_guj());
              },
              child:
              ListTile(
                  title:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Text(

                        "Mahe Ramadaan Special Dua",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ],
                  ),
                  trailing:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.center,
                        color: Colors.white,
                          icon:  Icon(Icons.arrow_forward_ios),
                          onPressed: (){
                            if(lang_opt!='Guj')
                              Navigator.of(context).push(Mahe_ramadaan_special_dua_hindi());
                            else
                              Navigator.of(context).push(Mahe_ramadaan_special_dua_guj());
                          }
                      )
                    ],
                  ),

              ))
          ),
          SizedBox(height:24),
          TitleWithMoreBtn(title: "Ashrah dua", press: () {}),
          SizedBox(height: 8),

          CardUI(title:"Rehamat Ashra",content:"يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغيثُ"),

          TitleWithMoreBtn(title: "Durood Sharif", press: () {

          }),
          SizedBox(height: 8),
          CardUI(title:random_durood,content:duroodAll[random_durood]),
          //RecomendsPlants(),


        ],
      ),
    );
  }

  return_dua() {
    List<dynamic> list;

    if(lang_opt=="Guj"){

        return CardUI(title:dua_small_guj[now_dua_key][0],content:dua_small[now_dua_key]+"\n\n"+dua_small_guj[now_dua_key][1]);
   }   else{
        return CardUI(title:now_dua_key,content:dua_small[now_dua_key]+"\n\n"+dua_small_hindi[now_dua_key]);
   }


  }
}
