import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/Aboutus.dart';
import 'package:mahe_ramdaan_app/Pdf_view.dart';
import 'package:mahe_ramdaan_app/test_guj.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'NewPage.dart';
import 'Settings.dart';
import 'Surah.dart';
import 'add_location.dart';
import 'allMonthTiming.dart';
import 'components/mydrawer.dart';
import 'constants.dart';
import 'counters.dart';
import 'durood.dart';
import 'getGeoLocation.dart';
import 'home.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Surah': Icons.audiotrack,
  'Tasbih': Icons.add_circle_outline,
  'Durood': Icons.book,

};


class HomePage extends StatefulWidget {
  var title;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  TabStyle _tabStyle = TabStyle.react;
  String pathPDF = "lib/assets/pdf/MaheRamzanKaiseGuzareHindi.pdf";


//  Future<File> createFileOfPdfUrl() async {
//    Completer<File> completer = Completer();
//    print("Start download file from internet!");
//    try {
//      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
//      // final url = "https://pdfkit.org/docs/guide.pdf";
//      final url = "https://pdfkit.org/docs/guide.pdf";
//      final filename = url.substring(url.lastIndexOf("/") + 1);
//      var request = await HttpClient().getUrl(Uri.parse(url));
//      var response = await request.close();
//      var bytes = await consolidateHttpClientResponseBytes(response);
//      var dir = await getApplicationDocumentsDirectory();
//      print("Download files");
//      print("${dir.path}/$filename");
//      File file = File("${dir.path}/$filename");
//
//      await file.writeAsBytes(bytes, flush: true);
//      completer.complete(file);
//    } catch (e) {
//      throw Exception('Error parsing asset file!');
//    }
//
//    return completer.future;
//  }
//
//  Future<File> fromAsset(String asset, String filename) async {
//    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
//    Completer<File> completer = Completer();
//
//    try {
//      print("File Copied enter");
//
//
//      var dir;
//      PermissionStatus permissionResult = await SimplePermissions.requestPermission(Permission. WriteExternalStorage);
//      if (permissionResult == PermissionStatus.authorized){
//        // code of read or write file in external storage (SD card)
//        getApplicationDocumentsDirectory().then((directory) {
////          print(_directory);
//          dir = directory;
//        });
//      }
//
////      var dir = await getApplicationDocumentsDirectory();
//      print(dir.toString());
//
////      print("File path is ${dir.path}/$filename");
//      File file = File("${dir.path}/$filename");
//      print(asset);
//
//
//
//      var data = await rootBundle.load(asset);
//      var bytes = data.buffer.asUint8List();
//      await file.writeAsBytes(bytes, flush: true);
//      completer.complete(file);
//      print("File Copied completed");
//    } catch (e) {
//      throw Exception('Error parsing asset file!'+e.toString());
//    }
//
//    return completer.future;
//  }
//

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kPages.length,
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
          color: kPrimaryColor,
          image: DecorationImage(
              image:
//              NetworkImage(                  'https://videohive.img.customer.envatousercontent.com/files/193116419/Ramadan-Mubarak-Greetings-and-Wishes-Video-Template-Download.jpg?auto=compress%2Cformat&fit=crop&crop=top&max-h=8000&max-w=590&s=ee316413b101b7407f3b581b50d88f35'),

                        AssetImage("lib/assets/images/banner.png"),
              fit: BoxFit.cover)
      ), child: null,
    ),
//    ListTile(
//    title: Text('Islamic Dates'),
//    leading: Icon(Icons.event),
//    onTap: () =>Navigator.of(context).push(NewPage(0)),
//    ),
//    ListTile(
//    title: Text('Roza Timing'),
//    leading: Icon(Icons.access_time),
//      onTap: () => Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => AllMonthTiming()),
//      ),
//    ),
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
        ListTile(
          title: Text('Mahe Ramadaan kese guzare'),
          leading: Icon(Icons.book),
          onTap: () {
//            fromAsset('lib/assets/pdf/demo-link.pdf', 'demo.pdf').then((f) {
//              setState(() {
//                print("File Copied");
//                pathPDF = f.path;
//              });
//            });
//            createFileOfPdfUrl().then((f) {
//              setState(() {
//                pathPDF = f.path;
//              });
//            });
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => PDFScreen(path: pathPDF,title: "Mahe Ramadaan Kese Guzare")),);

          }),
    Divider(),
//    ListTile(
//    title: Text('Special Thanks'),
//    leading: Icon(Icons.people),
//    onTap: () =>{
////    Navigator.push(context,
////    MaterialPageRoute(builder: (context) => GetLocation()),)
//    },
//    ),

    ListTile(
    title: Text('About Us'),
    leading: Icon(Icons.info_outline),
    onTap: ()  =>{
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AboutUs()),
    ).then((value) => setState(() {})),

    },
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
    onTap: () async =>{

      await launch('http://play.google.com/store/apps/details?id=app.ramdaan.mahe_ramdaan_app')

//      http://play.google.com/store/apps/details?id=app.ramdaan.mahe_ramdaan_app
    },
    ),

    ListTile(
    title: Text('Share App'),
    leading: Icon(Icons.share),
    onTap: ()  =>{
    Share.share(share_msg_to_user)
    },
    ),
    ListTile(
    title: Text('Donate'),
    leading: Icon(Icons.attach_money),
    onTap: ()  async=>{

      await launch('upi://pay?pa=skyasky1@okicici&pn=Mahe Ramadaan Developer&tn=Donating for Mahe Ramadaan App')

    },
    ),

    Divider(),
    ListTile(
    title: Text('Privacy Policy'),
//                leading: Icon(Icons.settings),
    onTap: () async =>{

      await launch('https://mahe-ramadaan-card.flycricket.io/privacy.html')
    },
    ), ListTile(
    title: Text('Terms & Conditions'),
//                leading: Icon(Icons.settings),
    onTap: () async =>{

      await launch('https://mahe-ramadaan-card.flycricket.io/terms.html')
    },
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
                  Surah(),
                  Tasbeeh(),
                  Durood(),
//                  AllMonthTiming()
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

  getApplicationDocumentsDirectory() {

  }


}

