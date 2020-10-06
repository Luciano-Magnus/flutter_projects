import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonIdentification extends StatelessWidget {
  String nomeUsuario = 'Luciano';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo_nubanck.png',
          width: 50,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            nomeUsuario,
            style: TextStyle(color: Colors.white, fontSize: 22,
            fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
