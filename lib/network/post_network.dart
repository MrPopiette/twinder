import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twinder/models/post.dart';

Future<List<Post>> getPostsByFollows(String userId) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3001', '/post/timelinebyfollower/$userId'));

  if (res.statusCode == 200) {
    var checkBody = jsonDecode(res.body);
    if (checkBody != '"check" -> false') {
      return parsePosts(res.body);
    } else {
      throw Exception("Aucun post n'a été trouvé");
    }
  } else {
    throw Exception("Erreur lors de la récupération des posts");
  }
}

Future<List<Post>> getPostsByUserId(String userId) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3001', '/post/timelinebyiduser/$userId'));

  if (res.statusCode == 200) {
    var checkBody = jsonDecode(res.body);
    if (checkBody != '"check" -> false') {
      return parsePosts(res.body);
    } else {
      throw Exception("Aucun post n'a été trouvé");
    }
  } else {
    throw Exception("Erreur lors de la récupération des posts");
  }
}

Future<List<Post>> getPostsByLikes(String userId) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3001', '/post/likedposts/$userId'));

  if (res.statusCode == 200) {
    var checkBody = jsonDecode(res.body);
    if (checkBody != '"check" -> false') {
      return parsePosts(res.body);
    } else {
      throw Exception("Aucun post n'a été trouvé");
    }
  } else {
    throw Exception("Erreur lors de la récupération des posts");
  }
}

// A function that converts a response body into a List<Photo>.
List<Post> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}
