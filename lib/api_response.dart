import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:mahe_ramdaan_app/Model/Timing_data.dart';
import 'package:location/location.dart' as loc;
import 'package:shared_preferences/shared_preferences.dart';


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

  Position position= await getUserLocation();
print("got postition");

    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
  print(  '##################\nLat and long of position are ${position.latitude} ${position.longitude}');


//  If json not exists

//  String url1 = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
  String url = 'https://api.aladhan.com/v1/calendar?latitude='+latitude+'&longitude='+longitude+'&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
//  http://api.aladhan.com/v1/calendar?latitude=23.2568665&longitude=69.652099
  print(url);
  Response response = await get(Uri.parse(url));
  int statusCode = response.statusCode;
  print("status code is "+statusCode.toString());
  String json = response.body;


//  if file exists

  Map<dynamic, dynamic> jsonData = jsonDecode(json);


  return Timing_Data.fromJSON (jsonData["data"][day-1]);

}



Future<Timing_Data> getAllMonthTiming() async {


  DateTime now = DateTime. now();
  var c_yr=now.year.toString();
  var c_mnt=now.month.toString();
  var c_day=now.day;


  var adjusment=date_correction_value;

  var day=c_day;

  Position position= await getUserLocation();
  print("got postition");
  if(position == null){

//  latitude = position.latitude.toString();
//  longitude = position.longitude.toString();

  }else
//print(""+position.toJson().toString());
      {
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();
    //TOdo add lastknow position to sahredpreference

  }

//  print(  'Lat and long are ${position.latitude} ${position.longitude}');


  String url1 = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
  String url = 'https://api.aladhan.com/v1/calendar?latitude='+latitude+'&longitude='+longitude+'&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
//  http://api.aladhan.com/v1/calendar?latitude=23.2568665&longitude=69.652099
  print(url);
  Response response = await get(Uri.parse(url));
  // sample info available in response
  int statusCode = response.statusCode;

    print("status code is " + statusCode.toString());
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    Map<dynamic, dynamic> jsonData = jsonDecode(json);

    List<dynamic> listtmp;

    print("inside list ");


    var tmp = await new Timing_Data.fromJSON (jsonData["data"][0]);
    print("tmp is" + tmp.normal_date);

//    listtmp.add(tmp);
//    print("list is" + listtmp.toString());
//    if (listtmp.isNotEmpty)
      return tmp;

}

//
//getCurrentLocation() async {
//  Geolocation.enableLocationServices().then((result) {
//    // Request location
//    // print(result);
//  }).catchError((e) {
//    // Location Services Enablind Cancelled
//    // print(e);
//  });
//
//  Geolocation.currentLocation(accuracy: LocationAccuracy.best)
//      .listen((result) {
//    if (result.isSuccessful) {
//
//        latitude = result.location.latitude.toString();
//        longitude = result.location.longitude.toString();
//    }
//  });
//}

