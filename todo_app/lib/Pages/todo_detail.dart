import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/Utils/database_helper.dart';

class TodoDetail extends StatefulWidget {
  final String appBarTitle;
  final Todo todo;

  TodoDetail(this.todo, this.appBarTitle);

  @override
  _TodoDetailState createState() {
    return _TodoDetailState(this.todo, this.appBarTitle);
  }
}

class _TodoDetailState extends State<TodoDetail> {
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Todo todo;

  TextEditingController barcodeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _TodoDetailState(this.todo, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    barcodeController.text = todo.barcode;
    descriptionController.text = todo.desc;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
                child: Text(
              appBarTitle,
              style: TextStyle(color: Colors.white),
            ),),
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white,),
              onPressed: () async{
               var barcode =  await scanBarcode();
               barcodeController.value = barcodeController.value.copyWith(text: barcode);
               print(barcodeController.text);
               updateBarcode();
               setState(() {

               });
              },
            )
          ],
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              moveToLastScreen();
            }),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Stack(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Código de barras',
                        labelStyle: textStyle,
                        suffix: SizedBox(
                          width: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (value) {
                      updateBarcode();
                    },
                    controller: barcodeController,
                    keyboardType: TextInputType.number,
                  ),
                  Visibility(
                      visible: true,
                      child: Align(
                        alignment: Alignment.centerRight,
                        heightFactor: 1.3,
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            barcodeController.value =
                                barcodeController.value.copyWith(text: '');
                            updateBarcode();
                            setState(() {});
                          },
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Stack(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: textStyle,
                        suffix: SizedBox(
                          width: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    onChanged: (value) {
                      updateDescription();
                    },
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                  ),
                  Visibility(
                      visible: true,
                      child: Align(
                        alignment: Alignment.centerRight,
                        heightFactor: 1.3,
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            descriptionController.value =
                                descriptionController.value.copyWith(text: '');
                            updateDescription();
                            setState(() {});
                          },
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        'Salvar',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if(barcodeController.text == null || barcodeController.text == ''
                        && descriptionController.text == null || descriptionController.text == ''){
                          _showAlertDialog('Status', 'Todos os campos devem ser preenchidos');
                        }else {
                          setState(() {
                            _save();
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text(
                        'Apagar',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _delete();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateBarcode() {
    todo.barcode = barcodeController.text;
  }

  void updateDescription() {
    todo.description = descriptionController.text;
  }

  void _save() async {
    moveToLastScreen();

    todo.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (todo.id != null) {
      result = await helper.updateTodo(todo);
    } else {
      result = await helper.insertTodo(todo);
    }

    if (result != 0) {
      _showAlertDialog('Status', 'Salvo com sucesso');
    } else {
      _showAlertDialog('Status', 'Ocorreu um erro!');
    }
  }

  void _delete() async {
    moveToLastScreen();

    if (todo.id == null) {
      _showAlertDialog('Status', 'Não há nada a deletar');
      return;
    }
    int result = await helper.deleteTodo(todo.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Deletado!');
    } else {
      _showAlertDialog('Status', 'Ocorreu um erro!');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Future<String> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (barcodeScanRes != null) {
      FlutterBeep.beep();
      return barcodeScanRes;
    }
    else {
      FlutterBeep.beep(false);
      return '';
    }
  }
}
