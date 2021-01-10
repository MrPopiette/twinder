import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginBackgroundPurple.png'),
            fit: BoxFit.cover,
          ),
        ),
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
