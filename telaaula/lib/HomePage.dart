import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telaaula/Const/ConstAPP.dart';
import 'BodyAPP.dart';
import 'DrawerBody.dart';
import 'HeadersAPP.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int dropDownValue = 1;
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              //arrumar
              child: Image.asset(
                ConstsApp.logo,
                fit: BoxFit.cover,
                height: 55,
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: DrawerBody(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: HeadersApp(),
          ),
          BodyAPP()
        ],
      ),
    );
  }
}
