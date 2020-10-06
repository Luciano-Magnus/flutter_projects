import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomBottom extends StatefulWidget {
  @override
  _CustomBottomState createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: 0,
      onTap: (i){},
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Foundation.home),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Feather.search),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Feather.plus_square),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: Icon(Feather.heart),
          title: Text(""),
        ),
        BottomNavigationBarItem(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network("https://scontent.fccm8-1.fna.fbcdn.net/v/t1.0-9/17201379_1001327859997162"
                "_8554383318038380163_n.jpg?_nc_cat=108&_nc_sid=09cbfe&_nc_ohc=CI8b8mE"
                "kxhoAX-Vw_2c&_nc_ht=scontent.fccm8-1.fna&oh=fe08e2ff04b1c099b58dca03d"
                "ae5e81b&oe=5F9C7D40", width: 30, height: 30,),
          ),
          title: Text(""),
        ),
      ],
    );
  }
}
