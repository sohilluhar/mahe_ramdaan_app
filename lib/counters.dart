import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/card_ui.dart';
import 'constants.dart';

class Tasbeeh extends StatefulWidget {


  @override

  _Tasbeeh createState() => _Tasbeeh();
}

class _Tasbeeh extends State<Tasbeeh> {


  int counter;


  Future<void> _incrementCounter() async {

    SharedPreferences  pref =await SharedPreferences.getInstance();
    pref.setInt("counter", counter+1);
    setState(() {

      counter++;

    });
  }

  Future<void> _resetCounter() async {

    SharedPreferences  pref =await SharedPreferences.getInstance();
    pref.setInt("counter", 0);
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      body: Align(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '$counter',
              style:  TextStyle(fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black),
            ),
            GestureDetector(
              onTap: _incrementCounter, // handle your image tap here
              child: Image.asset(
                'lib/assets/images/logo_counter.jpeg',
                fit: BoxFit.cover, // this is the solution for border
              ),
            ),
            // Image.asset('assets/images/gesture-tap.png'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {

    getSharedPref();

    }

  Future<void> getSharedPref() async {
    SharedPreferences  pref =await SharedPreferences.getInstance();

    if (pref.containsKey("counter")){
      counter=pref.getInt("counter");
      setState(() {

      });
    }else{
      pref.setInt("counter", 0);
      counter=pref.getInt("counter");
      setState(() {

      });
    }
  }


}



