import 'package:flutter/material.dart';

class TabOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, indice) {
          return Row(
            children: [
              Container(
                width: 100,
                color: Color.fromRGBO(255, 255, 255, .2),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_add,
                        color: Colors.white,
                        size: 32,
                      ),
                      Spacer(),
                      Text(
                        'indicar amigos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: indice == 9 ? 20 : 5,),
            ],
          );
        },
      ),
    );
  }
}
