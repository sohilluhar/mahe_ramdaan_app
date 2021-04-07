import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  _AboutUs createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('lib/assets/images/banner.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.fill),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '''

    About Us
              ''',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  aboutus
                ,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 24,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '''
    Developers
              ''',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),

            /*
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          children: <Widget>[
                            Text("sohil Luhar",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "sohil Luhar",
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )*/

            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              padding: const EdgeInsets.all(3.0),
              decoration:
              BoxDecoration(border: Border.all(color: kPrimaryColor)),
              child: new Container(
                child: new Row(
                  children: [
                    new Expanded(
                      child: new Container(
                        child: new Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                      ),
                      flex: 2,
                    ),
                    new Expanded(
                      child: new Container(
                        child: Text("Sohil Luhar"),
                      ),
                      flex: 6,
                    ),
        GestureDetector(
          onTap: () async {

            await launch('https://instagram.com/luhar__sohil');
          }, // handle your image tap here
          child:
                    new Expanded(

                      child: new Container(
                        child: Text("luhar__sohil"),
                      ),
                      flex: 4,
                    )),
                  ],
                ),
              ),
            ),
        SizedBox(height: 24,),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              padding: const EdgeInsets.all(3.0),
              decoration:
              BoxDecoration(border: Border.all(color: kPrimaryColor)),
              child: new Container(
                child: new Row(
                  children: [
                    new Expanded(
                      child: new Container(
                        child: new Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                      ),
                      flex: 2,
                    ),
                    new Expanded(
                      child: new Container(
                        child: Text("Saurabh Tiwari "),
                      ),
                      flex: 6,
                    ),
        GestureDetector(
          onTap: () async {

            await launch('https://instagram.com/__saurabh.tiwari__');
          }, // handle your image tap here
          child:
                    new Expanded(
                      child: new Container(
                        child: Text("__saurabh.tiwari__"),
                      ),
                      flex: 4,
                    )    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}




