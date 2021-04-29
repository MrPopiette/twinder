// https://www.youtube.com/watch?v=nyvwx7o277U
// https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/

import 'package:flutter/material.dart';
import 'package:twinder/ui/views/login_view.dart';
import 'package:twinder/ui/views/new_post_view.dart';
import 'package:twinder/ui/views/profile_view.dart';
import 'package:twinder/ui/views/register_view.dart';
import 'package:twinder/ui/views/search_view.dart';
import 'package:twinder/ui/views/timeline_view.dart';

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

      //DRAWER ---------------------------------------------------------------

      //Route Timeline
      case '/timeline':
        return MaterialPageRoute(builder: (_) => TimelineView(data: args.toString()));
      //Route Messages
      case '/messages':
        return _notImplementedRoute("Messages");
      //Route Profile
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      //Route Settings
      case '/settings':
        return _notImplementedRoute("Paramètres");

      //TIMELINE -------------------------------------------------------------

      //Route Search
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchView());
      //Route Notifications
      case '/notifications':
        return _notImplementedRoute("Notifications");
      //Route New post
      case '/new_post':
        return MaterialPageRoute(builder: (_) => NewPostView());

      // Pas de route dans le switch statement
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _notImplementedRoute(String name) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("$name"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32),
                child: Icon(
                  Icons.pending_actions_outlined,
                  size: 192,
                  color: Colors.grey[700],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Text(
                        'Cette fonctionnalité est en cours de développement. Revenez plus tard.',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ';-)',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erreur'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32),
                child: Icon(
                  Icons.warning_outlined,
                  size: 192,
                  color: Colors.grey[700],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Text(
                        'Page introuvable.',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ':-(',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
