import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twinder/models/post.dart';

Future<List<Post>> getPostsByFollows(String userId) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3002', '/post/timelinebyfollower/$userId'));

  if (res.statusCode == 200) {
    List<Post> result = [];
    json.decode(utf8.decode(res.bodyBytes)).forEach((t) => result.add(Post.fromJson(t)));
    return result;
  } else {
    throw Exception("Erreur lors de la récupération de l'utilisateur");
  }
}

Future<List<Post>> getPostsByUserId(String userId) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3002', '/post/timelinebyiduser/$userId'));

  if (res.statusCode == 200) {
    List<Post> result = [];
    json.decode(utf8.decode(res.bodyBytes)).forEach((t) => result.add(Post.fromJson(t)));
    return result;
  } else {
    throw Exception("Erreur lors de la récupération de l'utilisateur");
  }
}

Future<List<Post>> getPostsByLikes(String userId) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3002', '/post/likedposts/$userId'));

  if (res.statusCode == 200) {
    List<Post> result = [];
    json.decode(utf8.decode(res.bodyBytes)).forEach((t) => result.add(Post.fromJson(t)));
    return result;
  } else {
    throw Exception("Erreur lors de la récupération de l'utilisateur");
  }
}
