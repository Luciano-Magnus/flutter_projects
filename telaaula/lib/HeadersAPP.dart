import 'package:flutter/material.dart';

import 'DropList.dart';

class HeadersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Salas Virtuais',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Periodo:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
          child: DropList(),
        )
      ],
    );
  }
}
