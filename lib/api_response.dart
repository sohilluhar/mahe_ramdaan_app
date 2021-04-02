import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:mahe_ramdaan_app/Model/Timing_data.dart';

import 'constants.dart';

String latitude = '23.2568665';
String longitude = '69.652099';


Future<Timing_Data> makeGetRequest() async {


  DateTime now = DateTime. now();
  var c_yr=now.year.toString();
  var c_mnt=now.month.toString();
  var c_day=now.day;
  print("yr "+c_yr);
  print("mnth "+c_mnt);
  print("c_day "+c_day.toString());

  var adjusment=date_correction_value;

  var day=c_day;

//  await getCurrentLocation();

  String url1 = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
  String url = 'https://api.aladhan.com/v1/calendar?latitude='+latitude+'&longitude='+longitude+'&method=1&school=1&month='+c_mnt+'&year'+c_yr+'&adjustment='+adjusment.toString();
//  http://api.aladhan.com/v1/calendar?latitude=23.2568665&longitude=69.652099
  print(url);
  Response response = await get(Uri.parse(url));
  // sample info available in response
  int statusCode = response.statusCode;
  print("status code is "+statusCode.toString());
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  Map<dynamic, dynamic> jsonData = jsonDecode(json);


  return Timing_Data.fromJSON (jsonData["data"][day-1]);

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

