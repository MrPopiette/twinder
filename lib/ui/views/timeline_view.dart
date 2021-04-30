import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:twinder/ui/components/drawer_menu.dart';

import 'package:twinder/globals.dart' as globals;
import 'package:twinder/ui/components/timeline.dart';

class TimelineView extends StatelessWidget {
  TimelineView({
    Key? key,
  }) : super(key: key);

  Widget _buildTimelineContent() {
    var idUser = globals.loggedUser!.idUser;

    return Container(
      child: Timeline(
        type: TimelineType.general,
        userId: idUser.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timeline"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: null,
            // onPressed: () {
            //   Navigator.of(context).pushNamed('/notifications');
            // },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ],
      ),
      drawer: DrawerMenu(),
      body: _buildTimelineContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).pushNamed('/new_post');
        },
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
