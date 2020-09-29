import 'package:flutter/material.dart';
import 'package:prospectoscc/utils/alert.utils.dart';

class CardCircular extends StatelessWidget {
  final Text title;
  final Text estatus;
  final Text observations;
  final IconData icon;
  final void Function(String text) onChanged;
  final void Function(String text) validator;
  final TextEditingController controller;

  const CardCircular({
    Key key,
    this.controller,
    this.onChanged,
    this.validator,
    this.title,
    this.observations,
    this.estatus,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: Colors.green[100],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: this.title,
          ),
          ListTile(
            leading: Icon(this.icon),
            title: this.estatus,
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: this.observations,
          ),
          ButtonBar(children: [
            FlatButton(
              child: Text('Informar al prospecto ♥'),
              onPressed: () {
                mostrarAlerta(context, 'Mensaje enviado...!');
              },
            ),
            FlatButton(
              child: Text('+ Subir archivos'),
              onPressed: () {},
            ),
          ]),
        ],
      ),
    ));
  }
}
