import 'package:flutter/material.dart';

import 'appbar.dart';

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
    return MaterialApp(
      title: 'Mahe Ramdaan App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: kPrimaryColor_123,
      ),
      home: HomePage(title:"Home Page"),

    );
  }
}

