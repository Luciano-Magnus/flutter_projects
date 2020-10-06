import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telaaula/Const/ConstAPP.dart';

class DrawerBody extends StatefulWidget {
  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    // child: Image.asset(ConstsApp.fotoPerfil),
                  ),
                  borderRadius: BorderRadius.circular(700),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Luciano',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Salas Virtuais'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Anotações de Aula'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Avisos'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Desempenho'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Frequência'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Laboratório Virtual'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Materiais de Apoio'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Mensagens'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Minha Biblioteca'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Minhas Turmas'),
          listTile(
              Icon(
                Icons.desktop_windows,
                color: Colors.white,
              ),
              'Pearson')
        ],
      ),
    );
  }

  listTile(Icon icon, String texto) {
    return ListTile(
      leading: icon,
      title: Text(
        texto,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {},
    );
  }
}
