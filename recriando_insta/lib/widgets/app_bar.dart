import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Feather.camera, color: Colors.black87,),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(
            "assets/img/logo_insta.png",
            width: 90,
            height: 50,
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        IconButton(
          icon: Icon(FontAwesome.send, color: Colors.black87,),
          onPressed: () {},
        ),
      ],
    );
    //AppBar(
    //   centerTitle: true,
    //   title: Image.asset("assets/img/logo_insta.png"),
    //   leading: IconButton(
    //     icon: Icon(Feather.camera),
    //     onPressed: () {},
    //   ),
    //   actions: [
    //     IconButton(
    //       icon: Icon(Feather.tv),
    //       onPressed: () {},
    //     ),
    //     IconButton(
    //       icon: Icon(FontAwesome.send),
    //       onPressed: () {},
    //     )
    //   ],
    // );
  }
}
