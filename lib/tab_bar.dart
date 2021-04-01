import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/test_guj.dart';
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
          drawer: SideDrawer(),
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

