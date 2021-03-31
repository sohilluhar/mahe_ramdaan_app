import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/components/recomend_plants.dart';


import 'components/body.dart';
import 'constants.dart';
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

class ConvexAppExample extends StatefulWidget {
  var title;


  ConvexAppExample({Key key, this.title}) : super(key: key);


//  static String get s => null;

  @override
  _ConvexAppExampleState createState() => _ConvexAppExampleState();
}



class _ConvexAppExampleState extends State<ConvexAppExample> {
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

          body: Column(
          children: [
//            _buildStyleSelector(),

            Expanded(
              child: TabBarView(
                children: [
                  Home(),
                  Durood(),
                  MyHomePage(title:"test"),
                  Icon(Icons.people, size: 64),
                  Icon(Icons.people, size: 64),
                  ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:

        ConvexAppBar.badge(
          // Optional badge argument: keys are tab indices, values can be
          // String, IconData, Color or Widget.
          /*badge=*/

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

