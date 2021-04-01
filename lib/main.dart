import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Mahe Ramdaan App',
      theme: ThemeData(

        primarySwatch: kPrimaryColor_123,
      ),
      home: HomePage(title:"Home Page"),

    );
  }
}

