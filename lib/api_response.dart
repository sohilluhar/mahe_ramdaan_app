import 'dart:convert';
import 'package:http/http.dart';

makeGetRequest() async {
//  // make GET request
  String url = 'https://api.aladhan.com/v1/calendarByCity?city=Bhuj&country=India&method=1&school=1&month=4&year2021';
  Response response = await get(Uri.parse(url));
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  Map<dynamic, dynamic> json_data = jsonDecode(json);


// Map<String, dynamic> json_data1 = jsonDecode(json_data["data"][0]);
  print(json_data["data"][0]["timings"]["Maghrib"]);
  print("inside get");

  return json_data["data"][0]["timings"]["Maghrib"].toString();


}