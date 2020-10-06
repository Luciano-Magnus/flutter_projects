import 'package:flutter/material.dart';
import 'package:recriando_insta/themes/colors.dart';
import 'package:recriando_insta/widgets/Custom_bottom.dart';
import 'package:recriando_insta/widgets/app_bar.dart';
import 'package:recriando_insta/widgets/custom_storys.dart';
import 'package:recriando_insta/widgets/custom_time_line.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomStorys(),
              CustomTimeLine(),
              CustomBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
