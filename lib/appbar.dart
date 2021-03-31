import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/components/recomend_plants.dart';
import 'package:mahe_ramdaan_app/test_guj.dart';
import '../NewPage.dart';
import 'components/body.dart';
import 'components/mydrawer.dart';
import 'constants.dart';
import 'counterpg.dart';
import 'durood.dart';
import 'home.dart';
import '../demo-card.dart';
import 'main.dart';

const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Durood': Icons.book,
  'Tasbih': Icons.add,
  'other': Icons.message,
  'Other2': Icons.house,
};


class HomePage extends StatefulWidget {
  var title;
  HomePage({Key key, this.title}) : super(key: key);
//  static String get s => null;
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  TabStyle _tabStyle = TabStyle.react;

  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),

          ),
          drawer: SideDrawer(),
          body: Column(
          children: [
//            _buildStyleSelector(),

            Expanded(
              child: TabBarView(
                children: [
                  Home(),
                  Durood(),
                  CounterPg(title:"test"),
                  Guj_test(),
                  Icon(Icons.people, size: 64),
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

