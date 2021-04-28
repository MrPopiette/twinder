import 'package:flutter/material.dart';

class NewPostView extends StatelessWidget {
  NewPostView({
    Key? key,
  }) : super(key: key);

  Widget _buildNewPostContent() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Qu’avez-vous à partager ?',
          contentPadding: EdgeInsets.all(8.0),
        ),
        autofocus: true,
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      height: 64,
      color: Colors.black26,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 4, 0),
            child: IconButton(
              icon: Icon(Icons.image),
              onPressed: () {},
              color: Colors.grey[300],
              iconSize: 28,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: IconButton(
              icon: Icon(Icons.map),
              onPressed: null,
              color: Colors.grey[300],
              iconSize: 28,
              enableFeedback: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: IconButton(
              icon: Icon(Icons.gif),
              onPressed: null,
              color: Colors.grey[300],
              iconSize: 28,
              enableFeedback: false,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouveau post"),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent,
                  padding: EdgeInsets.fromLTRB(32, 8, 32, 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {},
              child: Text('PUBLIER'),
            ),
          ),
        ],
      ),
      body: _buildNewPostContent(),
      bottomSheet: _buildBottomActions(),
    );
  }
}