import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.deepPurpleAccent,
                image: DecorationImage(
                  image: AssetImage('assets/images/sampleBackground.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Image(
                      image: AssetImage("assets/images/user.png"),
                      width: 64,
                    ),
                  ),
                  Text(
                    "Utilisateur",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.compass_calibration,
              color: Colors.pinkAccent,
            ),
            title: Text(
              'Timeline',
              style: TextStyle(color: Colors.pinkAccent),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/timeline');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.message,
              color: Colors.deepPurpleAccent,
            ),
            title: Text(
              'Messages',
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/messages');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text('Déconnexion'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
