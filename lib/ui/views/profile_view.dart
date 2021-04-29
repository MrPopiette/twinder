import 'package:flutter/material.dart';
import 'package:twinder/models/user.dart';
import 'package:twinder/network/user_network.dart';

class ProfileView extends StatefulWidget {
  final String userId;

  ProfileView({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  ProfileViewState createState() {
    return ProfileViewState();
  }
}

class ProfileViewState extends State<ProfileView> {
  late Future<User> _userFuture;

  Widget _buildProfileContent(User user) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [_buildUserDetails(user), _buildUserPosts()],
        ),
      ),
    );
  }

  Widget _buildUserDetails(User user) {
    return Container(
      height: 416,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sampleBackground.png'),
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 72,
          ),
          Image(
            image: AssetImage("assets/images/user.png"),
            width: 128,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "${user.firstName} ${user.lastName} ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(64, 0, 64, 0),
            child: Container(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    mini: true,
                    elevation: 0,
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.person,
                        size: 32,
                      ),
                      shape: CircleBorder(side: BorderSide(color: Colors.white, width: 1.0)),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      onPressed: null,
                    ),
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.favorite),
                    onPressed: () {},
                    mini: true,
                    elevation: 0,
                    backgroundColor: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserPosts() {
    return Container(
      height: 100,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: "POSTS"),
                Tab(text: "J'AIME"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _userFuture = getUserById(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ],
      ),
      // body: _buildProfileContent(),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          Widget content;

          if (snapshot.connectionState != ConnectionState.done) {
            content = Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            User? user = snapshot.data;
            content = _buildProfileContent(user!);
          } else {
            content = Container();
          }

          return Container(
            child: content,
          );
        },
      ),
    );
  }
}
