import 'package:flutter/material.dart';
import 'package:twinder/ui/components/auth_form.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Inscription"),
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginBackgroundPink.png'),
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
                    margin: EdgeInsets.all(32),
                    child: AuthForm(
                      type: FormType.register,
                    ),
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(style: TextStyle(fontSize: 14), children: [
                  TextSpan(text: "En cliquant sur Inscription, vous reconnaissez avoir lu et approuvé les "),
                  TextSpan(
                    text: "Conditions générales d'utilisation",
                    style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " et la "),
                  TextSpan(
                    text: "Politique de confidentialité",
                    style: TextStyle(color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "."),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
