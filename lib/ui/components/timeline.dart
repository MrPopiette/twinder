import 'package:flutter/material.dart';
import 'package:twinder/models/post.dart';

enum TimelineType { general, from, liked }
List<Post> sample = [new Post(), new Post(), new Post(), new Post(), new Post()];

class Timeline extends StatefulWidget {
  const Timeline({
    required this.type,
  });

  final TimelineType type;

  @override
  TimelineState createState() {
    return TimelineState();
  }
}

class TimelineState extends State<Timeline> {
  Widget _buildPost(Post post) {
    return Card(
      child: Column(
        children: [
          ListTile(),
          Container(),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque arcu sit nunc hendrerit facilisi faucibus."),
          Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
