import 'package:flutter/material.dart';
import 'package:twinder/models/post.dart';
import 'package:twinder/network/post_network.dart';

enum TimelineType { general, from, liked }

class Timeline extends StatefulWidget {
  final String userId;
  final TimelineType type;

  Timeline({
    required this.type,
    required this.userId,
  });

  @override
  TimelineState createState() {
    return TimelineState();
  }
}

class TimelineState extends State<Timeline> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<Post>> _postsFuture;

  Widget _buildList(List<Post> posts) {
    Widget result = Container(
      // controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1.0,
          ),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return _buildItem(posts[index]);
          },
        ),
      ),
    );
    return result;
  }

  Widget _buildItem(Post post) {
    // final ListTile item = ListTile(
    //   title: Padding(padding: EdgeInsets.only(bottom: 6.0), child: Text(post.content)),
    // );
    // return item;
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: ListTile(
              leading: Image(
                image: AssetImage("assets/images/user.png"),
                width: 58,
              ),
              title: Text(
                post.idSender.toString(),
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),

          Container(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              post.content.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
          ),

          // Container(),
        ],
      ),
    );
  }

  @override
  void initState() {
    if (widget.type == TimelineType.general) {
      _postsFuture = getPostsByFollows(widget.userId);
    } else if (widget.type == TimelineType.from) {
      _postsFuture = getPostsByUserId(widget.userId);
    } else if (widget.type == TimelineType.liked) {
      _postsFuture = getPostsByLikes(widget.userId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: _postsFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        Widget content;

        if (snapshot.connectionState != ConnectionState.done) {
          content = Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<Post>? items = snapshot.data;
          content = _buildList(items!);
        } else {
          content = Container();
        }

        return Container(
          child: content,
        );
      },
    );
  }
}
