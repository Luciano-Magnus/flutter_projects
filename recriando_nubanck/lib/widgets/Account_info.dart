import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:recriando_nubanck/themes/colors.dart';

class AccountInfo extends StatelessWidget {
  final bool isExpaned;

  const AccountInfo({this.isExpaned});

  @override
  Widget build(BuildContext context) {
    var Icone = Icons.help_outline;
    return AnimatedContainer(
      height: isExpaned ? MediaQuery.of(context).size.height * .6 : 0,
      duration: Duration(milliseconds: 400),
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerAccountInfo(),
            optionsInfo(),
          ],
        ),
      ),
    );
  }

  Widget headerAccountInfo() {
    return Container(
      child: Column(
        children: [
          QrImage(
            data: 'https://www.facebook.com/luciano.magnus.1',
            version: QrVersions.auto,
            foregroundColor: kPrimaryColor,
            size: 100,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Agência 0001 Conta 9383141-2',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            'Banco 260 - Nu Pagamentos S.A.',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget optionsInfo() {
    return Container(
      child: Column(
        children: [
          createOption(
            icon: Icons.help_outline,
            textOption: 'Me ajuda',
          ),
          createOption(
            icon: Icons.person_outline,
            textOption: 'Perfil',
          ),
          createOption(
            icon: Icons.settings,
            textOption: 'Configurar conta',
          ),
          createOption(
            icon: Icons.credit_card,
            textOption: 'Configurar cartão',
          ),
          createOption(
            icon: Icons.shopping_cart,
            textOption: 'Pedir conta PJ',
          ),
          createOption(
            icon: Icons.smartphone,
            textOption: 'Configurações do app',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              width: 300,
              child: OutlineButton(
                child: Expanded(
                  child: Text(
                    'SAIR DA CONTA', style: TextStyle(color:  Colors.white),
                  ),
                ),
                borderSide: BorderSide(
                  color: Colors.white,
                ), onPressed: () {  },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class createOption extends StatelessWidget {
  final IconData icon;
  final String textOption;

  const createOption({this.icon, this.textOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Divider(
            color: Colors.white,
            height: 20,
            thickness: 1,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Text(
                textOption,
                style: TextStyle(color: Colors.white),
              )),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
