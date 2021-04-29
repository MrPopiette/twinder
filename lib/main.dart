import 'package:flutter/material.dart';
import 'package:twinder/globals.dart' as globals;

// import 'package:twinder/const.dart';
import 'package:twinder/theme.dart';
import 'package:twinder/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twinder',
      theme: darkTheme,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
