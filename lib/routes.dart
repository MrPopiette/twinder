// https://www.youtube.com/watch?v=nyvwx7o277U
// https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/

import 'package:flutter/material.dart';
import 'package:twinder/ui/views/login.dart';
import 'package:twinder/ui/views/register.dart';
import 'package:twinder/ui/views/timeline.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Récupération des arguments passé à l'appel du Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      //Route Login
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      //Route Register
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterView());
      //Route Timeline
      case '/timeline':
        return MaterialPageRoute(builder: (_) => TimelineView(data: args));
      // Pas de route dans le switch statement
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
