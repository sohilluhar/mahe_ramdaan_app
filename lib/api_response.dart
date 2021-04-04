import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:mahe_ramdaan_app/Model/Timing_data.dart';
import 'package:location/location.dart' as loc;


import 'constants.dart';

String latitude = '23.2568665';
String longitude = '69.652099';
bool location_per=true;

getUserLocation() async {
//  setState(() => locating = true);

  loc.Location location;

  location = loc.Location();

  try {

      bool _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          location_per = false;
          print("inside last known position");
          //TOdo add lastknow position to sahredpreference
        return await Geolocator().getLastKnownPosition();
//        return Position(latitude: null, longitude: null);
        }
      }

//    showDialog(
//        context: context,
//        builder: (_) => WillPopScope(
//            onWillPop: () => Future.value(false),
//            child: Material(
//              color: Colors.transparent,
//              child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      CircularProgressIndicator(),
//                      SizedBox(height: 10),
//                      Text('Getting your Location', style: TextStyle(color: Colors.white),)
//                    ],
//                  )),
//            )));


    Position userPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(  'Lat and long are ${userPosition.latitude} ${userPosition.longitude}');

    return userPosition;

//    final coordinates =
//    new Coordinates(userPosition.latitude, userPosition.longitude);
//    var addresses =
//    await Geocoder.local.findAddressesFromCoordinates(coordinates);
//    var first = addresses.first;
//    setState(() {
//      position = userPosition;
//      mapSearchValue = first.addressLine;
//      _showMarker = isSelected = true;
//      locationTextController.text = mapSearchValue;
//    });
//    LatLng latlog = new LatLng(position.latitude, position.longitude);
//    _mapController.onReady.then((value) => _mapController.move(latlog, 12));
//    Navigator.of(context, rootNavigator: true).pop();
//    setState(() => locating = false);
    // print("${first.featureName} : ${first.addressLine}");
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
  print("yr "+c_yr);
  print("mnth "+c_mnt);
  print("c_day "+c_day.toString());

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

