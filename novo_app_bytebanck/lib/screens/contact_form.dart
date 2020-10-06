import 'package:flutter/material.dart';
import 'package:novo_app_bytebanck/database/app_database.dart';
import 'package:novo_app_bytebanck/models/contact.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome completo'),
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(labelText: 'Numero da conta'),
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accontNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accontNumber);
                    save(newContact)
                        .then((id) => Navigator.pop(context));
                  },
                  child: Text('Salvar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
