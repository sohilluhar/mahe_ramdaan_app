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
import 'Model/Timing_data_Month.dart';
import 'Special_dua_Gujarati.dart';
import 'Special_dua_Hindi.dart';
import 'api_response.dart';
import 'components/card_ui.dart';
import 'components/title_with_more_bbtn.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/constants.dart';


class AllMonthTiming extends StatefulWidget {
  const AllMonthTiming({Key key}) : super(key: key);

  @override
  _AllMonthTiming createState() => _AllMonthTiming();
}

class _AllMonthTiming extends State<AllMonthTiming> {
  DateTime now = DateTime. now();


  Future<Timing_Data_Month> timing_data;


  List< dynamic> allmnthno=[
    0,1,2,3,4,5,6,7,8,9,10,
    11,12,13,14,15,16,17,18,19,20,
    21,22,23,24,25,26,27,28,29,30
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timing_data=getAllMonthTiming();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Roza Timing"),
        ),
        body:
            Center(
              child:

        SingleChildScrollView(

            child:

            FutureBuilder<Timing_Data_Month>(
              future:timing_data,
              builder:(context,snapshot){
                if(snapshot.hasData){
                  print("inside data");

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(height: 16),


                for(var i in allmnthno)
                      CardUI(title: snapshot.data.normal_date[i], content: "Saheri: " +
                          snapshot.data.saheri[i] + "\n" + "Iftar: " + snapshot.data.iftar[i]),


                    ],
                  );




                }else{
                  print("ouside data");
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
        ))
      );
  }


}




