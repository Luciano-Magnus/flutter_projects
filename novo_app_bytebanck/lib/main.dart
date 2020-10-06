import 'package:flutter/material.dart';
import 'package:novo_app_bytebanck/database/app_database.dart';
import 'package:novo_app_bytebanck/models/contact.dart';
import 'package:novo_app_bytebanck/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBanck',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Dashbord(),
    );
  }
}
