import 'package:flutter/material.dart';

class EditProducts extends StatelessWidget {
  // const EditProducts({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(hintText: 'Node d'),
            maxLength: 40,
          ),
          new TextFormField(
            decoration: new InputDecoration(hintText: 'Celular'),
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
          new TextFormField(
            decoration: new InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 40,
          ),
          new SizedBox(height: 15.0),
          new ElevatedButton(
            onPressed: () {},
            child: new Text('Enviar'),
          )
        ],
      ),
    );
  }
}
