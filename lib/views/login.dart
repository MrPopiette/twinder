import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Login Screen"),
            RaisedButton(
              child: Text('Timeline'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                '/timeline',
                  arguments: "Passage d'argument",
                );
              },
            ),
          ], 
        ),
      ),
    );
  }
}