import 'package:flutter/material.dart';
import 'package:recriando_nubanck/themes/colors.dart';
import 'package:recriando_nubanck/widgets/Account_info.dart';
import 'package:recriando_nubanck/widgets/PersonIdentification.dart';
import 'package:recriando_nubanck/widgets/card_info.dart';
import 'package:recriando_nubanck/widgets/custom_bottom_app_bar.dart';
import 'package:recriando_nubanck/widgets/tab_option.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: PersonIdentification(),
        bottom: CustomBottomAppBar(
          isExpaned: _isExpanned,
          onTap: () {
            setState(() {
              _isExpanned = !_isExpanned;
            });
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
        child: Column(
          children: [
            AccountInfo(isExpaned: _isExpanned),
            Expanded(
              child: ListView(
                children: [
                  CardInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  CardInfo(),
                  SizedBox(
                    height: 20,
                  ),
                  CardInfo(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TabOption(),
          ],
        ),
      ),
    );
  }
}
