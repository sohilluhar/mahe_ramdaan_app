import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/test_guj.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'NewPage.dart';
import 'Settings.dart';
import 'components/mydrawer.dart';
import 'constants.dart';
import 'counterpg.dart';
import 'durood.dart';
import 'home.dart';


const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Durood': Icons.book,
  'Tasbih': Icons.add_circle_outline,
  'other': Icons.book,
};


class HomePage extends StatefulWidget {
  var title;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  TabStyle _tabStyle = TabStyle.react;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          drawer:
          Container(
      child: SafeArea(
      child: Drawer(
          child: ListView(
          children: [

          DrawerHeader(
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
    ),
    ListTile(
    title: Text('Settings'),
    leading: Icon(Icons.settings),
    onTap: () =>  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Settings()),
    ).then((value) => setState(() {})),
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
    ),ListTile(
    title: Text('Contact Us'),
    leading: Icon(Icons.mail),
    onTap: () async =>{
    await launch('mailto:maheramdaanapp@gmail.com')
    },
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
    )
        ,
          body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  Home(),
                  Durood(),
                  CounterPg(title:"test"),
                  Guj_test(),
                  ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:

        ConvexAppBar.badge(
          const <int, dynamic>{},
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          backgroundColor: kPrimaryColor,
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}

