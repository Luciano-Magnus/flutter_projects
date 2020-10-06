import 'package:flutter/material.dart';
import 'HomePage.dart';
main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout aula',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
