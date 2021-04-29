import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({
    Key? key,
  }) : super(key: key);

  Widget _buildSearchContent() {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Qui recherchez-vous ?',
              contentPadding: EdgeInsets.all(8.0),
            ),
            autofocus: true,
          ),
          ListTile(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recherche"),
      ),
      body: _buildSearchContent(),
    );
  }
}
