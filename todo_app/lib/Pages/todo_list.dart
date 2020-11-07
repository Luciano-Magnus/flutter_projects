import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Pages/todo_detail.dart';
import 'package:todo_app/Utils/database_helper.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Todo> todoList = List<Todo>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateList();
    print(todoList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de produtos', style: TextStyle(color: Colors.white),),
      ),
      body: getTodosListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          navigateToDetail(Todo('', '', ''), 'Adicionar');
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getTodosListView() {
    // ignore: missing_required_param
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        height: 0,
      ),
      itemCount: todoList.length,
      itemBuilder: (BuildContext context, int position) {
        Todo todo = todoList[position];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
              child: Text(getAvatar(todo.desc),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            title:
                Text(todo.desc, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código de barras: ' + todo.barcode, style: TextStyle(fontSize: 12.0),),
                Text(todo.date, style: TextStyle(color: Colors.grey, fontSize: 8.0),),
              ],
            ),
            trailing: InkWell(
              child: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  onTap: () {
                    _delete(context, todo);
                  }),
            ),
            onTap: () {
              navigateToDetail(todo, todo.barcode);
            },
          ),
        );
      },
    );
  }

  getAvatar(String desc) {
    if (desc.length < 2) {
      return '';
    } else {
      return desc.substring(0, 1).toUpperCase();
    }
  }

  void _delete(BuildContext context, Todo todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      _showSnackBar(context, 'Deletado...');
      updateList();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.orange,);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateList() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Todo>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {
        setState(() {
          this.todoList = todoList;
        });
      });
    });
  }

  void navigateToDetail(Todo todo, String title) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TodoDetail(todo, title);
    })).then((result) {
      if (result ?? true) {
        updateList();
      }
    });
  }
}
