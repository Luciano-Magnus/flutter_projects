import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/todo_list.dart';

void main() {
  runApp(AppTodo());
}
Color primary = Colors.orange;

class AppTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(primaryColor: primary),
      title: "Lista de produtos",
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}
