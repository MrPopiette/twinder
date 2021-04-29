import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twinder/models/user.dart';

Future<User> getUserById(String id) async {
  //Requête
  final http.Response res = await http.get(Uri.http('10.0.2.2:3002', '/user/userbyid/$id'));

  if (res.statusCode == 200) {
    return User.fromJson(jsonDecode(res.body)[0]);
  } else {
    throw Exception("Erreur lors de la récupération de l'utilisateur");
  }
}
