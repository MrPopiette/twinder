import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:twinder/models/user.dart';
import 'package:twinder/network/auth_network.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum FormType { login, register }

class AuthForm extends StatefulWidget {
  const AuthForm({
    required this.type,
  });

  final FormType type;

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  Future<User>? _userFuture;
  User? user;

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
      fillColor: Color(0xAAFFFFFF),
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[800]),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(0.0),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                controller: emailController,
                decoration: _buildInputDecoration("Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email valide';
                  }
                  return null;
                },
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                controller: passwordController,
                decoration: _buildInputDecoration("Mot de passe"),
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe valide';
                  }
                  return null;
                },
              )),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    ElevatedButton button = ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.pinkAccent, padding: EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
          navOnLogin(context);
        }
      },
      child: Text('CONNEXION'),
    );

    if (_userFuture == null) {
      return button;
    } else {
      return FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          Widget buttonContent = button;

          if (snapshot.connectionState != ConnectionState.done) {
            buttonContent = Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            user = snapshot.data!;
            //Passage

            // buttonContent = Login();
          }

          return Container(
            child: buttonContent,
          );
        },
      );
    }
  }

  navOnLogin(context) async {
    _userFuture = authLogin(emailController.text, passwordController.text);
    setState(() {});
    if (user != null) {
      await Navigator.of(context).pushNamed(
        '/timeline',
        arguments: "Passage d'argument",
      );
    }
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Add TextFormFields and ElevatedButton here.
          Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                decoration: _buildInputDecoration("Prénom"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prénom valide';
                  }
                  return null;
                },
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                decoration: _buildInputDecoration("Nom"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom valide';
                  }
                  return null;
                },
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: DateTimeField(
              format: DateFormat("dd-MM-yyyy"),
              decoration: _buildInputDecoration("Date de Naissance"),
              onShowPicker: (context, currentValue) {
                return showDatePicker(context: context, firstDate: DateTime(1900), initialDate: currentValue ?? DateTime.now(), lastDate: DateTime(2100));
              },
              validator: (value) {
                if (value == null) {
                  return 'Veuillez entrer un date de naissance valide';
                }
                return null;
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                decoration: _buildInputDecoration("Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un email valide';
                  }
                  return null;
                },
              )),
          Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                decoration: _buildInputDecoration("Mot de passe"),
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe valide';
                  }
                  return null;
                },
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent, padding: EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Inscription réussi, veuillez vous connecter.')));
                Navigator.pop(context);
              }
            },
            child: Text('INSCRIPTION'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // if (user != null) {
    //   Navigator.of(context).pushNamed(
    //     '/timeline',
    //     arguments: "Passage d'argument",
    //   );
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == FormType.login) {
      return _buildLoginForm();
    } else if (widget.type == FormType.register) {
      return _buildRegisterForm();
    } else {
      return Container();
    }
  }
}

class Login extends StatefulWidget {
  const Login();

  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  void initState() {
    Navigator.of(context).pushNamed(
      '/timeline',
      arguments: "Passage d'argument",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
