import 'package:flutter/material.dart';

class TimelineView extends StatelessWidget {
  final String data;

  TimelineView({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Timeline Screen"),
            Text(data),
          ], 
        ),
      ),
    );
  }
}