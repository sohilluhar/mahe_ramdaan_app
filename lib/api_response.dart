import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:mahe_ramdaan_app/Model/Timing_data.dart';

Future<Timing_Data> makeGetRequest() async {


var adjusment='1';
  String url = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month=4&year2021&adjustment='+adjusment;
  Response response = await get(Uri.parse(url));
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  Map<dynamic, dynamic> jsonData = jsonDecode(json);


// Map<String, dynamic> json_data1 = jsonDecode(json_data["data"][0]);
//  print(jsonData);
//  print("inside get");

  return Timing_Data.fromJSON (jsonData["data"][0]);


  //  saheri, iftartmp, fajar, zohar, asr, maghrib, isha, hizriDate);
//  return Timing_Data(saheri, iftartmp, fajar, zohar, asr, maghrib, isha, hizriDate);


}