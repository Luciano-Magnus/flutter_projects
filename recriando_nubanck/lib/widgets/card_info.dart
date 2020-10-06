import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Card(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: [Expanded(child: mainBlock()), secundaryBlock()],
        ),
      ),
    );
  }

  Widget secundaryBlock() {
    return Container(
      height: 100,
      color: Colors.grey[200],
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: [
          Icon(
            Icons.home,
            size: 40,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'Compra mais recente em Microsoft Service',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }

  Widget mainBlock() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.credit_card,
                size: 32.0,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Cartão de credito',
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Spacer(),
          Text(
            'Fatura atual',
            style: TextStyle(fontSize: 14, color: Color.fromRGBO(0, 0, 0, 50)),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'R\$ 159,00',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blueAccent[400]),
          ),
          SizedBox(
            height: 8,
          ),
          Text.rich(
            TextSpan(
                text: 'Limite disponivel ',
                children: [
                  TextSpan(
                    text: 'R\$1.700',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
                style: TextStyle(fontSize: 18)),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
