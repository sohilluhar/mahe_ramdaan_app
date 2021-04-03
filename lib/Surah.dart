import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/Pdf_view.dart';
import 'package:mahe_ramdaan_app/constants.dart';

import 'components/card_ui.dart';

class Surah extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var sizeWi = size.width * 0.9;
    final TabPages = <Widget>[
      surahEnglish(context),
      surahGujarati(context),

    ];

    final tabList = <Tab>[
      Tab(text: "English",),
      Tab(text: "Gujarati",)
    ];

    getTabBar(){
      return  TabBar( tabs: [
        Tab(text: "English",),
        Tab(text: "Gujarati",)
      ]);
    }

    return DefaultTabController(length: tabList.length,
       child:

       Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: getTabBar(),
        ),

      ),
    body:

    TabBarView(
      children: TabPages,
    ),


       ),
    );
  }


  surahEnglish(context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var sizeWi = size.width * 0.9;
    return

      SingleChildScrollView(
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          SizedBox(height: 16),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left: sizeWi * 0.05, right: sizeWi * 0.05),
              child: InkWell(
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  onTap: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => PDFScreen(path: "lib/assets/pdf/quran_sharif.pdf",title: "Quraan Sharif")),);

    }
    ,

                  child:
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Complete Quraan",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),


                  ))
          ),
          SizedBox(height: 16),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left: sizeWi * 0.05, right: sizeWi * 0.05),
              child: InkWell(
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  onTap: () {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDFScreen(path: "lib/assets/pdf/Surah-Yaseen-in-Arabic.pdf",title: "Surah Yaseen")),);


                  },
                  child:
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Surah Yaseen",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),


                  ))
          ),

          SizedBox(height: 16),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left: sizeWi * 0.05, right: sizeWi * 0.05),
              child: InkWell(
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  onTap: () {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDFScreen(path: "lib/assets/pdf/Surah-Fatiha-in-Arabic.pdf",title: "Surah Fatiha")),);


                  },
                  child:
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Surah Fatiha",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),


                  ))
          ),

          SizedBox(height: 16),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left: sizeWi * 0.05, right: sizeWi * 0.05),
              child: InkWell(
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  onTap: () {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDFScreen(path: "lib/assets/pdf/Surah-Mulk-in-Arabic.pdf",title: "Surah Mulk")),);


                  },
                  child:
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Surah Mulk",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),


                  ))
          ),

          SizedBox(height: 16),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left: sizeWi * 0.05, right: sizeWi * 0.05),
              child: InkWell(
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  onTap: () {

                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PDFScreen(path: "lib/assets/pdf/Surah-Qadr-in-Arabic.pdf",title: "Surah Qadr")),);


                  },
                  child:
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Surah Qard",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                                      ))
          ),


        ]
    ));

  }

  surahGujarati(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    var sizeWi = size.width * 0.9;
    return
      SingleChildScrollView(
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          SizedBox(height: 16),
          Card(
              color: kPrimaryColor,
              margin: EdgeInsets.only(left: sizeWi * 0.05, right: sizeWi * 0.05),
              child: InkWell(
                  splashColor: kPrimaryColor.withOpacity(0.1),
                  onTap: () {},
                  child:
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Text(
                          "Coming Soon ...",
                          style: TextStyle(fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                            alignment: Alignment.center,
                            color: Colors.white,
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {

                            }
                        )
                      ],
                    ),

                  ))
          ),
          SizedBox(height: 16),

        ]
    ));
  }


}