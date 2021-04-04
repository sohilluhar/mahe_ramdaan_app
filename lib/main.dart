import 'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'tab_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const MaterialColor kPrimaryColor_123 = const MaterialColor(
    0xFF0C9869,
    const <int, Color>{
      50: const Color(0xFF0C9869),
      100: const Color(0xFF0C9869),
      200: const Color(0xFF0C9869),
      300: const Color(0xFF0C9869),
      400: const Color(0xFF0C9869),
      500: const Color(0xFF0C9869),
      600: const Color(0xFF0C9869),
      700: const Color(0xFF0C9869),
      800: const Color(0xFF0C9869),
      900: const Color(0xFF0C9869),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    setDefualtSharedPref();

    return MaterialApp(
      title: 'Mahe Ramdaan App',
      theme: ThemeData(

        primarySwatch: kPrimaryColor_123,
      ),
      home: HomePage(title:"Home"),

    );
  }

  Future<void> setDefualtSharedPref() async {

    SharedPreferences  pref =await SharedPreferences.getInstance();
print("inside shred pref");

    if (pref.containsKey("lang")){
      print("getting lang_opt");
      lang_opt=pref.getString("lang");
    }else{
      print("Setting lang_opt");
      pref.setString("lang", "Hin");
      lang_opt=pref.getString("lang");
    }

    if (pref.containsKey("date_correction")){
      date_correction_value=pref.getString("date_correction");
    }else{
      pref.setString("date_correction", "0");
      date_correction_value=pref.getString("date_correction");
    }

  }
}

