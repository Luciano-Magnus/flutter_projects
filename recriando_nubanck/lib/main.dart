import 'package:flutter/material.dart';
import 'package:recriando_nubanck/pages/home_page.dart';
import 'package:recriando_nubanck/themes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone Nubanck',
      theme: ThemeData(
        // is not restarted.
        primaryColor: kPrimaryColor,
        accentColor: kSecundaria,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
