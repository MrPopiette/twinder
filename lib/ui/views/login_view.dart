import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twinder/ui/components/auth_form.dart';

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(48),
                    child: Image(image: AssetImage('assets/images/logoTwinder.png')),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(32),
                    child: AuthForm(
                      type: FormType.login,
                    ),
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(style: TextStyle(fontSize: 16), children: [
                TextSpan(text: "Pas de Compte ? "),
                TextSpan(
                    text: "S'inscrire",
                    style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed(
                          '/register',
                          arguments: "Passage d'argument",
                        );
                      }),
              ]))
              // Text("Login Screen"),
              // RaisedButton(
              //   child: Text('Timeline'),
              //   onPressed: () {
              //     Navigator.of(context).pushNamed(
              //       '/timeline',
              //       arguments: "Passage d'argument",
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
