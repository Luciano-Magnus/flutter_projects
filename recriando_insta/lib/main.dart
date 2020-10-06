import 'package:flutter/material.dart';
import 'package:recriando_insta/pages/home_page.dart';
import 'package:recriando_insta/themes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recriando Instagram',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

