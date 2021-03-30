import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';


import 'components/body.dart';
import 'constants.dart';
import 'home.dart';
import '../demo-card.dart';
import 'main.dart';

const _kPages = <String, IconData>{
  'home': Icons.home,
  'map': Icons.book,
  'add': Icons.add,
  'message': Icons.message,
  'people': Icons.house,
};

class ConvexAppExample extends StatefulWidget {
  var title;


  ConvexAppExample({Key key, this.title}) : super(key: key);


//  static String get s => null;

  @override
  _ConvexAppExampleState createState() => _ConvexAppExampleState();
}

class _ConvexAppExampleState extends State<ConvexAppExample> {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(widget.title),

          ),
          body: Column(
          children: [
//            _buildStyleSelector(),
            const Divider(),
            Expanded(
              child: TabBarView(
                children: [
                  Home(),
                  _DemoSectionOptionsItem(title: "Test"),
                MyHomePage(title:"test"),
                  Icon(Icons.people, size: 64),
                  Icon(Icons.people, size: 64),
                  ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          // Optional badge argument: keys are tab indices, values can be
          // String, IconData, Color or Widget.
          /*badge=*/ const <int, dynamic>{3: ''},
          style: _tabStyle,
          items: <TabItem>[
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key),
          ],
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }

  // Select style enum from dropdown menu:
  Widget _return_counter() {
    int _counter = 0;

    void _incrementCounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        _counter++;
      });
    }
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),RaisedButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }


  // Select style enum from dropdown menu:
  Widget _return_homepage() {

    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            'One',
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }

}

class _DemoSectionOptionsItem extends StatelessWidget {
  const _DemoSectionOptionsItem({
    Key key,
    this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return

    SingleChildScrollView(
      child:   Column(children: [
        Column(children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(8),

            width: size.width*0.9,
            child:  Text(
              "Durood e Shifa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(8),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child:  Text(
              "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),),
          SizedBox(height: 24),
                    Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(8),

            width: size.width*0.9,
            child:  Text(
              "Durood e Shifa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(8),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child:  Text(
              "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),),
          SizedBox(height: 24),
                    Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(8),

            width: size.width*0.9,
            child:  Text(
              "Durood e Shifa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(8),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child:  Text(
              "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),),
          SizedBox(height: 24),
                    Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(8),

            width: size.width*0.9,
            child:  Text(
              "Durood e Shifa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(8),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child:  Text(
              "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),),
          SizedBox(height: 24),
                    Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(8),

            width: size.width*0.9,
            child:  Text(
              "Durood e Shifa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(8),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child:  Text(
              "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),),
          SizedBox(height: 24),
                    Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
            ),
            padding: EdgeInsets.all(8),

            width: size.width*0.9,
            child:  Text(
              "Durood e Shifa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),

            ),

            padding: EdgeInsets.all(8),
//            color: kPrimaryColor.withOpacity(0.2),
            width: size.width*0.9,
            child:  Text(
              "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),),
          SizedBox(height: 24),

        ]),
        SizedBox(height: 24),



      ])
    );

      Column(children: [
        Container(
          padding: EdgeInsets.all(8),

          width: size.width*0.9,color: kPrimaryColor,
          child:  Text(
          "Durood e Shifa",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
        ),
          ),
        Container(
          padding: EdgeInsets.all(8),
          color: kPrimaryColor.withOpacity(0.2),
          width: size.width*0.9,
            child:  Text(
          "اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا",
          style: TextStyle(fontSize: 20,color: Colors.black),
        ),)

      ]);
      Container(
      child:Card(
        color: kPrimaryColor,

        child: Card(
          child: Text("Hello"),
        ),
      )
    );

    final colorScheme = Theme.of(context).colorScheme;



    return Material(
      color: kPrimaryColor ,
      child: InkWell(
//        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: double.infinity),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2.apply(
              color:
              kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
