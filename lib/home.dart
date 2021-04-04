import 'dart:math';
import 'dart:ui';

import
'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:mahe_ramdaan_app/Model/Timing_data.dart';
import 'package:mahe_ramdaan_app/constants.dart';
import 'All_Doorud.dart';
import 'All_Dua_Guj.dart';
import 'All_Dua_Hin.dart';
import 'Special_dua_Gujarati.dart';
import 'Special_dua_Hindi.dart';
import 'api_response.dart';
import 'components/card_ui.dart';
import 'components/title_with_more_bbtn.dart';


class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now = DateTime. now();

  var random_durood=duroodAll.keys.elementAt(new Random().nextInt(duroodAll.length));
  var now_dua_key;

  Future<Timing_Data> timing_data;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timing_data=makeGetRequest();
  }


//  @override
//  void didUpdateWidget(Home oldWidget) {
//    timing_data=makeGetRequest();
//  }
//
//  @override
//  void setState(VoidCallback fn) {
//    print("inside set");
//    timing_data=makeGetRequest();
//  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    var sizeWi=size.width*0.9;
    var cDay=now.weekday;
    if(now.weekday==4)
      random_durood='Durood e Shab e Jummah';
    else if(now.weekday==5)
      random_durood='Durood e Jummah';

    print(cDay);



    String cTime=new  DateFormat('hh:mm a').format(now).toString();
    String cDate=new  DateFormat('EEE, d MMMM y').format(now).toString();
    var todayHijri = new HijriCalendar.now();



    // it enable scrolling on small device
    return SingleChildScrollView(
      child:

FutureBuilder<Timing_Data>(

  future:timing_data,
  builder:(context,snapshot){
    if(snapshot.hasData){


     return Column(
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


                Text(cDate,textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18,color: Colors.black,),
                ), SizedBox(height: 8,),
                Text(snapshot.data.hizri_date,textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18,color: Colors.black,),
                ), SizedBox(height: 8,),

                Text("Saheri: "+snapshot.data.saheri,textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18,color: Colors.black,))
                ,Text("Iftar: "+snapshot.data.iftar,textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18,color: Colors.black,),
                )
              ])
          ),





          TitleWithMoreBtn(title: "Dua", press: () {
            if(lang_opt!='Guj')
              Navigator.of(context).push(All_Dua_Hin());
            else
              Navigator.of(context).push(All_Dua_Guj());
          }),
          SizedBox(height: 8),
          return_dua(snapshot.data),
          return_taraweeh_dua(snapshot.data),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left:sizeWi*0.05,right:sizeWi*0.05 ),
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
          TitleWithMoreBtn(title: "Ashrah dua", press: () {
            if(lang_opt!='Guj')
              Navigator.of(context).push(All_Dua_Hin());
            else
              Navigator.of(context).push(All_Dua_Guj());
          }),
          SizedBox(height: 8),
          retun_ashrahdua(snapshot.data),




          TitleWithMoreBtn(title: "Durood Sharif", press: () {

            Navigator.of(context).push(All_Doorud());


          }),
          SizedBox(height: 8),
          CardUI(title:random_durood,content:duroodAll[random_durood]),
          TitleWithMoreBtn(title: "Namaz Timing", press: () {
          }),
          SizedBox(height: 8),
          CardUI(title:cDate,content:
          "Fajr: "+snapshot.data.fajar+"\n"+
              "Zohar: "+snapshot.data.zohar+"\n"+
              "Asr: "+snapshot.data.asr+"\n"+
              "Maghrib: "+snapshot.data.maghrib+"\n"+
              "Isha: "+snapshot.data.isha+"\n"
          ),




        ],
      );




    }else{

      return
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          CircularProgressIndicator()
          ]
        );

//        Center(child:CircularProgressIndicator());
    }
  } ,
)
    );
  }

  return_dua(Timing_Data data) {


    var cTimeHr=now.hour;

    if(cTimeHr<data.saherihr+1 && cTimeHr>data.saherihr-1)
      now_dua_key=dua_key[0];
    else
      now_dua_key=dua_key[1];
//    now_dua_key=dua_key[0];

    if(lang_opt=="Guj"){

        return CardUI(title:dua_small_guj[now_dua_key][0],content:dua_small[now_dua_key]+"\n\n"+dua_small_guj[now_dua_key][1]);
   }   else{

        return CardUI(title:now_dua_key,content:dua_small[now_dua_key]+"\n\n"+dua_small_hindi[now_dua_key]+"\n");
   }


  }

  return_taraweeh_dua(Timing_Data data) {
    if (now_dua_key==dua_key[1]){

      if(lang_opt=="Guj"){
      return CardUI(title:dua_small_guj["Taraweeh"][0],content:dua_small["Taraweeh"]+"\n\n"+dua_small_guj["Taraweeh"][1]+"\n");
      }   else{
        return CardUI(title:"Taraweeh Dua",content:dua_small["Taraweeh"]+"\n\n"+dua_small_hindi["Taraweeh"]+"\n");
      }
    }else
      return Container();

  }

  retun_ashrahdua(Timing_Data data) {


    var key="Rehamat Ashra";


    if(lang_opt=="Guj"){

      return CardUI(title:dua_small_guj[key][0],content:dua_small[key]+"\n\n"+dua_small_guj[key][1]);
    }   else{

      return CardUI(title:key,content:dua_small[key]+"\n\n"+dua_small_hindi[key]+"\n");
    }

  }
}
