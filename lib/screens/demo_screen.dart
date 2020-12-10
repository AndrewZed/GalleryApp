import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context, {'name': 'Andrey'});
              },
              child: Text('Click Me!'))
        ],
      ),
    );
  }
}
