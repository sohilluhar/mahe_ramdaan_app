import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:mahe_ramdaan_app/Model/Timing_data.dart';
import 'package:location/location.dart' as loc;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Model/Timing_data_Month.dart';
import 'constants.dart';

String latitude = '23.2568665';
String longitude = '69.652099';


getUserLocation() async {
//  setState(() => locating = true);

  loc.Location location;

  location = loc.Location();

  try {

      bool _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {

          print("inside last known position");
          SharedPreferences  pref =await SharedPreferences.getInstance();

          if (pref.containsKey("lat")){
            print("getting lat and long");
            var tmplat=pref.getDouble("lat");
            var tmplon=pref.getDouble("long");
            return Position(latitude: tmplat, longitude: tmplon);
          }else

        return await Geolocator().getLastKnownPosition();
//        return Position(latitude: null, longitude: null);
        }
      }



    Position userPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      SharedPreferences  pref =await SharedPreferences.getInstance();
      pref.setDouble("lat", userPosition.latitude);
      pref.setDouble("long", userPosition.longitude);
    print(  'Lat and long are ${userPosition.latitude} ${userPosition.longitude}');

    return userPosition;

  } catch (e) {
    print(e.toString());
//    setState(() => locating = false);
    print("inside catch");
  }
}


Future<Timing_Data> makeGetRequest() async {


  DateTime now = DateTime. now();
  var c_yr=now.year.toString();
  var c_mnt=now.month.toString();
  var c_day=now.day;


  var adjusment= date_correction_value;

  var day=c_day;
  String json='';
//  If json not exists
  final Directory directory = await getApplicationDocumentsDirectory();
  var filepath='${directory.path}/'+c_mnt+'-timing.json';

  final File file = File(filepath);

  if(!file.existsSync()) {

    var prev_month=(int.parse( c_mnt)-1).toString();
    if(prev_month=='0')
      prev_month='12';
if(File('${directory.path}/'+prev_month+'-timing.json').existsSync()){
  print("deleteing old data");
  File('${directory.path}/'+prev_month+'-timing.json').deleteSync();
}

    Position position= await getUserLocation();
    print("got postition");

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    print(  '##################\nLat and long of position are ${position.latitude} ${position.longitude}');


//  String url1 = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
    String url = 'https://api.aladhan.com/v1/calendar?latitude=' + latitude +
        '&longitude=' + longitude + '&method=1&school=1&month=' + c_mnt +
        '&year' + c_yr + '&adjustment=' + adjusment.toString();
//  http://api.aladhan.com/v1/calendar?latitude=23.2568665&longitude=69.652099
    print(url);
    Response response = await get(Uri.parse(url));
    int statusCode = response.statusCode;
    print("status code is " + statusCode.toString());

    json = response.body;
    print("File writing");
    await file.writeAsString(json);

  }else {
//  if file exists

  print("File already exist");
    json=await file.readAsString();
  }
    Map<dynamic, dynamic> jsonData = jsonDecode(json);

    return Timing_Data.fromJSON(jsonData["data"][day - 1]);

}




Future<Timing_Data_Month> getAllMonthTiming() async {


  DateTime now = DateTime. now();
  var c_yr=now.year.toString();
  var c_mnt=now.month.toString();
  var c_day=now.day;


  var adjusment= date_correction_value;

  var day=c_day;
  String json='';
//  If json not exists
  final Directory directory = await getApplicationDocumentsDirectory();
  var filepath='${directory.path}/'+c_mnt+'-timing.json';

  final File file = File(filepath);

  if(!file.existsSync()) {

    var prev_month=(int.parse( c_mnt)-1).toString();
    if(prev_month=='0')
      prev_month='12';
    if(File('${directory.path}/'+prev_month+'-timing.json').existsSync()){
      print("deleteing old data");
      File('${directory.path}/'+prev_month+'-timing.json').deleteSync();
    }

    Position position= await getUserLocation();
    print("got postition");

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    print(  '##################\nLat and long of position are ${position.latitude} ${position.longitude}');


//  String url1 = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
    String url = 'https://api.aladhan.com/v1/calendar?latitude=' + latitude +
        '&longitude=' + longitude + '&method=1&school=1&month=' + c_mnt +
        '&year' + c_yr + '&adjustment=' + adjusment.toString();
//  http://api.aladhan.com/v1/calendar?latitude=23.2568665&longitude=69.652099
    print(url);
    Response response = await get(Uri.parse(url));
    int statusCode = response.statusCode;
    print("status code is " + statusCode.toString());

    json = response.body;
    print("File writing");
    await file.writeAsString(json);

  }else {
//  if file exists

    print("File already exist");
    json=await file.readAsString();
  }
  Map<dynamic, dynamic> jsonData = jsonDecode(json);

  return Timing_Data_Month.fromJSON(jsonData["data"]);

}



