//import 'package:flutter/material.dart';
//import 'package:geolocation/geolocation.dart';
//
//class GetUserLatLong extends StatefulWidget {
//  @override
//  _GetUserLatLongState createState() => _GetUserLatLongState();
//}
//
//class _GetUserLatLongState extends State<GetUserLatLong> {
//  String latitude = '00.00000';
//  String longitude = '00.00000';
//
//  _getCurrentLocation() async {
//    Geolocation.enableLocationServices().then((result) {
//      // Request location
//      // print(result);
//    }).catchError((e) {
//      // Location Services Enablind Cancelled
//      // print(e);
//    });
//
//    Geolocation.currentLocation(accuracy: LocationAccuracy.best)
//        .listen((result) {
//      if (result.isSuccessful) {
//        setState(() {
//          latitude = result.location.latitude.toString();
//          longitude = result.location.longitude.toString();
//        });
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Location"),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text("Lattitude is : ${latitude} And Longitude Is: ${longitude}"),
//            FlatButton(
//              child: Text("Get location"),
//              onPressed: () {
//                _getCurrentLocation();
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}