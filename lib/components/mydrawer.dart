import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../NewPage.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
//              UserAccountsDrawerHeader(
//                accountEmail: Text('test@gmail.com'),
//                accountName: Text('Julian Currie'),
////                otherAccountsPictures: [Icon(Icons.home), Icon(Icons.ac_unit)],
//                currentAccountPicture: CircleAvatar(
//                  backgroundImage: NetworkImage(
//                      'https://i7.pngguru.com/preview/633/903/703/hey-you-pikachu-pokemon-go-ash-ketchum-pikachu.jpg'),
//                ),
//              ),
              DrawerHeader(
//                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image:NetworkImage(
                      'https://videohive.img.customer.envatousercontent.com/files/193116419/Ramadan-Mubarak-Greetings-and-Wishes-Video-Template-Download.jpg?auto=compress%2Cformat&fit=crop&crop=top&max-h=8000&max-w=590&s=ee316413b101b7407f3b581b50d88f35'),

//                        AssetImage("assets/gold.jpg"),
                        fit: BoxFit.cover)
                ), child: null,
              ),
              ListTile(
                title: Text('Islamic Dates'),
                leading: Icon(Icons.event),
                onTap: () =>Navigator.of(context).push(NewPage(0)),
              ),
              ListTile(
                title: Text('Mahe Ramadaan Timing'),
                leading: Icon(Icons.access_time),
                onTap: () =>  Navigator.of(context).push(NewPage(1)),
              ),ListTile(
                title: Text('Namaz Timing'),
                leading: Icon(Icons.alarm),
                onTap: () =>  Navigator.of(context).push(NewPage(1)),
              ),ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () =>  Navigator.of(context).push(NewPage(1)),
              ),
              Divider(),
              ListTile(
                title: Text('Naat Lyrics'),
                leading: Icon(Icons.text_fields),
                onTap: () async =>{
//                  const url="http://naatsharif.in/";
                  await launch('http://naatsharif.in/')
                },
              ),
              ListTile(
                title: Text('Naat MP3'),
                leading: Icon(Icons.audiotrack),
                onTap: () async =>{
//                  const url="http://naatsharif.in/";
                  await launch('https://www.naatwap.com/')
                },
              ),
              ListTile(
                title: Text('Islamic Bayan'),
                leading: Icon(Icons.video_library),
                onTap: () async =>{
//                  const url="http://naatsharif.in/";
                  await launch('https://www.youtube.com/user/sdichannel')
                },
              ),
              Divider(),
              ListTile(
                title: Text('Special Thanks'),
                leading: Icon(Icons.people),
                onTap: () async =>{},
              ),

              ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.info_outline),
                onTap: () async =>{},
              ),

              ListTile(
                title: Text('Follow Us'),
                leading: Icon(Icons.person_add),
                onTap: () async =>{

                  await launch('https://instagram.com/mahe_ramadaan_app')
                },
              ),

              ListTile(
                title: Text('Rate'),
                leading: Icon(Icons.star),
                onTap: () async =>{},
              ),

              ListTile(
                title: Text('Share App'),
                leading: Icon(Icons.share),
                onTap: ()  =>{
                  Share.share("Hey checkout my new app https://instagram.com/mahe_ramadaan_app ")
                },
              ),

Divider(),
              ListTile(
                title: Text('Privacy Policy & Terms of Usage'),
//                leading: Icon(Icons.settings),
                onTap: () async =>{},
              ),

            ],
          ),
        ),
      ),
    );
  }
}